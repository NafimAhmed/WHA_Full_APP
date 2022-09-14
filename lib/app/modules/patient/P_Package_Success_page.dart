
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'p__dashboard_module/p__dashboard_page.dart';



class P_Package_success_page extends StatefulWidget
{
  @override
  State<P_Package_success_page> createState() => _P_Package_success_pageState();
}

class _P_Package_success_pageState extends State<P_Package_success_page> {
  TextEditingController emailController=TextEditingController();

  TextEditingController passwordController=TextEditingController();

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Builder(
            builder: (context) {
              return Container(


                // decoration: BoxDecoration(
                //   image: DecorationImage(
                //     image: AssetImage("image/successful_message.jpg"),
                //     fit: BoxFit.cover,
                //   ),
                // ),

                child: Padding(
                  padding: const EdgeInsets.all(20),
                  child: Column(



                    crossAxisAlignment: CrossAxisAlignment.center,
                    mainAxisAlignment: MainAxisAlignment.center,


                    children: [

                      Image.asset(
                        "assets/2a40fae0b6223cfa2ffcbb3a86542ba0.gif",
                        height: 300.0,
                        width: 300.0,
                      ),


                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,0,0,7),//(left, top, right, bottom),
                        child: Text("Congratulations !",
                          style: TextStyle(
                            color: Color.fromARGB(255, 47,55,137),
                            fontSize: 25,
                            //fontWeight: FontWeight.bold
                          ),
                        ),
                      ),

                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,0,0,45),//(left, top, right, bottom),
                        child: Text("Offer Booked Successfully",
                          style: TextStyle(
                              color: Color.fromARGB(255, 47,55,137),
                              fontSize: 18
                          ),
                        ),
                      ),




                      Padding(
                        padding: const EdgeInsets.all(15),
                        child: ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              primary: Colors.green.shade900,
                            maximumSize: Size(301,40)
                          ),
                          onPressed: (){



                            //Navigator.of(context).pop(false);
                            //logIn(emailController.text.toString(),passwordController.text.toString());
                             Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) =>
                                        PDashboardPage()
                                )
                            );

                          },
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [



                              Center(
                                child: Container(

                                  height: 50,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),

                                    //color: Colors.green.shade900

                                  ),
                                  child: Padding(
                                    // padding: const EdgeInsets.all(8.0),

                                    padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                    child: Center(
                                      child: Text("Done",

                                        style: TextStyle(
                                          fontSize: 12

                                        ),

                                      ),

                                    ),
                                  ),
                                ),
                              ),

                              // Padding(
                              //   padding: const EdgeInsets.fromLTRB(77,0,0,0),//(left, top, right, bottom)//all(8.0),
                              //   child: Container(
                              //       child: Icon(Icons.arrow_forward)
                              //
                              //   ),
                              // )
                              //

                            ],
                          ),
                        ),
                      ),




                    ],
                  ),
                ),
              );
            }
        ),
      ),
    );
  }
}