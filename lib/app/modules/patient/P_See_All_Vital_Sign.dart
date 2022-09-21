


import 'package:flutter/material.dart';

class P_See_All_Vital_Sign extends StatefulWidget
{
  @override
  State<P_See_All_Vital_Sign> createState() => _P_See_All_Vital_SignState();
}

class _P_See_All_Vital_SignState extends State<P_See_All_Vital_Sign> {
  int ang1=-90;
  int ang2=-90;
  int ang3=-90;
  int ang4=-90;

  bool extension1=false;
  bool extension2=false;
  bool extension3=false;
  bool extension4=false;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [


            Padding(
              padding: const EdgeInsets.fromLTRB(30,98,30,20),//(left, top, right, bottom)//all(20),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white
                    ),



                    onPressed: (){
                      ang1=ang1*-1;
                      setState(()=>extension1=!extension1);
                    },

                    child: Container(
                      height: 40,
                      width: 301,
                      /* decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.white

                                        ),*/
                      child: Center(
                        child: Row(
                          children: [
                            Text("R.B.S (Glucose Level) ",


                              style: TextStyle(color: Colors.black,
                                  fontSize: 12
                              ),
                            ),

                            Container(
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                child: Transform.rotate(

                                  angle: ang1 *3.1416 /180,
                                  child: Icon(Icons.arrow_back_ios_outlined,
                                    color: Colors.green.shade900,
                                    size: 15,

                                  ),
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                  ),



                  /////////////////////////////////////////////////////



                  Visibility(

                    child: Container(

                      child: Column(

                        children: [


                          


                          //////////////////////////////////////////////////////////////


                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                            child: Table(
                              children: [


                                TableRow(children: [

                                  Text("Date",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 1, 105, 57),
                                        fontSize: 12),
                                  ),
                                  Text("Value",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 1, 105, 57),
                                        fontSize: 12),
                                  ),
                                  Text("Action",
                                    style: TextStyle(color: Color.fromARGB(255, 1, 105, 57),
                                        fontSize: 12),),

                                ]
                                ),


                                TableRow(children: [

                                  Text("11.10.2020"),
                                  Text("5.8"),
                                  Row(
                                    children: [

                                      Icon(
                                        Icons.edit,
                                      ),



                                      Icon(
                                        Icons.delete,
                                      )

                                    ],
                                  )

                                ]
                                ),



                              ],
                            ),
                          )
                          


                          //////////////////////////////////////////////////////

                        ],
                      ),

                    ),
                    visible: extension1,
                  ),

                ],
              ),
            ),


            /////////////////////////////////////////////////////////////


            Padding(
              padding: const EdgeInsets.fromLTRB(30,16,30,20),//(left, top, right, bottom)//all(20),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white
                    ),



                    onPressed: (){
                      ang2=ang2*-1;
                      setState(()=>extension2=!extension2);
                    },

                    child: Container(
                      height: 40,
                      width: 301,
                      /* decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.white

                                        ),*/
                      child: Center(
                        child: Row(
                          children: [
                            Text("R.B.S (Glucose Level) ",


                              style: TextStyle(color: Colors.black,
                                  fontSize: 12
                              ),
                            ),

                            Container(
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                child: Transform.rotate(

                                  angle: ang2 *3.1416 /180,
                                  child: Icon(Icons.arrow_back_ios_outlined,
                                    color: Colors.green.shade900,
                                    size: 15,

                                  ),
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                  ),



                  /////////////////////////////////////////////////////



                  Visibility(

                    child: Container(

                      child: Column(

                        children: [





                          //////////////////////////////////////////////////////////////


                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                            child: Table(
                              children: [


                                TableRow(children: [

                                  Text("Date",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 1, 105, 57),
                                        fontSize: 12),
                                  ),
                                  Text("Value",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 1, 105, 57),
                                        fontSize: 12),
                                  ),
                                  Text("Action",
                                    style: TextStyle(color: Color.fromARGB(255, 1, 105, 57),
                                        fontSize: 12),),

                                ]
                                ),


                                TableRow(children: [

                                  Text("11.10.2020"),
                                  Text("5.8"),
                                  Row(
                                    children: [

                                      Icon(
                                        Icons.edit,
                                      ),



                                      Icon(
                                        Icons.delete,
                                      )

                                    ],
                                  )

                                ]
                                ),



                              ],
                            ),
                          )



                          //////////////////////////////////////////////////////

                        ],
                      ),

                    ),
                    visible: extension2,
                  ),

                ],
              ),
            ),


            /////////////////////////////////////////////////////////////



            Padding(
              padding: const EdgeInsets.fromLTRB(30,16,30,20),//(left, top, right, bottom)//all(20),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white
                    ),



                    onPressed: (){
                      ang3=ang3*-1;
                      setState(()=>extension3=!extension3);
                    },

                    child: Container(
                      height: 40,
                      width: 301,
                      /* decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.white

                                        ),*/
                      child: Center(
                        child: Row(
                          children: [
                            Text("R.B.S (Glucose Level) ",


                              style: TextStyle(color: Colors.black,
                                  fontSize: 12
                              ),
                            ),

                            Container(
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                child: Transform.rotate(

                                  angle: ang3 *3.1416 /180,
                                  child: Icon(Icons.arrow_back_ios_outlined,
                                    color: Colors.green.shade900,
                                    size: 15,

                                  ),
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                  ),



                  /////////////////////////////////////////////////////



                  Visibility(

                    child: Container(

                      child: Column(

                        children: [





                          //////////////////////////////////////////////////////////////


                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                            child: Table(
                              children: [


                                TableRow(children: [

                                  Text("Date",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 1, 105, 57),
                                        fontSize: 12),
                                  ),
                                  Text("Value",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 1, 105, 57),
                                        fontSize: 12),
                                  ),
                                  Text("Action",
                                    style: TextStyle(color: Color.fromARGB(255, 1, 105, 57),
                                        fontSize: 12),),

                                ]
                                ),


                                TableRow(children: [

                                  Text("11.10.2020"),
                                  Text("5.8"),
                                  Row(
                                    children: [

                                      Icon(
                                        Icons.edit,
                                      ),



                                      Icon(
                                        Icons.delete,
                                      )

                                    ],
                                  )

                                ]
                                ),



                              ],
                            ),
                          )



                          //////////////////////////////////////////////////////

                        ],
                      ),

                    ),
                    visible: extension3,
                  ),

                ],
              ),
            ),


            /////////////////////////////////////////////////////////////




            Padding(
              padding: const EdgeInsets.fromLTRB(30,16,30,20),//(left, top, right, bottom)//all(20),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white
                    ),



                    onPressed: (){
                      ang4=ang4*-1;
                      setState(()=>extension4=!extension4);
                    },

                    child: Container(
                      height: 40,
                      width: 301,
                      /* decoration: BoxDecoration(
                                            borderRadius: BorderRadius.circular(10),
                                            color: Colors.white

                                        ),*/
                      child: Center(
                        child: Row(
                          children: [
                            Text("R.B.S (Glucose Level) ",


                              style: TextStyle(color: Colors.black,
                                  fontSize: 12
                              ),
                            ),

                            Container(
                              // crossAxisAlignment: CrossAxisAlignment.end,
                              alignment: Alignment.centerRight,
                              child: Padding(
                                padding: const EdgeInsets.symmetric(horizontal: 25),
                                child: Transform.rotate(

                                  angle: ang4 *3.1416 /180,
                                  child: Icon(Icons.arrow_back_ios_outlined,
                                    color: Colors.green.shade900,
                                    size: 15,

                                  ),
                                ),
                              ),
                            ),


                          ],
                        ),
                      ),
                    ),
                  ),



                  /////////////////////////////////////////////////////



                  Visibility(

                    child: Container(

                      child: Column(

                        children: [





                          //////////////////////////////////////////////////////////////


                          Padding(
                            padding: const EdgeInsets.fromLTRB(30, 10, 0, 0),
                            child: Table(
                              children: [


                                TableRow(children: [

                                  Text("Date",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 1, 105, 57),
                                        fontSize: 12),
                                  ),
                                  Text("Value",
                                    style: TextStyle(
                                        color: Color.fromARGB(255, 1, 105, 57),
                                        fontSize: 12),
                                  ),
                                  Text("Action",
                                    style: TextStyle(color: Color.fromARGB(255, 1, 105, 57),
                                        fontSize: 12),),

                                ]
                                ),


                                TableRow(children: [

                                  Text("11.10.2020"),
                                  Text("5.8"),
                                  Row(
                                    children: [

                                      Icon(
                                        Icons.edit,
                                      ),



                                      Icon(
                                        Icons.delete,
                                      )

                                    ],
                                  )

                                ]
                                ),



                              ],
                            ),
                          )



                          //////////////////////////////////////////////////////

                        ],
                      ),

                    ),
                    visible: extension4,
                  ),

                ],
              ),
            ),


            /////////////////////////////////////////////////////////////










            /////////////////////////////////////////




          ],
        ),
      ),
    );
  }
}