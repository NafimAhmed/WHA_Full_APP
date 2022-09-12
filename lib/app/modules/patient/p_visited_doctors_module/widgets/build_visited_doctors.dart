import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildVisitedDoctors extends StatelessWidget {
  const BuildVisitedDoctors({Key? key, required this.doctor}) : super(key: key);
  final Doctor doctor;

  @override
  Widget build(BuildContext context) {
    return PhysicalModel(
      color: backgroundColor,
      elevation: 1,
      child: SizedBox(
        width: 150,
        height: 180,
        child: Padding(
          padding: const EdgeInsets.fromLTRB(5, 10, 5, 10),
          child: Column(
            children: [
              ClipOval(
                child: Image.network(
                  'https://thumbs.dreamstime.com/b/cartoon-doctor-little-girl-character-simple-cute-funny-illustration-106630241.jpg',
                  fit: BoxFit.fill,
                  height: 70,
                  width: 70,
                ),
              ),
              const SizedBox(height: 15),
              Text(
                'Dr. Amirul Hasan',
                style: GoogleFonts.openSans(
                  color: primaryColor,
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
              Text(
                'Sarjon Dentist',
                style: GoogleFonts.openSans(
                  color: primaryColor,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
