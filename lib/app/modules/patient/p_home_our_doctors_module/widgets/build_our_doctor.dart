import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildOurDoctor extends StatelessWidget {
  const BuildOurDoctor({Key? key, required this.doctor}) : super(key: key);
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
                  doctor.image,
                  fit: BoxFit.fill,
                  height: 70,
                  width: 70,
                  errorBuilder:(context, Object obj, StackTrace? trace){
                    return Image.network(
                      'https://thumbs.dreamstime.com/b/doctor-smile-208399616.jpg',
                      height: 70,
                      width: 70,
                    );
                  }
                ),
              ),
              const SizedBox(height: 15),
              Text(
                '${doctor.firstName} ${doctor.lastName}',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
              Text(
                doctor.profession == '' ? 'Health Specialist' : doctor.profession,
                style: GoogleFonts.openSans(
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
