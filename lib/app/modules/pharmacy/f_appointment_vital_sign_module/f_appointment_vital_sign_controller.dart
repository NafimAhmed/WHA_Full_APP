import 'dart:developer';

import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/data/provider/provider.dart';
import 'package:wha/app/data/service/service.dart';
import 'package:wha/app/routes/app_pages.dart';
import 'package:get/get.dart';

class FAppointmentVitalSignController extends GetxController {
  PatientWithNamePhone patientWithNamePhone =
      Get.arguments as PatientWithNamePhone;
  int doctorId = int.parse(Get.parameters['doctorId'].toString());
  int concernId = int.parse(Get.parameters['concernId'].toString());
  int slotId = int.parse(Get.parameters['slotId'].toString());
  String phone = Get.parameters['phone'].toString();

  final _isLoading = false.obs;
  final _buttonText = 'Skip'.obs;
  final RxList<VitalSignQuestion> _questions = <VitalSignQuestion>[].obs;
  final RxList<VitalSignAnswer> _answers = <VitalSignAnswer>[].obs;

  get isLoading => _isLoading.value;

  get buttonText => _buttonText.value;

  get questions => _questions.value;

  get answers => _answers.value;

  set isLoading(value) => _isLoading.value = value;

  set buttonText(value) => _buttonText.value = value;

  set questions(value) => _questions.value = value;

  set answers(value) => _answers.value = value;

  AppState appState = Get.find<AppState>();
  VitalSignQuestionProvider provider = Get.find<VitalSignQuestionProvider>();
  VitalSignAnswerService service = Get.find<VitalSignAnswerService>();

  submit() async {
    if (buttonText == 'Skip') {
      Get.toNamed(Routes.F_CONFIRM_PATIENT_DETAILS,
          arguments: patientWithNamePhone,
          parameters: <String, String>{
            'doctorId': doctorId.toString(),
            'concernId': concernId.toString(),
            'slotId': slotId.toString(),
            'phone': phone,
            'otp': '0',
          });
    } else if (buttonText == 'Next') {
      isLoading = true;
      bool isSucceed = await service.submitVitalSignAnswers(answers: answers);
      log('vital sign submit feedback: $isSucceed');
      isLoading = false;
      resetEverything();
      Get.toNamed(Routes.F_CONFIRM_PATIENT_DETAILS,
          arguments: patientWithNamePhone,
          parameters: <String, String>{
            'doctorId': doctorId.toString(),
            'concernId': concernId.toString(),
            'slotId': slotId.toString(),
            'phone': phone,
            'otp': '0',
          });
    }
  }

  updateQuestions() async {
    if ((questions as List<VitalSignQuestion>).isEmpty) {
      isLoading = true;
      try {
        if ((appState.vitalSignQuestions as List<VitalSignQuestion>)
            .isNotEmpty) {
          List<VitalSignQuestion> _qs = appState.vitalSignQuestions;
          _questions.assignAll(_qs);
          addAllAnswer(questions);
        } else if ((appState.vitalSignQuestions as List<VitalSignQuestion>)
            .isEmpty) {
          List<VitalSignQuestion> _qs = await provider.getVitalSignQuestions();
          _questions.assignAll(_qs);
          addAllAnswer(questions);
        }
      } catch (_) {
        log(_.toString());
      }
      isLoading = false;
    }
  }

  updateSecondAnswer(int id, String answer) {
    int index = (answers as List<VitalSignAnswer>)
        .indexWhere((element) => element.id == id);
    if (index != -1) {
      (answers as List<VitalSignAnswer>)[index].secondAnswer = answer;
    }
    updateButtonText();
  }

  updateFirstAnswer(int id, String answer) {
    int index = (answers as List<VitalSignAnswer>)
        .indexWhere((element) => element.id == id);
    if (index != -1) {
      (answers as List<VitalSignAnswer>)[index].firstAnswer = answer;
    }
    updateButtonText();
  }

  updateButtonText() {
    _buttonText.value = 'Skip';
    for (VitalSignAnswer answer in answers) {
      if (answer.firstAnswer != '' || answer.secondAnswer != '') {
        _buttonText.value = 'Next';
      }
    }
  }

  addAllAnswer(List<VitalSignQuestion> qns) {
    for (VitalSignQuestion q in qns) {
      addAnswer(q);
    }
  }

  addAnswer(VitalSignQuestion question) {
    VitalSignAnswer answer = VitalSignAnswer(
        id: question.id,
        patientId: patientWithNamePhone.id,
        firstAnswer: '',
        secondAnswer: '');
    if ((answers as List<VitalSignAnswer>).isEmpty) {
      _answers.add(answer);
    } else {
      Iterable<VitalSignAnswer> existingAnswer =
          (answers as List<VitalSignAnswer>)
              .where((element) => element.id == answer.id);
      if (existingAnswer.isEmpty) {
        _answers.add(answer);
      }
    }
  }

  resetEverything() async {
    try {
      _answers.clear();
      addAllAnswer(questions);
      refresh();
      updateButtonText();
    } catch (_) {
      log(_.toString());
    }
  }
}
