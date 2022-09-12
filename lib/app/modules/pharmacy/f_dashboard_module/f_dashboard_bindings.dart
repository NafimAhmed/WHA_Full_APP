import 'package:wha/app/data/provider/provider.dart';
import 'package:wha/app/data/service/hotline.service.dart';
import 'package:wha/app/modules/pharmacy/f_chat_module/f_chat_controller.dart';
import 'package:wha/app/modules/pharmacy/f_dashboard_module/f_dashboard_controller.dart';
import 'package:wha/app/modules/pharmacy/f_home_module/f_home_controller.dart';
import 'package:wha/app/modules/pharmacy/f_profile_module/f_profile_controller.dart';
import 'package:wha/app/modules/pharmacy/f_settings_module/f_settings_controller.dart';
import 'package:get/get.dart';

class FDashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FDashboardController());
    Get.lazyPut(() => FHomeController());
    Get.lazyPut(() => FProfileController());
    Get.lazyPut(() => FChatController());
    Get.lazyPut(() => FSettingsController());

    Get.lazyPut(() => DoctorProvider());


    // general
    Get.lazyPut(() => HotlineService());
    Get.lazyPut(() => ConcernProvider());

    // vital sign
    Get.lazyPut(() => VitalSignQuestionProvider());
  }
}