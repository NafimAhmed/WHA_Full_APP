





import 'package:flutter/material.dart';

class P_See_BMI extends StatefulWidget
{

  @override
  State<P_See_BMI> createState() => _P_See_BMIState();
}

class _P_See_BMIState extends State<P_See_BMI> {
  bool extension1=false;
  bool extension2=false;


  int ang1=-90;
  int ang2=-90;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build

    return MaterialApp(
      home: Scaffold(
        body: Column(
          children: [


            Padding(
              padding: const EdgeInsets.fromLTRB(31, 54, 30, 15),//all(8.0),
              child: Row(
                children: [

                  Icon(Icons.arrow_back)

                ],
              ),
            ),

            Padding(
              padding: const EdgeInsets.fromLTRB(31, 0, 30, 52),//all(8.0),
              child: Row(
                children: [

                  Text("BMI",

                    style: TextStyle(
                        fontSize: 16
                    ),

                  )

                ],
              ),
            ),


            ///////////////////////////////////

            Padding(
              padding: const EdgeInsets.fromLTRB(30,16,30,20),//(left, top, right, bottom)//all(20),
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
                            Text("Height",


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






            ////////////////////////////////


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
                            Text("Weight",


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
















            //////////////////////////////////////



          ],
        ),
      ),
    );
  }
}