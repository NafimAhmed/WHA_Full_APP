import 'package:wha/app/modules/user_management/confirm_phone_module/confirm_phone_controller.dart';
import 'package:get/get.dart';

class ConfirmPhoneBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => ConfirmPhoneController());
  }
}