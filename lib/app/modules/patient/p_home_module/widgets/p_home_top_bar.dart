import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:url_launcher/url_launcher.dart';

class PHomeTopBar extends StatelessWidget {
  PHomeTopBar({Key? key, required this.Pname}) : super(key: key);
  final String Pname;

  final AppState appState = Get.find<AppState>();
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                children: const [
                  Image(
                    height: 30,
                    image: AssetImage(
                      'assets/logo.png',
                    ),
                  ),
                ],
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 10, 0, 10),
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.start,
                children: [
                  const Image(
                    image: AssetImage(
                      'assets/hand_wave.png',
                    ),
                    height: 30,
                    width: 30,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Hello $Pname',
                        style: const TextStyle(
                          fontSize: 18,
                          fontWeight: FontWeight.bold,
                          color: primaryColor,
                        ),
                        softWrap: true,
                      ),
                      Row(
                        children: [
                          Text(
                            'How are you today',
                            style: GoogleFonts.openSans(
                              color: primaryColor,
                              fontSize: 12,
                            ),
                          ),
                          Text(
                            '?',
                            style: GoogleFonts.openSans(
                              fontWeight: FontWeight.bold,
                              fontSize: 12,
                            ),
                          ),
                        ],
                      )
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
        Padding(
          padding: const EdgeInsets.fromLTRB(0, 0, 15, 0),
          child: Column(
            children: [
              InkWell(
                onTap: () async{
                  if((appState.hotlines as List<Hotline>).isNotEmpty){
                    final Hotline hotline = (appState.hotlines as List<Hotline>).first;
                    if (!await launch('tel:'+ hotline.phoneNumber)) throw 'Could not launch';
                  }else{
                    if (!await launch('tel:+8801842669430')) throw 'Could not launch';
                  }
                },
                child: AvatarGlow(
                  glowColor: Colors.red.shade900,
                  endRadius: 40.0,
                  duration: const Duration(milliseconds: 1000),
                  repeat: true,
                  showTwoGlows: true,
                  repeatPauseDuration: const Duration(milliseconds: 0),
                  child: Material(
                    // Replace this child with your own
                    elevation: 8.0,
                    shape: const CircleBorder(),
                    child: SizedBox(
                      height: 50,
                      child: CircleAvatar(
                        backgroundColor: Colors.red.shade900,
                        child: const Icon(
                          Icons.phone,
                          color: backgroundColor,
                        ),
                        radius: 40.0,
                      ),
                    ),
                  ),
                ),
              ),
              Text(
                'hotline',
                style: GoogleFonts.openSans(
                  color: Colors.red.shade900,
                  fontSize: 12,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
