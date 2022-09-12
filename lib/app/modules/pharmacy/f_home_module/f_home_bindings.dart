import 'package:wha/app/modules/pharmacy/f_home_module/f_home_controller.dart';
import 'package:get/get.dart';

class FHomeBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FHomeController());
  }
}