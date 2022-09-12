import 'package:wha/app/modules/patient/p_settings_language_module/p_settings_language_controller.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PSettingsLanguagePage extends StatefulWidget/*GetView<PSettingsLanguageController>*/ {
  @override
  State<PSettingsLanguagePage> createState() => _PSettingsLanguagePageState();
}

enum SingingCharacter { English, Bangla }

class _PSettingsLanguagePageState extends State<PSettingsLanguagePage> {
  //const PSettingsLanguagePage({Key? key}) : super(key: key);

  SingingCharacter? _character = SingingCharacter.English;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double safePadding = MediaQuery.of(context).padding.top;


    return Scaffold(
      body: Column(
        children: [
          _buildTopBar(safePadding),
          ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            children: [


              RadioListTile<SingingCharacter>(
                title: const Text('English'),
                value: SingingCharacter.English,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),
              RadioListTile<SingingCharacter>(
                title: const Text('Bangla'),
                value: SingingCharacter.Bangla,
                groupValue: _character,
                onChanged: (SingingCharacter? value) {
                  setState(() {
                    _character = value;
                  });
                },
              ),






              /*RadioListTile(
                value: 'A',
                groupValue: 'A',
                dense: true,
                toggleable: true,
                activeColor: primaryColor,
                onChanged: (String? value) {},
                title: const Text(
                    'English'
                ),
              ),
              RadioListTile(
                value: 'B',
                groupValue: 'A',
                //dense: true,
                activeColor: primaryColor,
                onChanged: (String? value) {},
                title: const Text(
                    'Bangla'
                ),
              ),*/
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildTopBar(double safePadding) {
    return Column(
      children: [
        Container(
          height: safePadding,
          color: Colors.black,
          width: double.infinity,
        ),
        Container(
          color: Colors.black,
          child: PhysicalModel(
            borderRadius: const BorderRadius.only(topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            color: backgroundColor,
            child: Padding(
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child:Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    onPressed: () {
                      Get.back();
                    },
                    icon: const Icon(
                      Icons.close,
                      color: primaryColor,
                      size: 20,
                    ),
                  ),
                  Text(
                    'Language Settings',
                    style: GoogleFonts.openSans(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.search,
                      color: primaryColor,
                      size: 20,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ],
    );
  }
}
