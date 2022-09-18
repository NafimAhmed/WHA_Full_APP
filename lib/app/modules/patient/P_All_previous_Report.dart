



import 'package:flutter/material.dart';

import 'p_settings_language_module/p_settings_language_page.dart';

class P_All_previous_Report extends StatefulWidget
{

  @override
  State<P_All_previous_Report> createState() => _P_All_previous_ReportState();
}

enum SingingCharacter { X_Ray, ESR,CBC,City_Scan,MRI,Blood_Culture,Urine_Culture, S_Uric_Acid }

class _P_All_previous_ReportState extends State<P_All_previous_Report> {
  SingingCharacter? _character = SingingCharacter.X_Ray;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [

            Row(
              children: [

                Padding(
                  padding: const EdgeInsets.fromLTRB(28,52,220,0),
                  child: Container(
                      alignment: Alignment.topRight,
                      child: Icon(Icons.arrow_back)
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.fromLTRB(0,52,0,0),
                  child: Image.asset("assets/logo.png",
                    width: 65,
                    height: 22,
                  ),
                ),


              ],
            ),



            Padding(
              padding: const EdgeInsets.fromLTRB(31,15,0,103),//(left, top, right, bottom)//all(8.0),
              child: Row(
                children: [
                  Text("All Previous Report",

                    style: TextStyle(
                      fontSize: 16

                    ),

                  ),
                ],
              ),
            ),



            //_buildTopBar(safePadding),
            ListView(
              shrinkWrap: true,
              physics: const BouncingScrollPhysics(),
              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
              children: [


                RadioListTile<SingingCharacter>(
                  title: const Text('X-Ray'),
                  value: SingingCharacter.X_Ray,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),



                RadioListTile<SingingCharacter>(
                  title: const Text('ESR'),
                  value: SingingCharacter.ESR,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),







                RadioListTile<SingingCharacter>(
                  title: const Text('CBC'),
                  value: SingingCharacter.CBC,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),



                RadioListTile<SingingCharacter>(
                  title: const Text('City Scan'),
                  value: SingingCharacter.City_Scan,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),



                RadioListTile<SingingCharacter>(
                  title: const Text('MRI'),
                  value: SingingCharacter.MRI,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),



                RadioListTile<SingingCharacter>(
                  title: const Text('Blood Culture'),
                  value: SingingCharacter.Blood_Culture,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),







                RadioListTile<SingingCharacter>(
                  title: const Text('Urine Culture'),
                  value: SingingCharacter.Urine_Culture,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),



                RadioListTile<SingingCharacter>(
                  title: const Text('S Uric Acid'),
                  value: SingingCharacter.S_Uric_Acid,
                  groupValue: _character,
                  onChanged: (SingingCharacter? value) {
                    setState(() {
                      _character = value;
                    });
                  },
                ),


              ],
            ),

          ],
        ),
      ),
    );
  }
}