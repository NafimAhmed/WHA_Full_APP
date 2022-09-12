import 'package:wha/app/data/provider/provider.dart';
import 'package:wha/app/data/service/service.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_sign_up_module/p_sign_up_controller.dart';

class PSignUpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PSignUpController());
    Get.lazyPut(() => SignupPatientService());
    Get.lazyPut(() => UserProvider());
  }
}