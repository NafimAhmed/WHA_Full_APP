import 'package:flutter/material.dart';

// class p_Edit_Profile extends StatelessWidget
// {
//   @override
//   Widget build(BuildContext context) {
//     // TODO: implement build
//     return MaterialApp(
//       home: Scaffold(
//         body: ,
//       ),
//     );
//   }
//
// }







class p_Edit_Profile extends StatelessWidget
{
  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(

        appBar: AppBar(

            backgroundColor: Colors.green.shade900,
            title: Center(
              child: Text("Edit profile",

                style: TextStyle(
                    color: Colors.white,
                    fontSize: 18
                ),

              ),
            )


        ),




        body: SingleChildScrollView(
          child: Column(



            children: [

              Padding(
                padding: const EdgeInsets.fromLTRB(0,39,0,0),//(left, top, right, bottom),
                child: Container(

                  alignment: Alignment.topCenter,

                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [


                      CircleAvatar(

                        backgroundImage: AssetImage("image/person.jpg"),
                        radius: 52,

                      ),










                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,5,0,0),//all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [


                            Padding(
                              padding: const EdgeInsets.all(0),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                    primary: Color.fromARGB(255, 219, 219, 219)
                                ),
                                onPressed: (){
                                  //
                                  // Navigator.push(
                                  //     context,
                                  //     MaterialPageRoute(
                                  //         builder: (context) =>
                                  //             Doctor_Edit_Profile()
                                  //     )
                                  // );

                                },
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [

                                    Center(
                                      child: Container(

                                        height: 30,
                                        width: 86,
                                        decoration: BoxDecoration(
                                          borderRadius: BorderRadius.circular(10),
                                          //color: Colors.green.shade900
                                        ),
                                        child: Padding(
                                          // padding: const EdgeInsets.all(8.0),

                                          padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                          child: Center(

                                            child: Text("Upload image",

                                              style: TextStyle(fontSize: 11,
                                                  //fontWeight: FontWeight.bold,
                                                  color: Color.fromARGB(255, 112, 112, 112)
                                              ),

                                            ),

                                          ),
                                        ),
                                      ),
                                    ),

                                    /*Padding(
                                            padding: const EdgeInsets.fromLTRB(0,0,0,0),//(left, top, right, bottom)//all(8.0),
                                            child: Container(
                                                child: Icon(Icons.arrow_forward)
                                            ),
                                          )*/
                                  ],
                                ),
                              ),
                            ),



                          ],
                        ),
                      ),




                    ],
                  ),




                ),
              ),






              Padding(
                padding: const EdgeInsets.fromLTRB(0,57,0,0),//(left, top, right, bottom)//all(8.0),
                child: Container(
                  child: Column(
                    children: [





                      Padding(
                        padding: const EdgeInsets.fromLTRB(30,0,0,12),//all(8.0),
                        child: Center(
                          child: Row(
                            children: [

                              Text("Edit Name",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),




                      Padding(
                        padding: const EdgeInsets.fromLTRB(30,0,30,11),//all(20),
                        child: TextFormField(
                          decoration: InputDecoration(


                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white)
                            ),


                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(width: 2, color: Colors.green.shade900)),



                            //prefixIcon: Icon(Icons.location_history_rounded),
                            hintText: "Name",
                            // filled: true, //<-- SEE HERE
                            // fillColor: Colors.grey,

                          ),
                        ),
                      ),


                      ///////////////////////////////////////////////


                      Padding(
                        padding: const EdgeInsets.fromLTRB(30,0,0,12),//all(8.0),
                        child: Center(
                          child: Row(
                            children: [

                              Text("Edit phone number",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),




                      Padding(
                        padding: const EdgeInsets.fromLTRB(30,0,30,11),//all(20),
                        child: TextFormField(
                          decoration: InputDecoration(


                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white)
                            ),


                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(width: 2, color: Colors.green.shade900)),



                            //prefixIcon: Icon(Icons.location_history_rounded),
                            hintText: "+88000000000000",
                            // filled: true, //<-- SEE HERE
                            // fillColor: Colors.grey,

                          ),
                        ),
                      ),












                      ////////////////////////////////////////








                      Padding(
                        padding: const EdgeInsets.fromLTRB(30,0,0,12),//all(8.0),
                        child: Center(
                          child: Row(
                            children: [

                              Text("Edit Email",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),




                      Padding(
                        padding: const EdgeInsets.fromLTRB(30,0,30,11),//all(20),
                        child: TextFormField(
                          decoration: InputDecoration(


                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white)
                            ),


                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(width: 2, color: Colors.green.shade900)),



                            //prefixIcon: Icon(Icons.location_history_rounded),
                            hintText: "example@gmail.com",
                            // filled: true, //<-- SEE HERE
                            // fillColor: Colors.grey,

                          ),
                        ),
                      ),



                      ///////////////////////////////////////////////


                      Padding(
                        padding: const EdgeInsets.fromLTRB(30,0,0,12),//all(8.0),
                        child: Center(
                          child: Row(
                            children: [

                              Text("Age",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),




                      Padding(
                        padding: const EdgeInsets.fromLTRB(30,0,30,11),//all(20),
                        child: TextFormField(
                          decoration: InputDecoration(


                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white)
                            ),


                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(width: 2, color: Colors.green.shade900)),



                            //prefixIcon: Icon(Icons.location_history_rounded),
                            hintText: "age",
                            // filled: true, //<-- SEE HERE
                            // fillColor: Colors.grey,

                          ),
                        ),
                      ),












                      ////////////////////////////////////////






                      Padding(
                        padding: const EdgeInsets.fromLTRB(0,12,0,0),//(left, top, right, bottom)//all(8.0),
                        child: Container(
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.start,

                            children: [

                              Column(

                                //mainAxisAlignment: MainAxisAlignment.start,


                                children: [

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(0,0,30,12),
                                    child: Container(
                                      //alignment: Alignment.topRight,
                                      child: Text("Height",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ),

                                  ),






                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(30,0,30,0),//all(20),
                                    child: SizedBox(
                                      width: 128,
                                      child: TextFormField(
                                        decoration: InputDecoration(


                                          border: new OutlineInputBorder(
                                              borderSide: new BorderSide(color: Colors.white)
                                          ),


                                          //prefixIcon: Icon(Icons.location_history_rounded),
                                          hintText: "5'9",
                                          filled: true, //<-- SEE HERE
                                          // fillColor: Colors.grey,

                                        ),
                                      ),
                                    ),
                                  ),





                                ],
                              ),



                              Column(

                                children: [

                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(30,0,30,12),
                                    child: Text("Weight",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: FontWeight.bold,
                                      ),
                                    ),

                                  ),










                                  Padding(
                                    padding: const EdgeInsets.fromLTRB(30,0,30,0),//all(20),
                                    child: SizedBox(
                                      width: 128,

                                      child: TextFormField(
                                        decoration: InputDecoration(


                                          border: new OutlineInputBorder(
                                              borderSide: new BorderSide(color: Colors.white)
                                          ),


                                          //prefixIcon: Icon(Icons.location_history_rounded),
                                          hintText: "70",
                                          filled: true, //<-- SEE HERE
                                          // fillColor: Colors.grey,

                                        ),
                                      ),
                                    ),
                                  ),





                                ],
                              ),




                            ],
                          ),

                        ),
                      ),








                      /* Row(
                        children: [
                          Column(

                            children: [


                              Padding(
                                padding: const EdgeInsets.fromLTRB(30,0,0,12),//all(8.0),
                                child: Center(
                                  child: Row(
                                    children: [

                                      Text("height",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),




                              Padding(
                                padding: const EdgeInsets.fromLTRB(30,0,30,11),//all(20),
                                child: TextFormField(
                                  decoration: InputDecoration(


                                    border: new OutlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.white)
                                    ),


                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(width: 2, color: Colors.green.shade900)),



                                    //prefixIcon: Icon(Icons.location_history_rounded),
                                    hintText: "5'7",
                                    // filled: true, //<-- SEE HERE
                                    // fillColor: Colors.grey,

                                  ),
                                ),
                              ),









                            ],
                          ),


                          Column(

                            children: [


                              Padding(
                                padding: const EdgeInsets.fromLTRB(30,0,0,12),//all(8.0),
                                child: Center(
                                  child: Row(
                                    children: [

                                      Text("height",
                                        style: TextStyle(
                                          fontSize: 16,
                                          fontWeight: FontWeight.bold,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),




                              Padding(
                                padding: const EdgeInsets.fromLTRB(30,0,30,11),//all(20),
                                child: TextFormField(
                                  decoration: InputDecoration(


                                    border: new OutlineInputBorder(
                                        borderSide: new BorderSide(color: Colors.white)
                                    ),


                                    focusedBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(10),
                                        borderSide: BorderSide(width: 2, color: Colors.green.shade900)),



                                    //prefixIcon: Icon(Icons.location_history_rounded),
                                    hintText: "5'7",
                                    // filled: true, //<-- SEE HERE
                                    // fillColor: Colors.grey,

                                  ),
                                ),
                              ),









                            ],
                          ),







                        ],
                      ),*/

/////////////////////////////////////////////

                      Padding(
                        padding: const EdgeInsets.fromLTRB(30,9,0,12),//all(8.0),
                        child: Center(
                          child: Row(
                            children: [

                              Text("Edit address",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),




                      Padding(
                        padding: const EdgeInsets.fromLTRB(30,0,30,11),//all(20),
                        child: TextFormField(
                          decoration: InputDecoration(


                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white)
                            ),


                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(width: 2, color: Colors.green.shade900)),



                            //prefixIcon: Icon(Icons.location_history_rounded),
                            hintText: "Dhaka, Bangladesh",
                            // filled: true, //<-- SEE HERE
                            // fillColor: Colors.grey,

                          ),
                        ),
                      ),




                      ////////////////////////////////


                      Padding(
                        padding: const EdgeInsets.fromLTRB(30,0,0,12),//all(8.0),
                        child: Center(
                          child: Row(
                            children: [

                              Text("Edit password",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),




                      Padding(
                        padding: const EdgeInsets.fromLTRB(30,0,30,11),//all(20),
                        child: TextFormField(
                          decoration: InputDecoration(


                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white)
                            ),


                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(width: 2, color: Colors.green.shade900)),



                            //prefixIcon: Icon(Icons.location_history_rounded),
                            hintText: "********",
                            // filled: true, //<-- SEE HERE
                            // fillColor: Colors.grey,

                          ),
                        ),
                      ),





                     /* Padding(
                        padding: const EdgeInsets.fromLTRB(30,0,0,12),//all(8.0),
                        child: Center(
                          child: Row(
                            children: [

                              Text("Edit phone number",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),




                      Padding(
                        padding: const EdgeInsets.fromLTRB(30,0,30,11),//all(20),
                        child: TextFormField(
                          decoration: InputDecoration(


                            border: new OutlineInputBorder(
                                borderSide: new BorderSide(color: Colors.white)
                            ),


                            focusedBorder: OutlineInputBorder(
                                borderRadius: BorderRadius.circular(10),
                                borderSide: BorderSide(width: 2, color: Colors.green.shade900)),



                            //prefixIcon: Icon(Icons.location_history_rounded),
                            hintText: "+8800000000000",
                            // filled: true, //<-- SEE HERE
                            // fillColor: Colors.grey,

                          ),
                        ),
                      ),*/








                      //////////////////////////////////////////



                      Row(
                        children: [
                          Padding(
                            padding: const EdgeInsets.fromLTRB(41,51,0,0),//all(8.0),
                            child: Row(
                              children: [


                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0,0,0,0),//(left, top, right, bottom)//all(0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.green.shade900
                                    ),
                                    onPressed: (){

                                      /*Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DashBoard()
                                    )
                                );*/

                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [

                                        Center(
                                          child: Container(

                                            height: 40,
                                            width: 115,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              //color: Colors.green.shade900
                                            ),
                                            child: Padding(
                                              // padding: const EdgeInsets.all(8.0),

                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                              child: Center(

                                                child: Text("Save",

                                                  style: TextStyle(fontSize: 16,
                                                      //fontWeight: FontWeight.bold,
                                                      color: Colors.white
                                                  ),

                                                ),

                                              ),
                                            ),
                                          ),
                                        ),








                                        /*Padding(
                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),//(left, top, right, bottom)//all(8.0),
                                              child: Container(
                                                  child: Icon(Icons.arrow_forward)
                                              ),
                                            )*/
                                      ],
                                    ),
                                  ),
                                ),



                              ],
                            ),
                          ),


                          Padding(
                            padding: const EdgeInsets.fromLTRB(15,51,0,0),//all(8.0),
                            child: Row(
                              children: [


                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0,0,0,0),//(left, top, right, bottom)//all(0),
                                  child: ElevatedButton(
                                    style: ElevatedButton.styleFrom(
                                        primary: Colors.red
                                    ),
                                    onPressed: (){

                                      /*Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            DashBoard()
                                    )
                                );*/

                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.center,
                                      children: [

                                        Center(
                                          child: Container(

                                            height: 40,
                                            width: 115,
                                            decoration: BoxDecoration(
                                              borderRadius: BorderRadius.circular(10),
                                              //color: Colors.green.shade900
                                            ),
                                            child: Padding(
                                              // padding: const EdgeInsets.all(8.0),

                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),
                                              child: Center(

                                                child: Text("Cancel",

                                                  style: TextStyle(fontSize: 16,
                                                      //fontWeight: FontWeight.bold,
                                                      color: Colors.white
                                                  ),

                                                ),

                                              ),
                                            ),
                                          ),
                                        ),








                                        /*Padding(
                                              padding: const EdgeInsets.fromLTRB(0,0,0,0),//(left, top, right, bottom)//all(8.0),
                                              child: Container(
                                                  child: Icon(Icons.arrow_forward)
                                              ),
                                            )*/
                                      ],
                                    ),
                                  ),
                                ),



                              ],
                            ),
                          ),













                        ],
                      ),




















                      ///////////////////////////////////////










                    ],
                  ),
                ),
              ),














            ],

          ),
        ),
      ),
    );
  }

}




