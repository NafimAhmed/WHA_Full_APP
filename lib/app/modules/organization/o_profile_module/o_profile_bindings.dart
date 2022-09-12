import 'package:get/get.dart';
import 'package:wha/app/modules/organization/o_profile_module/o_profile_controller.dart';

class OProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OProfileController());
  }
}