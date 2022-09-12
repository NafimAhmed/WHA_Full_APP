import 'package:get/get.dart';
import 'package:wha/app/modules/common/intro_module/intro_controller.dart';

class IntroBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => IntroController());
  }
}