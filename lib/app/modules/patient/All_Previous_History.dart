





import 'package:flutter/material.dart';




class All_previous_History extends StatefulWidget
{

  @override
  State<All_previous_History> createState() => _All_previous_HistoryState();
}

class _All_previous_HistoryState extends State<All_previous_History> {
  bool extension=false;
  bool extension2=false;
  bool extension3=false;

  int ang1=-90;
  int ang2=-90;
  int ang3=-90;

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
                  child: Icon(Icons.search),//Image.asset("assets/logo.png",

                  ),
              ]
                ),




            Row(
                children: [

                  Padding(
                    padding: const EdgeInsets.fromLTRB(31,15,220,54),
                    child: Container(
                        alignment: Alignment.topRight,
                        child: Text("All Previous History",

                          style: TextStyle(
                            fontSize: 16,
                          ),

                        ),//Icon(Icons.arrow_back)
                    ),
                  ),



                ]
            ),









            Padding(
              padding: const EdgeInsets.fromLTRB(30,0,30,20),//(left, top, right, bottom)//all(20),
              child: Column(
                children: [
                  ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        primary: Colors.white
                    ),



                    onPressed: (){
                      ang1=ang1*-1;
                      setState(()=>extension=!extension);
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
                            Text("Do you have morbidity?          ",


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




                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Yes/No",
                            style: TextStyle(
                                color: Color.fromARGB(255, 1, 105, 57),
                                fontSize: 12
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Disease",

                            style: TextStyle(
                              color: Color.fromARGB(255, 1, 105, 57),
                              fontSize: 12
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Condition",

                            style: TextStyle(
                                color: Color.fromARGB(255, 1, 105, 57),
                                fontSize: 12
                            ),

                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Rating",


                            style: TextStyle(
                                color: Color.fromARGB(255, 1, 105, 57),
                                fontSize: 12
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Action",

                            style: TextStyle(
                                color: Color.fromARGB(255, 1, 105, 57),
                                fontSize: 12
                            ),

                          ),
                        ),
                      ],
                    ),



                    ///////////////////////////////////////////////////////


                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,0,0,0),//(left, top, right, bottom)//all(8.0),
                          child: Text("Yes",
                            style: TextStyle(
                                color: Color.fromARGB(255, 65, 63, 63),
                                fontSize: 12
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(20,0,0,0),
                          child: Text("Allergic",

                            style: TextStyle(
                                color: Color.fromARGB(255, 65, 63, 63),
                                fontSize: 12
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(25,0,0,0),
                          child: Text("Severe",

                            style: TextStyle(
                                color: Color.fromARGB(255, 65, 63, 63),
                                fontSize: 12
                            ),

                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(30,0,0,0),
                          child: Text("5",


                            style: TextStyle(
                                color: Color.fromARGB(255, 65, 63, 63),
                                fontSize: 12
                            ),
                          ),
                        ),

                        Padding(
                          padding: const EdgeInsets.fromLTRB(30,0,0,0),
                          child: Row(
                            children: [
                              Icon(Icons.edit,
                              color: Color.fromARGB(255, 47, 55, 137),
                              ),
                              Icon(Icons.delete,

                                color: Color.fromARGB(255, 47, 55, 137),

                              )
                            ],
                          )
                        ),
                      ],
                    ),




                    Row(
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("Comment :",

                            style: TextStyle(
                                color: Color.fromARGB(255, 1, 105, 57),
                                fontSize: 12
                            ),

                          ),
                        ),

                      ],
                    ),



                    Row(
                      children: [

                        Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text("It is a long established fact that a reader will \n be distracted by the readable content of a page when\nlooking at its layout. The point of using Lorem Ipsum\nis that it has a more-or-less normal distribution of\nletters, as opposed to using 'Content here, content\nhere', making it look like readable English. ",

                            style: TextStyle(
                                color: Color.fromARGB(255, 148, 134, 134),
                                fontSize: 12
                            ),

                          ),
                        ),

                      ],
                    ),







                    ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



                  ],
                ),

              ),
              visible: extension,
            ),

                ],
              ),
            ),



            ///////////////////////////////////////////////////////////////////////

            Padding(
              padding: const EdgeInsets.fromLTRB(30,0,30,20),//(left, top, right, bottom)//all(20),
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
                            Text("Do you have allergy?                ",


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




                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Yes/No",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 105, 57),
                                      fontSize: 12
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Disease",

                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 105, 57),
                                      fontSize: 12
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Condition",

                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 105, 57),
                                      fontSize: 12
                                  ),

                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Rating",


                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 105, 57),
                                      fontSize: 12
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Action",

                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 105, 57),
                                      fontSize: 12
                                  ),

                                ),
                              ),
                            ],
                          ),



                          ///////////////////////////////////////////////////////


                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20,0,0,0),//(left, top, right, bottom)//all(8.0),
                                child: Text("Yes",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 65, 63, 63),
                                      fontSize: 12
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(20,0,0,0),
                                child: Text("Allergic",

                                  style: TextStyle(
                                      color: Color.fromARGB(255, 65, 63, 63),
                                      fontSize: 12
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(25,0,0,0),
                                child: Text("Severe",

                                  style: TextStyle(
                                      color: Color.fromARGB(255, 65, 63, 63),
                                      fontSize: 12
                                  ),

                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(30,0,0,0),
                                child: Text("5",


                                  style: TextStyle(
                                      color: Color.fromARGB(255, 65, 63, 63),
                                      fontSize: 12
                                  ),
                                ),
                              ),

                              Padding(
                                  padding: const EdgeInsets.fromLTRB(30,0,0,0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.edit,
                                        color: Color.fromARGB(255, 47, 55, 137),
                                      ),
                                      Icon(Icons.delete,

                                        color: Color.fromARGB(255, 47, 55, 137),

                                      )
                                    ],
                                  )
                              ),
                            ],
                          ),




                          Row(
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Comment :",

                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 105, 57),
                                      fontSize: 12
                                  ),

                                ),
                              ),

                            ],
                          ),



                          Row(
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("It is a long established fact that a reader will \n be distracted by the readable content of a page when\nlooking at its layout. The point of using Lorem Ipsum\nis that it has a more-or-less normal distribution of\nletters, as opposed to using 'Content here, content\nhere', making it look like readable English. ",

                                  style: TextStyle(
                                      color: Color.fromARGB(255, 148, 134, 134),
                                      fontSize: 12
                                  ),

                                ),
                              ),

                            ],
                          ),







                          ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



                        ],
                      ),

                    ),
                    visible: extension2,
                  ),

                ],
              ),
            ),



            ///////////////////////////////////////////////////////////////////////



            Padding(
              padding: const EdgeInsets.fromLTRB(30,0,30,20),//(left, top, right, bottom)//all(20),
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
                            Text("Do you have Other Diseases?",


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




                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Yes/No",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 105, 57),
                                      fontSize: 12
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Disease",

                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 105, 57),
                                      fontSize: 12
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Condition",

                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 105, 57),
                                      fontSize: 12
                                  ),

                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Rating",


                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 105, 57),
                                      fontSize: 12
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Action",

                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 105, 57),
                                      fontSize: 12
                                  ),

                                ),
                              ),
                            ],
                          ),



                          ///////////////////////////////////////////////////////


                          Row(
                            children: [
                              Padding(
                                padding: const EdgeInsets.fromLTRB(20,0,0,0),//(left, top, right, bottom)//all(8.0),
                                child: Text("Yes",
                                  style: TextStyle(
                                      color: Color.fromARGB(255, 65, 63, 63),
                                      fontSize: 12
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(20,0,0,0),
                                child: Text("Allergic",

                                  style: TextStyle(
                                      color: Color.fromARGB(255, 65, 63, 63),
                                      fontSize: 12
                                  ),
                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(25,0,0,0),
                                child: Text("Severe",

                                  style: TextStyle(
                                      color: Color.fromARGB(255, 65, 63, 63),
                                      fontSize: 12
                                  ),

                                ),
                              ),

                              Padding(
                                padding: const EdgeInsets.fromLTRB(30,0,0,0),
                                child: Text("5",


                                  style: TextStyle(
                                      color: Color.fromARGB(255, 65, 63, 63),
                                      fontSize: 12
                                  ),
                                ),
                              ),

                              Padding(
                                  padding: const EdgeInsets.fromLTRB(30,0,0,0),
                                  child: Row(
                                    children: [
                                      Icon(Icons.edit,
                                        color: Color.fromARGB(255, 47, 55, 137),
                                      ),
                                      Icon(Icons.delete,

                                        color: Color.fromARGB(255, 47, 55, 137),

                                      )
                                    ],
                                  )
                              ),
                            ],
                          ),




                          Row(
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("Comment :",

                                  style: TextStyle(
                                      color: Color.fromARGB(255, 1, 105, 57),
                                      fontSize: 12
                                  ),

                                ),
                              ),

                            ],
                          ),



                          Row(
                            children: [

                              Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text("It is a long established fact that a reader will \n be distracted by the readable content of a page when\nlooking at its layout. The point of using Lorem Ipsum\nis that it has a more-or-less normal distribution of\nletters, as opposed to using 'Content here, content\nhere', making it look like readable English. ",

                                  style: TextStyle(
                                      color: Color.fromARGB(255, 148, 134, 134),
                                      fontSize: 12
                                  ),

                                ),
                              ),

                            ],
                          ),







                          ///////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////



                        ],
                      ),

                    ),
                    visible: extension3,
                  ),

                ],
              ),
            ),



            ///////////////////////////////////////////////////////////////////////






            //////////////////////////////////////////////////////////////////////









          ],
        ),
      ),
    );
  }
}