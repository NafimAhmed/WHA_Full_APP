import 'package:get/get.dart';
import 'package:wha/app/modules/organization/o_chat_module/o_chat_controller.dart';
import 'package:wha/app/modules/organization/o_dashboard_module/o_dashboard_controller.dart';
import 'package:wha/app/modules/organization/o_home_module/o_home_controller.dart';
import 'package:wha/app/modules/organization/o_profile_module/o_profile_controller.dart';
import 'package:wha/app/modules/organization/o_settings_module/o_settings_controller.dart';

class ODashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ODashboardController());
    Get.lazyPut(() => OHomeController());
    Get.lazyPut(() => OProfileController());
    Get.lazyPut(() => OChatController());
    Get.lazyPut(() => OSettingsController());
  }
}