import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PHomeIconButton extends StatelessWidget {
  const PHomeIconButton({Key? key,required this.title}) : super(key: key);
  final String title;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(5.0),
      child: PhysicalModel(
        color: backgroundColor,
        elevation: 15.0,
        borderRadius: BorderRadius.circular(20),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
           Image.asset(
             'assets/icon.png',
             width: MediaQuery.of(context).size.width * 0.15,
           ),
            const SizedBox(height: 3),
            Text(
              title,
              style: GoogleFonts.openSans(
                fontWeight: FontWeight.bold,
                fontSize: 10,
              ),
              textAlign: TextAlign.center,
              softWrap: true,
            )
          ],
        ),
      ),
    );
  }
}
