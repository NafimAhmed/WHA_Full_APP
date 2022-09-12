import 'package:wha/app/data/provider/provider.dart';
import 'package:wha/app/modules/pharmacy/f_verify_patient_otp_module/f_verify_patient_otp_controller.dart';
import 'package:get/get.dart';

class FVerifyPatientOtpBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FVerifyPatientOtpController());
    Get.lazyPut(() => OtpProvider());
  }
}