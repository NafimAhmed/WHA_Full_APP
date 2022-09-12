import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_settings_language_module/p_settings_language_controller.dart';

class PSettingsLanguageBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PSettingsLanguageController());
  }
}