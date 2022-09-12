import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildPatientCard extends StatelessWidget {
  const BuildPatientCard({Key? key, required this.patient}) : super(key: key);
  final PatientWithNamePhone patient;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 20),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          PhysicalModel(
            color: backgroundColor,
            borderRadius: BorderRadius.circular(50),
            elevation: 8.0,
            child: ClipOval(
              child: Image.asset(
                'assets/person.jpg',
                fit: BoxFit.fill,
                height: 60,
                width: 60,
              ),
            ),
          ),
          const SizedBox(width: 15),
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                patient.firstName + ' ' + patient.lastName,
                style: const TextStyle(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                ),
              ),
              Text(
                patient.phone,
                style: GoogleFonts.openSans(
                  color: Colors.black,
                  fontSize: 13,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
