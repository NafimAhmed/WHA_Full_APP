import 'package:flutter/material.dart';


class p_Pharmacy_Detail extends StatelessWidget
{
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

            Padding(
              padding: const EdgeInsets.fromLTRB(25,50,0,31),//(left, top, right, bottom)//.all(8.0),
              child: Container(
                child: Image.asset("assets/map.jpg",
                  height: 200,
                  width: 350,
                ),
              ),
            ),


            Padding(
              padding: const EdgeInsets.fromLTRB(25,0,0,31),//(left, top, right, bottom)//.all(8.0),
              child: Container(
                child: Image.asset("assets/location.jpg",
                  //height: 200,
                  //width: 350,
                ),
              ),
            )



          ],
        ),
      ),
    );
  }

}