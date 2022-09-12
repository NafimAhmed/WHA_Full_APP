import 'package:wha/app/data/service/service.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/nurse/n_sign_up_module/n_sign_up_controller.dart';

class NSignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => NSignUpController());
    Get.lazyPut(() => SignupPatientService());
  }
}