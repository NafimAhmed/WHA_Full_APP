import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_settings_module/p_settings_controller.dart';

class PSettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PSettingsController());
  }
}