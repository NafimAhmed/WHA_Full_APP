import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildCurrentAppointment extends StatelessWidget {
  const BuildCurrentAppointment({Key? key, required this.appointment})
      : super(key: key);
  final CurrentAppointment appointment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 4, 15, 20),
      child: PhysicalModel(
        color: backgroundColor,
        elevation: 2,
        child: Column(
          children: [
            Container(
              height: 100,
              color: primaryColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Tomorrow',
                          style: GoogleFonts.openSans(
                            color: backgroundColor,
                            fontSize: 24,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          '11 February, 2021. 10.20 AM',
                          style: GoogleFonts.openSans(
                            color: backgroundColor,
                          ),
                        )
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15),
                    child: PhysicalModel(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(50),
                      child: const SizedBox(
                        height: 70,
                        width: 70,
                        child: Center(
                          child: Icon(
                            Icons.calendar_today_outlined,
                            color: primaryColor,
                            size: 32,
                          ),
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const Divider(color: backgroundColor, height: 0.3),
            Container(
              height: 99.7,
              color: primaryColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Padding(
                    padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                    child: ClipOval(
                      child: Image.network(
                        'https://www.pngkey.com/png/detail/19-198479_animated-desktop-backgrounds-drjattoanimated-animated-doctor.png',
                        fit: BoxFit.fill,
                        height: 70,
                        width: 70,
                      ),
                    ),
                  ),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Dr. Redowan',
                        style: GoogleFonts.openSans(
                          color: backgroundColor,
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        ),
                      ),
                      Text(
                        'MBBS, MSC, BCS',
                        style: GoogleFonts.openSans(
                          color: backgroundColor,
                          fontSize: 12,
                        ),
                      ),
                      Text(
                        'Dhaka Medical Hospital',
                        style: GoogleFonts.openSans(
                          color: backgroundColor,
                          fontSize: 10,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
