



import 'package:flutter/material.dart';

class P_Package_Confirm_Payment extends StatelessWidget
{
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



                // Padding(
                //   padding: const EdgeInsets.fromLTRB(0,52,0,103),
                //   child: Image.asset("assets/logo.png",
                //     width: 65,
                //     height: 22,
                //   ),
                // ),


              ],
            ),





            Row(
              children: [

                Padding(
                  padding: const EdgeInsets.fromLTRB(28,15,104,103),
                  child: Container(
                      alignment: Alignment.topRight,
                      child: Text("Confirm Payment             ")
                  ),
                ),



                Padding(
                  padding: const EdgeInsets.fromLTRB(0,15,0,103),
                  child: Image.asset("assets/logo.png",
                    width: 65,
                    height: 22,
                  ),
                ),


              ],
            ),




            Padding(
              padding: const EdgeInsets.fromLTRB(54,0,0,0),//(left, top, right, bottom),
              child: Row(
                children: [
                  Text("Price                                  	               :	",
                    style: TextStyle(
                      color: Colors.green.shade900,
                    ),

                  ),
                  Text("৳	3,000.0"),


                ],
              ),
            ),





            Padding(
              padding: const EdgeInsets.fromLTRB(54,15,0,0),//(left, top, right, bottom),
              child: Row(
                children: [
                  Text("Platform Charge (15%)	                  :	",
                  style: TextStyle(
                    color: Colors.green.shade900,
                  ),
                  ),
                  Text("৳	450.0"),


                ],
              ),
            ),



            Padding(
              padding: const EdgeInsets.fromLTRB(0,0,0,0),//(left, top, right, bottom),
              child: Column(
                children: [
                  Text("This is for using the platform and get support!",
                    style: TextStyle(
                      color: Colors.grey.shade500,
                      fontSize: 12
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,41,0,0),//(left, top, right, bottom)//all(8.0),
                    child: Text("___________________________________________"),
                  ),


                ],
              ),
            ),






            Padding(
              padding: const EdgeInsets.fromLTRB(54,15,0,52),//(left, top, right, bottom),
              child: Row(
                children: [
                  Text("Total	                                                  :	",
                    style: TextStyle(
                      color: Colors.green.shade900,
                    ),
                  ),
                  Text("৳	3,450.0"),


                ],
              ),
            ),






          ],
        ),
      ),
    );
  }

}