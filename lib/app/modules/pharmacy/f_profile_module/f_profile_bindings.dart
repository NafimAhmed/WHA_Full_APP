import 'package:wha/app/modules/pharmacy/f_profile_module/f_profile_controller.dart';
import 'package:get/get.dart';

class FProfileBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FProfileController());
  }
}