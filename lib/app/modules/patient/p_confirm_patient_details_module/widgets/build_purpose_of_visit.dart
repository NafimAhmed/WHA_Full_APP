import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildPurposeOfVisit extends StatelessWidget {
  const BuildPurposeOfVisit({Key? key, required this.purposeOfVisit})
      : super(key: key);
  final String purposeOfVisit;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
      child: PhysicalModel(
        color: backgroundColor,
        elevation: 1.0,
        child: SizedBox(
          height: 80,
          width: size.width - 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Purpose of Visit',
                  style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  purposeOfVisit,
                  style: GoogleFonts.openSans(
                    color: primaryColor,
                  ),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }
}
