import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_choose_a_doctor_module/p_choose_a_doctor_controller.dart';

class PChooseADoctorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PChooseADoctorController());
  }
}