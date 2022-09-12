import 'dart:async';
import 'dart:developer';
import 'dart:math' as math;

import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/provider/provider.dart';
import 'package:wha/app/data/service/service.dart';
import 'package:wha/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:sms_autofill/sms_autofill.dart';

class VerifyOtpController extends GetxController {
  final phone = (Get.parameters['phone'] ?? '');
  final _sentOtp = 0.obs;
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

  final AppState appState = Get.find<AppState>();
  final OtpProvider otpProvider = Get.find<OtpProvider>();
  final JoinService joinService = Get.find<JoinService>();
  final UserProvider userProvider = Get.find<UserProvider>();
  final SharedPreferences sharedPreferences = Get.find<SharedPreferences>();
  Timer? timer;

  listenForOtp() {
    if (!isListening) {
      SmsAutoFill().listenForCode();
      log('sent: $sentOtp received: $receivedOtp phone: $phone');
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

  verify() async {
    Get.toNamed(Routes.SIGNUP_SELECT_ROLE);
    // log('received otp: $receivedOtp : $sentOtp');
    // if (receivedOtp.toString().length < 6) {
    //   error = '* please fill up the otp properly';
    // } else if (receivedOtp != sentOtp.toString()) {
    //   error = '* otp is not matching';
    // } else if (receivedOtp == sentOtp.toString()) {
    //   isLoading = true;
    //   bool isJoinSucceed = await joinService.join(phone: phone, otp: sentOtp);
    //   if (isJoinSucceed) {
    //     User? user =
    //         await userProvider.getUser(accessToken: appState.accessToken);
    //     if (user != null) {
    //       appState.user = user;
    //       sharedPreferences.setString('phone', phone);
    //       sharedPreferences.setInt('otp', sentOtp);
    //       isLoading = false;
    //       shouldStartTimer = false;
    //       if (timer != null) timer!.cancel();
    //       if (user is Patient) {
    //         Get.offAllNamed(Routes.P_DASHBOARD);
    //       } else if (user is Doctor) {
    //         Get.offAllNamed(Routes.D_DASHBOARD);
    //       } else if (user is Pharmacy) {
    //         Get.offAllNamed(Routes.F_DASHBOARD);
    //       } else if (user is Organization) {
    //         Get.offAllNamed(Routes.O_DASHBOARD);
    //       }
    //     } else {
    //       // join succeed but for some reason, profile data is not accessible
    //       isLoading = false;
    //       shouldStartTimer = false;
    //       if (timer != null) timer!.cancel();
    //       Get.offAllNamed(Routes.JOIN);
    //     }
    //   } else {
    //     isLoading = false;
    //     shouldStartTimer = false;
    //     if (timer != null) timer!.cancel();
    //     Get.toNamed(Routes.P_SIGN_UP, arguments: int.parse(receivedOtp), parameters: {'phone': phone});
    //   }
    // }
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
