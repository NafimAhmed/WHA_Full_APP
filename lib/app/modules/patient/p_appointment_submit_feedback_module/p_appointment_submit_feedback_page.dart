import 'package:wha/app/modules/patient/p_appointment_submit_feedback_module/p_appointment_submit_feedback_controller.dart';
import 'package:wha/app/routes/app_pages.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PAppointmentSubmitFeedbackPage
    extends GetView<PAppointmentSubmitFeedbackController> {
  const PAppointmentSubmitFeedbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: size.height,
            width: size.width,
            decoration: const BoxDecoration(
                gradient: LinearGradient(
              colors: [Color(0xff08115c), Color(0xff08115c)],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            )),
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  controller.isAppointmentSucceed
                      ? const Icon(
                          Icons.thumb_up_outlined,
                          color: backgroundColor,
                          size: 50,
                        )
                      : const Text(
                          ':(',
                          style: TextStyle(
                            fontWeight: FontWeight.bold,
                            color: backgroundColor,
                            fontSize: 44,
                          ),
                        ),
                  const SizedBox(height: 30),
                  controller.isAppointmentSucceed
                      ? Text(
                          'Appointment Booked\nSuccessfully',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.center,
                          softWrap: true,
                        )
                      : Text(
                          'Appointment Booking\nFailed',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold,
                            color: Colors.white70,
                            fontSize: 24,
                          ),
                          textAlign: TextAlign.center,
                          softWrap: true,
                        ),
                  const SizedBox(height: 8),
                  controller.isAppointmentSucceed
                      ? Text(
                          'Your appointment is confirmed',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold,
                            color: Colors.white60,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                          softWrap: true,
                        )
                      : Text(
                          'Your appointment is not confirmed\nPlease try again later',
                          style: GoogleFonts.openSans(
                            fontWeight: FontWeight.bold,
                            color: Colors.white60,
                            fontSize: 15,
                          ),
                          textAlign: TextAlign.center,
                          softWrap: true,
                        )
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 10.0,
            child: _buildDoneButton(size),
          ),
        ],
      ),
    );
  }

  Widget _buildDoneButton(Size size) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: SizedBox(
        height: 40,
        width: size.width - 20,
        child: ElevatedButton(
          onPressed: () {
            Get.offNamedUntil(Routes.P_DASHBOARD, (route) => false);
          },
          child: Center(
            child: controller.isAppointmentSucceed
                ? Text(
                    'Done',
                    style: GoogleFonts.openSans(
                      color: backgroundColor,
                    ),
                  )
                : Text(
                    'Close',
                    style: GoogleFonts.openSans(
                      color: backgroundColor,
                    ),
                  ),
          ),
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(10.0),
            backgroundColor: MaterialStateProperty.all(primaryColor),
          ),
        ),
      ),
    );
  }
}
