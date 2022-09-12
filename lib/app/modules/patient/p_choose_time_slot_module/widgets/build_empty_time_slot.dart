import 'dart:developer';
import 'package:wha/app/routes/app_pages.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildEmptyTimeSlot extends StatelessWidget {
  const BuildEmptyTimeSlot({Key? key, required this.doctorId, required this.concernId}) : super(key: key);
  final int doctorId;
  final int concernId;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height - 100,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: (){
                log('tap for any time confirmed: doctorId: $doctorId, concernId: $concernId, time: 0');
                Get.toNamed(Routes.P_APPOINTMENT_VITAL_SIGN,
                    arguments: doctorId,
                    parameters: {'concernId': concernId.toString(), 'slotId': '0'});
              },
              child: AvatarGlow(
                glowColor: primaryColor,
                endRadius: 50.0,
                duration: const Duration(seconds: 1),
                repeat: true,
                showTwoGlows: true,
                repeatPauseDuration: const Duration(milliseconds: 100),
                animate: true,
                child: PhysicalModel(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(50),
                  elevation: 10,
                  child: const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Icon(
                      Icons.access_time_outlined,
                      color: backgroundColor,
                      size: 50,
                    ),
                  ),
                ),
              ),
            ),
            const Text('Tap for any Time'),
            const SizedBox(height: 100),
          ],
        ),
      ),
    );
  }
}
