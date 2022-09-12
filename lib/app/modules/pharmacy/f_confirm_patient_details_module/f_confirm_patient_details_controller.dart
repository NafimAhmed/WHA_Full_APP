import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/data/service/service.dart';
import 'package:wha/app/routes/app_pages.dart';
import 'package:get/get.dart';

class FConfirmPatientDetailsController extends GetxController {
  PatientWithNamePhone patientWithNamePhone =
      Get.arguments as PatientWithNamePhone;
  int doctorId = int.parse(Get.parameters['doctorId'].toString());
  int concernId = int.parse(Get.parameters['concernId'].toString());
  int slotId = int.parse(Get.parameters['slotId'].toString());
  String phone = Get.parameters['phone'].toString();

  final _isLoading = false.obs;
  final _isOtherPatient = false.obs;

  final DateTime appointmentTime = DateTime.now();
  final String purposeOfVisit = 'Consultation';
  final AppState appState = Get.find<AppState>();
  final AppointmentService appointmentService = Get.find<AppointmentService>();

  get isLoading => _isLoading.value;

  get isOtherPatient => _isOtherPatient.value;

  set isLoading(value) => _isLoading.value = value;

  set isOtherPatient(value) => _isOtherPatient.value = value;

  submitAppointment() async {
    isLoading = true;
    bool isSucceed = await appointmentService.submitAppointment(
      doctorId: doctorId,
      patientId: patientWithNamePhone.id,
      concernId: concernId,
      pharmacyId: (appState.user as Pharmacy).id,
      slotId: slotId,
    );
    isLoading = false;
    Get.toNamed(Routes.F_APPOINTMENT_SUBMIT_FEEDBACK, arguments: isSucceed);
  }
}
