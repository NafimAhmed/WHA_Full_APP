import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PHomeHospitals extends StatelessWidget {
  PHomeHospitals({Key? key}) : super(key: key);
  final List<String> hospitals = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F'
  ];

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
          child: Text(
            'Hospitals',
            style: GoogleFonts.openSans(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
        ),
      ],
    );
  }
}
