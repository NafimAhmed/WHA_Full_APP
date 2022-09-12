import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_home_module/p_home_controller.dart';

class PHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PHomeController());
  }
}