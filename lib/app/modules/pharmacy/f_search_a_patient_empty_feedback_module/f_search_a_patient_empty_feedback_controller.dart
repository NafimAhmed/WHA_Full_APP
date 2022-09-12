import 'dart:developer';

import 'package:wha/app/data/provider/provider.dart';
import 'package:wha/app/routes/app_pages.dart';
import 'dart:math' as math;
import 'package:get/get.dart';

class FSearchAPatientEmptyFeedbackController extends GetxController {
  int doctorId = Get.arguments as int? ?? 0;
  int concernId = int.parse(Get.parameters['concernId'].toString());
  int slotId = int.parse(Get.parameters['slotId'].toString());
  String phone = Get.parameters['phone'].toString();

  final _isLoading = false.obs;
  final _error = ''.obs;

  get isLoading => _isLoading.value;

  get error => _error.value;

  set isLoading(value) => _isLoading.value = value;

  set error(value) => _error.value = value;

  final OtpProvider otpProvider = Get.find<OtpProvider>();

  sendOtp() async {
    if (!isLoading) {
      isLoading = true;
      error = '';
      int otp = 100000;
      otp += math.Random.secure().nextInt(1000000 - otp);
      final int feedback = await otpProvider.sendOtp(number: phone, otp: otp);
      if (feedback == 1101) {
        log('sending otp for verification: $otp');
        Get.toNamed(Routes.F_VERIFY_PATIENT_OTP,
            arguments: doctorId,
            parameters: <String, String>{
              'concernId': '$concernId',
              'slotId': '$slotId',
              'phone': phone,
              'otp': '$otp'
            });
      } else if (feedback == 1004 || feedback == 1005) {
        error = 'Otp sending error!\n\nPlease check the number and try again.';
      } else {
        error = 'Otp sending error!\n\nPlease check the number and try again.';
      }
      isLoading = false;
    }
  }
}
