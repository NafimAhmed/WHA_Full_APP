import 'dart:developer';

import 'package:wha/app/routes/app_pages.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildAnyAvailableDoctor extends StatelessWidget {
  const BuildAnyAvailableDoctor({Key? key, required this.concernId}) : super(key: key);
  final int concernId;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 10),
      child: InkWell(
        onTap: (){
          log('any available doctor confirmed: 0, concernId : $concernId');
          Get.toNamed(Routes.F_SEARCH_A_PATIENT,
              arguments: 0,
              parameters: {'concernId': '$concernId', 'slotId': '0'});
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
                          Icons.person,
                          color: primaryColor,
                          size: 30,
                        ),
                      ),
                    ),
                    const SizedBox(width: 15),
                    Text(
                      'Any available doctor',
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
