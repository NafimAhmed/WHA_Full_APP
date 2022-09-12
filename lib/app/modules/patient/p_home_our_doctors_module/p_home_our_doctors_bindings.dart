import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_home_our_doctors_module/p_home_our_doctors_controller.dart';

class PHomeOurDoctorsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PHomeOurDoctorsController());
  }
}