import 'package:wha/app/modules/pharmacy/f_settings_module/f_settings_controller.dart';
import 'package:get/get.dart';

class FSettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FSettingsController());
  }
}