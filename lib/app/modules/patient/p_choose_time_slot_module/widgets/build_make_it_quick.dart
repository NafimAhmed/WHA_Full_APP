import 'dart:developer';

import 'package:wha/app/routes/app_pages.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildMakeItQuick extends StatelessWidget {
  const BuildMakeItQuick(
      {Key? key, required this.doctorId, required this.concernId})
      : super(key: key);
  final int doctorId;
  final int concernId;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: InkWell(
        onTap: () {
          log('make it quick confirmed: doctorId: $doctorId, concernId: $concernId, slotId: 0');
          Get.toNamed(Routes.P_APPOINTMENT_VITAL_SIGN,
              arguments: doctorId,
              parameters: {'concernId': concernId.toString(), 'slotId': '0'});
        },
        child: PhysicalModel(
          color: backgroundColor,
          elevation: 1.0,
          child: Container(
            height: 80,
            width: size.width - 20,
            color: primaryColor,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    SizedBox(
                      height: 50,
                      width: 50,
                      child: PhysicalModel(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(50),
                        elevation: 8.0,
                        child: const Icon(
                          Icons.access_time_outlined,
                          color: primaryColor,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      'Make It Quick',
                      style: GoogleFonts.openSans(
                        color: backgroundColor,
                        fontSize: 18,
                      ),
                      textAlign: TextAlign.center,
                      softWrap: true,
                    ),
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
    );
  }
}
