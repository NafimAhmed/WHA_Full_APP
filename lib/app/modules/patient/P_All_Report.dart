
import 'package:flutter/material.dart';
import 'package:wha/app/modules/patient/All_Previous_History.dart';

import 'P_Add Patient history.dart';
import 'P_All_previous_Report.dart';





class P_All_Report extends StatelessWidget
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
                    padding: const EdgeInsets.fromLTRB(28,52,220,103),
                    child: Container(
                        alignment: Alignment.topRight,
                        child: Icon(Icons.arrow_back)
                    ),
                  ),



                  Padding(
                    padding: const EdgeInsets.fromLTRB(0,52,0,103),
                    child: Image.asset("assets/logo.png",
                      width: 65,
                      height: 22,
                    ),
                  ),


                ],
              ),


              Padding(
                padding: const EdgeInsets.fromLTRB(31,0,28,20),//(left, top, right, bottom)//all(15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white
                  ),
                  onPressed: (){
                    //logIn(emailController.text.toString(),passwordController.text.toString());
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) =>
                               P_All_previous_Report()
                        )
                    );

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [



                      Container(

                        height: 40,
                        //width: 301,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),

                          //color: Colors.green.shade900

                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(45,11,0,0),//all(8.0),
                          child: Text("All Previous Report",

                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "OpenSens",
                                color: Color.fromARGB(255, 65, 63, 63)

                            ),

                          ),
                        ),
                      ),




                    ],
                  ),
                ),
              ),




              Padding(
                padding: const EdgeInsets.fromLTRB(31,0,28,20),//(left, top, right, bottom)//all(15),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                      primary: Colors.white
                  ),
                  onPressed: (){

                    // Navigator.push(
                    //     context,
                    //     MaterialPageRoute(
                    //         builder: (context) =>
                    //             P_add_Patient_History()
                    //     )
                    // );

                  },
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [



                      Container(

                        height: 40,
                        //width: 301,
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),

                          //color: Colors.green.shade900

                        ),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(45,11,0,0),//all(8.0),
                          child: Text("Add Report",

                            style: TextStyle(
                                fontSize: 12,
                                fontFamily: "OpenSens",
                                color: Color.fromARGB(255, 65, 63, 63)

                            ),

                          ),
                        ),
                      ),




                    ],
                  ),
                ),
              ),



















            ],
          )
      ),
    );
  }

}