import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildOurPharmacy extends StatelessWidget {
  const BuildOurPharmacy({Key? key, required this.pharmacy}) : super(key: key);
  final Pharmacy pharmacy;

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
                    pharmacy.image,
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
                '${pharmacy.firstName} ${pharmacy.lastName}',
                style: GoogleFonts.openSans(
                  fontWeight: FontWeight.bold,
                  fontSize: 14,
                ),
                textAlign: TextAlign.center,
                softWrap: true,
              ),
              Text(
                pharmacy.profession == '' ? 'Health Specialist' : pharmacy.profession,
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
