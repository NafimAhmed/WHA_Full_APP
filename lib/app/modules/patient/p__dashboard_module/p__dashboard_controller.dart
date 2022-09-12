import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/data/provider/provider.dart';
import 'package:wha/app/data/service/service.dart';
import 'package:get/get.dart';

class PDashboardController extends GetxController {
  final AppState appState = Get.find();
  final ConcernProvider concernProvider = Get.find<ConcernProvider>();
  final VitalSignQuestionProvider vitalSignQuestionProvider = Get.find<VitalSignQuestionProvider>();
  final HotlineService hotlineService = Get.find<HotlineService>();

  updateHotlines() {
    if ((appState.concerns as List<Concern>).isEmpty) {
      concernProvider.getAllConcern();
    }
  }

  updateConcerns() {
    if ((appState.hotlines as List<Hotline>).isEmpty) {
      hotlineService.updateHotlines();
    }
  }
  updateVitalSignQuestions(){
    if((appState.vitalSignQuestions as List<VitalSignQuestion>).isEmpty){
      vitalSignQuestionProvider.updateVitalSignQuestions();
    }
  }
}
