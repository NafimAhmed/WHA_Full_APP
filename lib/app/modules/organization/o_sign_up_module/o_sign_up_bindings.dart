import 'package:wha/app/data/service/service.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/organization/o_sign_up_module/o_sign_up_controller.dart';

class OSignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OSignUpController());
    Get.lazyPut(() => SignupOrganizationService());
  }
}