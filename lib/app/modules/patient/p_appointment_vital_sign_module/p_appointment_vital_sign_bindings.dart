import 'package:wha/app/data/provider/provider.dart';
import 'package:wha/app/data/service/service.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_appointment_vital_sign_module/p_appointment_vital_sign_controller.dart';

class PAppointmentVitalSignBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PAppointmentVitalSignController());
    Get.lazyPut(() => VitalSignQuestionProvider());
    Get.lazyPut(() => VitalSignAnswerService());
  }
}