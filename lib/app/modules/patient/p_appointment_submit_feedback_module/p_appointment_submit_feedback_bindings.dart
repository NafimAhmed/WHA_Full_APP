import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_appointment_submit_feedback_module/p_appointment_submit_feedback_controller.dart';

class PAppointmentSubmitFeedbackBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PAppointmentSubmitFeedbackController());
  }
}