import 'package:wha/app/modules/pharmacy/f_verify_patient_otp_module/widgets/widgets.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/pharmacy/f_verify_patient_otp_module/f_verify_patient_otp_controller.dart';
import 'package:sms_autofill/sms_autofill.dart';

class FVerifyPatientOtpPage extends GetView<FVerifyPatientOtpController> {
  const FVerifyPatientOtpPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.listenForOtp();
    controller.startTimer();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
          child: PhysicalModel(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            elevation: 30,
            child: Stack(
              children: [
                const BuildTopBar(),
                Obx(() {
                  return Opacity(
                    opacity: controller.isLoading ? 0.5 : 1.0,
                    child: SizedBox(
                      height: MediaQuery.of(context).size.height,
                      width: MediaQuery.of(context).size.width,
                      child: ListView(
                        children: <Widget>[
                          const SizedBox(height: 30),
                          SizedBox(
                            height: MediaQuery.of(context).size.height / 4,
                            child: const Center(
                              child: Image(
                                image: AssetImage(
                                  'assets/logo.png',
                                ),
                                height: 50,
                              ),
                            ),
                          ),
                          const SizedBox(height: 8),
                          const Padding(
                            padding: EdgeInsets.symmetric(vertical: 8.0),
                            child: Text(
                              'Phone Number Verification',
                              style: TextStyle(
                                  fontWeight: FontWeight.bold, fontSize: 22),
                              textAlign: TextAlign.center,
                              softWrap: true,
                            ),
                          ),
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
                          const SizedBox(height: 20),
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
                                      if (controller.receivedOtp
                                              .toString()
                                              .length ==
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
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
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
                                  style: TextStyle(
                                      color: Colors.black54, fontSize: 15),
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
          ),
        ),
      ),
    );
  }
}
