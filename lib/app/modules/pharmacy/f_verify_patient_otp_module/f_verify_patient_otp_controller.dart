import 'dart:async';
import 'dart:developer';

import 'package:wha/app/data/provider/provider.dart';
import 'package:wha/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:sms_autofill/sms_autofill.dart';
import 'dart:math' as math;

class FVerifyPatientOtpController extends GetxController{
  int doctorId = Get.arguments as int? ?? 0;
  int concernId = int.parse(Get.parameters['concernId'].toString());
  int slotId = int.parse(Get.parameters['slotId'].toString());
  String phone = Get.parameters['phone'].toString();
  final _sentOtp = (int.parse(Get.parameters['otp'].toString())).obs;
  final _receivedOtp = ''.obs;
  final _error = ''.obs;
  final _isLoading = false.obs;
  final _isListening = false.obs;
  final _waitingTime = '00.00'.obs;
  final _shouldStartTimer = true.obs;


  get sentOtp => _sentOtp.value;

  get receivedOtp => _receivedOtp.value;

  get error => _error.value;

  get isLoading => _isLoading.value;

  get isListening => _isListening.value;

  get waitingTime => _waitingTime.value;

  get shouldStartTimer => _shouldStartTimer.value;

  set sentOtp(value) => _sentOtp.value = value;

  set receivedOtp(value) => _receivedOtp.value = value;

  set error(value) => _error.value = value;

  set isLoading(value) => _isLoading.value = value;

  set isListening(value) => _isListening.value = value;

  set waitingTime(value) => _waitingTime.value = value;

  set shouldStartTimer(value) => _shouldStartTimer.value = value;

  final OtpProvider otpProvider = Get.find<OtpProvider>();
  Timer? timer;


  listenForOtp() {
    if (!isListening) {
      SmsAutoFill().listenForCode();
      isListening = true;
    }
  }
  startTimer() {
    if(shouldStartTimer){
      int minute = 5;
      int second = 0;
      if (timer == null) {
        timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          if (second == 0) {
            minute -= 1;
            second = 60;
          } else {
            second -= 1;
          }
          if (minute > -1) {
            waitingTime = '0$minute:${second < 10 ? '0$second' : second}';
          }
          if (minute == 0 && second == 0) timer.cancel();
          log(waitingTime);
        });
        timer!.tick;
      }
      if (timer != null && !timer!.isActive) {
        timer = Timer.periodic(const Duration(seconds: 1), (timer) {
          if (second == 0) {
            minute -= 1;
            second = 60;
          } else {
            second -= 1;
          }
          if (minute > -1) {
            waitingTime = '0$minute:${second < 10 ? '0$second' : second}';
          }
          if (minute == 0 && second == 0) timer.cancel();
          log(waitingTime);
        });
        timer!.tick;
      }
    }
  }
  resend() async {
    int otp = 100000;
    otp += math.Random.secure().nextInt(1000000 - otp);
    isLoading = true;
    int feedback = await otpProvider.sendOtp(number: phone, otp: otp);
    if (feedback == 1101){
      sentOtp = otp;
      log('otp reset feedback: $feedback : $sentOtp');
      shouldStartTimer = true;
      startTimer();
    }
    await waitASecond();
    isLoading = false;
  }
  verify() async {
    log('received otp: $receivedOtp : $sentOtp');
    if (receivedOtp.toString().length < 6) {
      error = '* please fill up the otp properly';
    } else if (receivedOtp != sentOtp.toString()) {
      error = '* otp is not matching';
    } else if (receivedOtp == sentOtp.toString()) {
      isLoading = false;
      shouldStartTimer = false;
      if (timer != null) timer!.cancel();
      Get.toNamed(Routes.F_ADD_PATIENT_DETAILS, arguments: doctorId, parameters: <String, String>{
        'concernId': concernId.toString(),
        'slotId': slotId.toString(),
        'phone': phone,
        'otp': receivedOtp,
      });
    }
  }

  Future<void> waitASecond() async => Future.delayed(const Duration(seconds: 1));
  @override
  void onClose() {
    shouldStartTimer = false;
    if (timer != null) {
      if (timer!.isActive) {
        timer!.cancel();
      }
    }
    SmsAutoFill().unregisterListener();
    super.onClose();
  }
}
