import 'package:flutter/services.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/user_management/verify_otp_module/verify_otp_controller.dart';
import 'package:sms_autofill/sms_autofill.dart';

class VerifyOtpPage extends GetView<VerifyOtpController> {
  const VerifyOtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarColor: primaryColor,
        systemNavigationBarDividerColor: primaryColor,
        systemStatusBarContrastEnforced: false,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    Size size = MediaQuery.of(context).size;

    controller.listenForOtp();
    controller.startTimer();
    return Scaffold(
      resizeToAvoidBottomInset: true,
      body: Stack(
        alignment: Alignment.center,
        children: [
          Positioned(
            top: -40.0,
            right: -40.0,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(100)
              ),
            ),
          ),
          Positioned(
            top: 50.0,
            right: 50.0,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(100)
              ),
            ),
          ),
          Positioned(
            bottom: -40.0,
            left: -40.0,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(100)
              ),
            ),
          ),
          Positioned(
            bottom: 60.0,
            left: 45.0,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(
                    width: 3,
                    color: secondaryColor
                ),
              ),
              child: Center(
                child: Image.asset(
                  'assets/icon.png',
                  height: 50,
                  width: 50,
                ),
              ),
            ),
          ),


          Obx(() {
            return Opacity(
              opacity: controller.isLoading ? 0.5 : 1.0,
              child: SizedBox(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                child: Center(
                  child: ListView(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    children: <Widget>[
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 30.0, vertical: 8),
                        child: RichText(
                          text: TextSpan(
                              text: "Enter the code sent to ",
                              children: [
                                TextSpan(
                                    text: controller.phone.toString(),
                                    style: const TextStyle(
                                        color: Colors.black,
                                        fontWeight: FontWeight.bold,
                                        fontSize: 15)),
                              ],
                              style: const TextStyle(
                                  color: Colors.black54, fontSize: 15)),
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                      ),
                      const SizedBox(height: 10),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                        child: PinFieldAutoFill(
                          currentCode: '',
                          onCodeSubmitted: (code) {
                            controller.receivedOtp = code;
                          },
                          onCodeChanged: controller.isLoading
                              ? null
                              : (code) {
                                  controller.receivedOtp = code;
                                  if (controller.receivedOtp.toString().length ==
                                      6) {
                                    controller.verify();
                                  }
                                },
                          codeLength: 6,
                        ),
                      ),
                      Obx(() {
                        return controller.error == ''
                            ? const SizedBox(height: 0, width: 0)
                            : Column(
                                crossAxisAlignment: CrossAxisAlignment.start,
                                children: [
                                  const SizedBox(height: 15),
                                  Padding(
                                    padding: const EdgeInsets.symmetric(
                                        horizontal: 30.0),
                                    child: Text(
                                      controller.error,
                                      style: const TextStyle(
                                          color: Colors.red,
                                          fontSize: 12,
                                          fontWeight: FontWeight.w400),
                                    ),
                                  ),
                                ],
                              );
                      }),
                      const SizedBox(height: 20),
                      Obx(() {
                        return Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            const Text(
                              "Didn't receive the code? ",
                              style:
                                  TextStyle(color: Colors.black54, fontSize: 15),
                            ),
                            controller.waitingTime != '00:00'
                                ? Text(controller.waitingTime)
                                : TextButton(
                                    onPressed: () => controller.isLoading
                                        ? null
                                        : controller.resend(),
                                    child: const Text(
                                      "RESEND",
                                      style: TextStyle(
                                          color: primaryColor,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 16),
                                    ),
                                  ),
                          ],
                        );
                      }),
                      const SizedBox(height: 14),
                      Obx(() {
                        return Container(
                          margin: const EdgeInsets.symmetric(
                              vertical: 16.0, horizontal: 30),
                          child: ButtonTheme(
                            height: 50,
                            child: TextButton(
                              onPressed: controller.isLoading
                                  ? null
                                  : () {
                                      controller.verify();
                                    },
                              child: Center(
                                  child: Text(
                                "VERIFY".toUpperCase(),
                                style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 18,
                                    fontWeight: FontWeight.bold),
                              )),
                            ),
                          ),
                          decoration: BoxDecoration(
                              color: primaryColor,
                              borderRadius: BorderRadius.circular(5),
                              boxShadow: [
                                BoxShadow(
                                    color: primaryColor.withAlpha(50),
                                    offset: const Offset(1, -2),
                                    blurRadius: 5),
                                BoxShadow(
                                    color: primaryColor.withAlpha(50),
                                    offset: const Offset(-1, 2),
                                    blurRadius: 5)
                              ]),
                        );
                      }),
                    ],
                  ),
                ),
              ),
            );
          }),
          Obx(() {
            return controller.isLoading
                ? const Positioned(
                    child: Center(
                      child: SpinKitCircle(
                        color: primaryColor,
                        size: 70,
                      ),
                    ),
                  )
                : const SizedBox(height: 0, width: 0);
          }),
        ],
      ),
    );
  }
}
