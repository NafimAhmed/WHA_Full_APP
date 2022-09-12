import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_profile_module/p_profile_controller.dart';

class PProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PProfileController());
  }
}