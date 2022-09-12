import 'package:get/get.dart';
import 'package:wha/app/modules/organization/o_settings_module/o_settings_controller.dart';

class OSettingsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OSettingsController());
  }
}