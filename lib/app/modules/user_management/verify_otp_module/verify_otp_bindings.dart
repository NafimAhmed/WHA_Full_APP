import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/provider/provider.dart';
import 'package:wha/app/data/service/service.dart';
import 'package:wha/app/modules/user_management/verify_otp_module/verify_otp_controller.dart';
import 'package:get/get.dart';

class VerifyOtpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => VerifyOtpController());
    Get.lazyPut(() => OtpProvider());
    Get.lazyPut(() => JoinService());
    Get.lazyPut(() => AppState());
    Get.lazyPut(() => UserProvider());
  }
}