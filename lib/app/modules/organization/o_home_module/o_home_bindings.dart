import 'package:get/get.dart';
import 'package:wha/app/modules/organization/o_home_module/o_home_controller.dart';

class OHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OHomeController());
  }
}