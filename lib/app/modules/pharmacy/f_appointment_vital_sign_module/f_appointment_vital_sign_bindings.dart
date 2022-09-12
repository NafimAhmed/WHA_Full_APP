import 'package:wha/app/data/provider/provider.dart';
import 'package:wha/app/data/service/service.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/pharmacy/f_appointment_vital_sign_module/f_appointment_vital_sign_controller.dart';

class FAppointmentVitalSignBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FAppointmentVitalSignController());
    Get.lazyPut(() => VitalSignQuestionProvider());
    Get.lazyPut(() => VitalSignAnswerService());
  }
}