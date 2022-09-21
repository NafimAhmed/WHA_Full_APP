



import 'package:flutter/material.dart';

class P_Nearest_Triage_Detail extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
   return MaterialApp(
     home: Scaffold(
       body: Column(
         children: [

           Padding(
             padding: const EdgeInsets.fromLTRB(31,50,0,0),
             child: Image.asset("assets/map.jpg",
               width: 300,
               height: 157,
               alignment: Alignment.center,
             ),
           ),



           Padding(
             padding: const EdgeInsets.fromLTRB(31,0,0,0),//(left, top, right, bottom)//all(8.0),
             child: Image.asset("assets/location.jpg",
               width: 300,
               height: 460,
               alignment: Alignment.center,
             ),
           ),


         ],
       ),
     ),
   );
  }

}