import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PHomeVisitedDoctors extends StatelessWidget {
  PHomeVisitedDoctors({Key? key}) : super(key: key);
  final List<String> doctors = [
    'B',
    'A',
    'C'
  ];

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 10, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Doctors you have visited',
            style: GoogleFonts.openSans(
              color: primaryColor,
              fontWeight: FontWeight.bold,
              fontSize: 18,
            ),
          ),
          const SizedBox(height: 20),
          SingleChildScrollView(
            scrollDirection: Axis.horizontal,
            physics: const BouncingScrollPhysics(),
            child: Row(
              children: doctors.map((e) => _buildVisitedDoctor(e)).toList(),
            ),
          ),
        ],
      ),
    );
  }
  Widget _buildVisitedDoctor(String doctor){
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
