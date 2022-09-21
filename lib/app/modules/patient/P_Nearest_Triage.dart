



import 'package:flutter/material.dart';

import 'P_Nearest_Triage_Detail.dart';

class P_Nearest_Triage extends StatelessWidget
{

  List<String> phamacy_Name=['Maa Hospital','Tasfia hospital','Apon Hospital','Rampura hospital','Lab Aid Hospital'];


  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(

        body: Column(
          children: [


            Padding(
              padding: const EdgeInsets.fromLTRB(31,0,0,15),//(left, top, right, bottom),
              child: Row(
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
            ),




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
                                    P_Nearest_Triage_Detail()
                            )
                        );




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



          ],
        ),

      ),

    );
  }

}