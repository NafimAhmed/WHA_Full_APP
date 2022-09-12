import 'package:wha/app/modules/patient/p_home_our_pharmacy_module/p_home_our_pharmacy_controller.dart';
import 'package:wha/app/modules/patient/p_home_our_pharmacy_module/widgets/build_our_pharmacy.dart';
import 'package:wha/app/modules/patient/p_home_our_pharmacy_module/widgets/p_Pharmacy_Detail.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PHomeOurPharmacyPage extends StatelessWidget {
   PHomeOurPharmacyPage({Key? key}) : super(key: key);

  List<String> phamacy_Name=['Maa Pharmacy','Tasfia Pharmacy','Apon Pharmacy','Rampura Pharmacy'];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(
          title: Text("Nearest  Pharmacy"),
          backgroundColor: Colors.green.shade900,
        ),
        body: Column(
          children: [

            Row(

              children: [

                Padding(
                  padding: const EdgeInsets.fromLTRB(32,20,0,23),//(left, top, right, bottom),
                  child: Icon(Icons.arrow_back),
                ),


              ],

            ),


            //////////////////////////////////////////////



            ListView.builder(
                itemCount: phamacy_Name.length,
                physics: ClampingScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (BuildContext context, int index) {

                  return Padding(
                    padding: const EdgeInsets.fromLTRB(30,0,30,7),//all(3.0),
                    child: GestureDetector(

                      onTap: (){

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    p_Pharmacy_Detail()));




                      },
                      child: Container(


                        decoration: BoxDecoration(
                          border: Border.all(
                              width: .5,
                              color: Colors.grey

                          ),

                        ),



                        child:Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Column(
                            children: [

                              Row(
                                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                                children: [
                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text(phamacy_Name[index],

                                      style: TextStyle(fontSize: 14,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),

                                    ),

                                    // Icon(Icons.thermostat_auto),



                                  ),

                                  Container(
                                      alignment: Alignment.topRight,
                                      child: Row(
                                        children: [

                                          CircleAvatar(
                                            child: Icon(
                                                Icons.call,
                                              color: Colors.blue,

                                            ),
                                            radius: 20,
                                            backgroundColor: Colors.white,
                                          ),
                                          CircleAvatar(
                                            child: Icon(
                                              Icons.directions,
                                              color: Colors.blue,
                                            ),
                                            radius: 20,
                                            backgroundColor: Colors.white,
                                          ),


                                        ],
                                      )
                                  ),




                                ],
                              ),


                              Row(
                                children: [



                                  Padding(
                                    padding: const EdgeInsets.all(5.0),
                                    child: Text("Physician, Internal Medicine at Timerni\nConcord Regional Medical Center, Concord\nOctober 2015–January 2020",

                                      style: TextStyle(fontSize: 10,
                                          //fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),

                                    ),
                                  ),
                                ],
                              ),
                            ],
                          ),
                        ) ,

                      ),
                    ),
                  );//Text('Child');
                }
            ),








            ///////////////////////////////////////////////



          ],
        ),
      ),
    );
  }

  /*@override
  Widget build(BuildContext context) {
    controller.updatePharmacies();
    return Obx(() {
      return Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Text(
                  'Our Pharmacies',
                  style: TextStyle(
                    color: primaryColor,
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
                InkWell(
                  onTap: () {

                  },
                  child: Padding(
                    padding: const EdgeInsets.fromLTRB(5, 2, 0, 2),
                    child: Text(
                      'see all',
                      style: GoogleFonts.openSans(
                        color: primaryColor,
                        fontWeight: FontWeight.normal,
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          const SizedBox(height: 10),
          SizedBox(
            height: 185,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: controller.pharmacies
                    .map<Widget>(
                        (pharmacy) => BuildOurPharmacy(pharmacy: pharmacy))
                    .toList(),
              ),
            ),
          ),
        ],
      );
    });
  }*/
}
