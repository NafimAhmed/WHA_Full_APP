import 'package:get/get.dart';
import 'package:wha/app/modules/pharmacy/f_appointment_submit_feedback_module/f_appointment_submit_feedback_controller.dart';

class FAppointmentSubmitFeedbackBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FAppointmentSubmitFeedbackController());
  }
}