import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_settings_notifications_module/p_settings_notifications_controller.dart';

class PSettingsNotificationsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PSettingsNotificationsController());
  }
}