



import 'package:flutter/material.dart';

import 'P_Package_Success_page.dart';

class P_Package_Confirm_Payment extends StatefulWidget
{

  @override
  State<P_Package_Confirm_Payment> createState() => _P_Package_Confirm_PaymentState();
}

class _P_Package_Confirm_PaymentState extends State<P_Package_Confirm_Payment> {
  bool checkedValue=false;

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



            Padding(
              padding: const EdgeInsets.fromLTRB(24,0,0,0),//(left, top, right, bottom)//all(8.0),
              child: CheckboxListTile(
                title: Text("I agree to Terms & Conditions, Privacy &\n Policy and Refund Policy",

                  style: TextStyle(
                    fontSize: 12,
                    color: Color.fromARGB(255, 148, 134,134),
                  ),

                ),
                value: checkedValue,
                onChanged: (newValue) {
                  setState(() {
                    checkedValue = newValue!;
                  });
                },
                controlAffinity: ListTileControlAffinity.leading,  //  <-- leading Checkbox
              ),
            ),


            //////////////////////////////////////



            Padding(
              padding: const EdgeInsets.fromLTRB(31,25,28,0),//(left, top, right, bottom)//all(15),
              child: ElevatedButton(



                style: ElevatedButton.styleFrom(
                    primary: Color.fromARGB(255, 1, 105, 57),
                  maximumSize: Size(242, 40),

                ),
                onPressed: (){
                  //logIn(emailController.text.toString(),passwordController.text.toString());
                   Navigator.push(
                       context,
                       MaterialPageRoute(
                           builder: (context) =>
                               P_Package_success_page()
                       )
                   );

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [



                    Text("Checkout Now",

                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "OpenSens",
                          color: Color.fromARGB(255, 255, 255, 255)

                      ),

                    ),

                    /*Padding(
                      padding: const EdgeInsets.fromLTRB(77,0,0,0),//(left, top, right, bottom)//all(8.0),
                      child: Container(
                          child: Icon(Icons.arrow_forward)

                      ),
                    )*/


                  ],
                ),
              ),
            ),


            ////////////////////////////////////////






            Padding(
              padding: const EdgeInsets.fromLTRB(31,10,28,20),//(left, top, right, bottom)//all(15),
              child: ElevatedButton(



                style: ElevatedButton.styleFrom(
                  primary: Color.fromARGB(255, 47, 55, 137),
                  maximumSize: Size(242, 40),

                ),
                onPressed: (){
                  //logIn(emailController.text.toString(),passwordController.text.toString());
                  // Navigator.push(
                  //     context,
                  //     MaterialPageRoute(
                  //         builder: (context) =>
                  //             Doctor_Add_Vitals()
                  //     )
                  // );

                },
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [



                    Text("Cancel",

                      style: TextStyle(
                          fontSize: 12,
                          fontFamily: "OpenSens",
                          color: Color.fromARGB(255, 255, 255, 255)

                      ),

                    ),

                    /*Padding(
                      padding: const EdgeInsets.fromLTRB(77,0,0,0),//(left, top, right, bottom)//all(8.0),
                      child: Container(
                          child: Icon(Icons.arrow_forward)

                      ),
                    )*/


                  ],
                ),
              ),
            ),


















            //////////////////////////////////////












          ],
        ),
      ),
    );
  }
}