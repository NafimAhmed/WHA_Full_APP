import 'package:wha/app/data/service/service.dart';
import 'package:wha/app/modules/pharmacy/f_sign_up_module/f_sign_up_controller.dart';
import 'package:get/get.dart';

class FSignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FSignUpController());
    Get.lazyPut(() => SignupPharmacyService());
  }
}