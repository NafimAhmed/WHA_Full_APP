import 'package:wha/app/data/provider/provider.dart';
import 'package:wha/app/modules/pharmacy/f_search_a_patient_empty_feedback_module/f_search_a_patient_empty_feedback_controller.dart';
import 'package:get/get.dart';

class FSearchAPatientEmptyFeedbackBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FSearchAPatientEmptyFeedbackController());
    Get.lazyPut(() => OtpProvider());
  }
}