import 'package:wha/app/modules/user_management/signup_select_role_module/signup_select_role_controller.dart';
import 'package:get/get.dart';

class SignupSelectRoleBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => SignupSelectRoleController());
  }
}