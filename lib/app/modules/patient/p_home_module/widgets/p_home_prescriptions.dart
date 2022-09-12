import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PHomePrescriptions extends StatelessWidget {
  PHomePrescriptions({Key? key}) : super(key: key);
  List<String> prescriptions = [
    'A',
    'B',
    'C',
    'D',
    'E',
    'F',
    'G',
    'H',
  ];

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 10, 10, 20),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            'Your prescriptions',
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
              children: prescriptions.map((e) => _buildPrescriptions(e, size)).toList(),
            ),
          ),
        ],
      ),
    );
  }

  Widget _buildPrescriptions(String prescription, Size size){
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 20),
      child: PhysicalModel(
        color: backgroundColor,
        elevation: 10.0,
        child: Center(
          child: Image(
            width: size.width - 35,
            image: const NetworkImage(
              'https://www.researchgate.net/profile/Sandra-Benavides/publication/228331607/figure/fig4/AS:667613038387209@1536182760366/Indicate-why-the-prescription-is-not-appropriate-as-written.png',
            ),
          ),
        ),
      ),
    );
  }
}
