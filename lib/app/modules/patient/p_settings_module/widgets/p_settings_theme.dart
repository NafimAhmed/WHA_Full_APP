import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PSettingsTheme extends StatefulWidget {
  const PSettingsTheme({Key? key}) : super(key: key);

  @override
  State<PSettingsTheme> createState() => _PSettingsThemeState();
}

class _PSettingsThemeState extends State<PSettingsTheme> {
  bool isDarkThemeSelected = Get.isDarkMode;

  @override
  Widget build(BuildContext context) {
    return SwitchListTile(
      title: const Text(
        'Dark theme',
      ),
      //isThreeLine: false,
      //dense: true,
      onChanged: (bool value){

        setState(() {
          isDarkThemeSelected = value;
          if(isDarkThemeSelected){
            Get.changeThemeMode(ThemeMode.dark);
          }else{
            Get.changeThemeMode(ThemeMode.light);
          }
        });


      } ,/*: (bool value) {
        setState(() {
          isDarkThemeSelected = value;
          if(isDarkThemeSelected){
            Get.changeThemeMode(ThemeMode.dark);
          }else{
            Get.changeThemeMode(ThemeMode.light);
          }
        });*/

      activeColor: primaryColor,
      value: isDarkThemeSelected,
      controlAffinity: ListTileControlAffinity.trailing,
    );
  }
}
