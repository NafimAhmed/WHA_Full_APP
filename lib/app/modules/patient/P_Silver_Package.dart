




import 'package:flutter/material.dart';
import 'package:wha/app/modules/patient/P_Package_Confirm_Payment.dart';

class P_Silver_Package extends StatelessWidget
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




            //assets/silver_package.jpg
            
            GestureDetector(



              onTap: (){

                //P_Package_Confirm_Payment

                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) =>
                            P_Package_Confirm_Payment()
                    )
                );

              },

                child: Image.asset("assets/silver_package.jpg")
            )




          ],
        ),
      ),
    );
  }

}