import 'package:wha/app/modules/patient/p_settings_notifications_module/p_settings_notifications_controller.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PSettingsNotificationsPage extends StatefulWidget/*GetView<PSettingsNotificationsController> */{
  const PSettingsNotificationsPage({Key? key}) : super(key: key);

  @override
  State<PSettingsNotificationsPage> createState() => _PSettingsNotificationsPageState();
}

class _PSettingsNotificationsPageState extends State<PSettingsNotificationsPage> {

  bool isSwitched=false;
  bool Campaign_messages=false;
  bool Alert_messages=false;
  bool Appointments=false;
  bool Health_Tips=false;
  bool Reminders_Records=false;
  bool Update_Offers=false;


  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double safePadding = MediaQuery.of(context).padding.top;

    ///////////////////////////








    /////////////////////////


    return Scaffold(
      body: Column(
        children: [
          _buildTopBar(safePadding),
          ListView(
            shrinkWrap: true,
            scrollDirection: Axis.vertical,
            physics: const BouncingScrollPhysics(),
            padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
            children: [
              SwitchListTile(
                value: isSwitched,
                onChanged: (value){





                    setState(() {
                      //_onSwitchChanged(value);
                      isSwitched=value;
                      Campaign_messages=value;
                       Alert_messages=value;
                       Appointments=value;
                       Health_Tips=value;
                       Reminders_Records=value;
                       Update_Offers=value;

                    });

                  






                },
                activeColor: primaryColor,
                title: Text(
                  'All Notifications',
                  style: GoogleFonts.openSans(
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
              CheckboxListTile(
                value: Campaign_messages,
                onChanged: (value){


                  setState(() {
                    //_onSwitchChanged(value);
                    Campaign_messages=value!;

                  });



                },
                dense: true,
                activeColor: primaryColor,
                title: const Text(
                  'Campaign messages',
                ),
              ),
              CheckboxListTile(
                value: Alert_messages,
                onChanged: (value){

                  setState(() {
                    //_onSwitchChanged(value);
                    Alert_messages=value!;

                  });


                },
                dense: true,
                activeColor: primaryColor,
                title: const Text(
                  'Alert messages',
                ),
              ),
              CheckboxListTile(
                value: Appointments,
                onChanged: (value){

                  setState(() {
                    //_onSwitchChanged(value);
                    Appointments=value!;

                  });


                },
                dense: true,
                activeColor: primaryColor,
                title: const Text(
                  'Appointments',
                ),
              ),
              CheckboxListTile(
                value: Health_Tips,
                onChanged: (bool? value){

                  setState(() {
                    //_onSwitchChanged(value);
                    Health_Tips=value!;

                  });

                },
                dense: true,
                activeColor: primaryColor,
                title: const Text(
                  'Health Tips',
                ),
              ),
              CheckboxListTile(
                value: Reminders_Records,
                onChanged: (bool? value){

                  setState(() {
                    //_onSwitchChanged(value);
                    Reminders_Records=value!;

                  });

                },
                dense: true,
                activeColor: primaryColor,
                title: const Text(
                  'Reminders & Records',
                ),
              ),
              CheckboxListTile(
                value: Update_Offers,
                onChanged: (bool? value){

                  setState(() {
                    //_onSwitchChanged(value);
                    Update_Offers=value!;

                  });

                },
                dense: true,
                activeColor: primaryColor,
                title: const Text(
                  'Update & Offers',
                ),
              ),
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
                    'Notification Settings',
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
