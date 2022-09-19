







import 'dart:html';
import 'dart:typed_data';

import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';

String Uploaded_file="Choose a file                                             ";
FilePickerResult? result=null;

class P_add_Report_Type extends StatefulWidget
{

  @override
  State<P_add_Report_Type> createState() => _P_add_Report_TypeState();
}


enum SingingCharacter { M_YES,A_YES,A_NO,OD_YES,M_NO,OD_NO, X_Ray, ESR,Normal,Modarate,Sever,CBC}

class _P_add_Report_TypeState extends State<P_add_Report_Type> {
  bool extension1=false;
  bool extension2=false;
  bool extension3=false;
  bool extension4=false;


  int ang1=-90;
  int ang2=-90;
  int ang3=-90;



  SingingCharacter? _character_Select= SingingCharacter.M_NO;
  SingingCharacter? _character_Catagory= SingingCharacter.M_NO;
  SingingCharacter? _character2= SingingCharacter.A_NO;
  SingingCharacter? _character3= SingingCharacter.OD_NO;

  @override
  Widget build(BuildContext context) {
    // TODO: implement build




    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
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
                      child: Icon(Icons.search)
                  ),


                ],
              ),



              Padding(
                padding: const EdgeInsets.fromLTRB(28,15,0,21),
                child: Row(
                  children: [
                    Text("Report Type",

                      style: TextStyle(

                      ),

                    ),
                  ],
                ),
              ),


              ///////////////////////////////////////////


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
                              Text("Clinical Report          ",


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



                    Container(

                      child: Column(

                        children: [



                          //////////////////////////////////////////////////////////////


                          Visibility(
                            child: Column(

                              children: [


                                Row(
                                  children: [
                                    Padding(
                                      padding: const EdgeInsets.fromLTRB(0,34,0,0),//(left, top, right, bottom),//all(8.0),
                                      child: Text("Select Your Reports :",
                                        style: TextStyle(
                                            fontSize: 12
                                        ),
                                      ),
                                    ),
                                  ],
                                ),


                                ListView(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  children: [


                                    RadioListTile<SingingCharacter>(
                                      title: const Text('X-Ray'),
                                      value: SingingCharacter.X_Ray,
                                      groupValue: _character_Select,
                                      onChanged: (SingingCharacter? value) {
                                        setState(() {
                                          _character_Select = value;
                                        });
                                      },
                                    ),


                                    RadioListTile<SingingCharacter>(
                                      title: const Text('ESR'),
                                      value: SingingCharacter.ESR,
                                      groupValue: _character_Select,
                                      onChanged: (SingingCharacter? value) {
                                        setState(() {
                                          _character_Select = value;
                                        });
                                      },
                                    ),


                                    RadioListTile<SingingCharacter>(
                                      title: const Text('CBC'),
                                      value: SingingCharacter.CBC,
                                      groupValue: _character_Select,
                                      onChanged: (SingingCharacter? value) {
                                        setState(() {
                                          _character_Select = value;
                                        });
                                      },
                                    ),



                                  ],
                                ),








                                //////////////////////////////////////////

                                /* Row(
                                    children: [
                                      Text("Condition :",
                                        style: TextStyle(
                                            fontSize: 12
                                        ),
                                      ),
                                    ],
                                  ),


                                  ListView(
                                    shrinkWrap: true,
                                    physics: const BouncingScrollPhysics(),
                                    padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                    children: [


                                      RadioListTile<SingingCharacter>(
                                        title: const Text('Allergic'),
                                        value: SingingCharacter.Allergic,
                                        groupValue: _character_Catagory,
                                        onChanged: (SingingCharacter? value) {
                                          setState(() {
                                            _character_Catagory = value;
                                          });
                                        },
                                      ),


                                      RadioListTile<SingingCharacter>(
                                        title: const Text('Heart'),
                                        value: SingingCharacter.Heart,
                                        groupValue: _character_Catagory,
                                        onChanged: (SingingCharacter? value) {
                                          setState(() {
                                            _character_Catagory = value;
                                          });
                                        },
                                      ),


                                    ],
                                  ),*/

                                //////////////////////////



                                /*Row(
                                  children: [
                                    Text("Condition :",
                                      style: TextStyle(
                                          fontSize: 12
                                      ),
                                    ),
                                  ],
                                ),



                                ListView(
                                  shrinkWrap: true,
                                  physics: const BouncingScrollPhysics(),
                                  padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                                  children: [


                                    RadioListTile<SingingCharacter>(
                                      title: const Text('Normal'),
                                      value: SingingCharacter.Normal,
                                      groupValue: _character_Catagory,
                                      onChanged: (SingingCharacter? value) {
                                        setState(() {
                                          _character_Catagory = value;
                                        });
                                      },
                                    ),


                                    RadioListTile<SingingCharacter>(
                                      title: const Text('Moderate'),
                                      value: SingingCharacter.Modarate,
                                      groupValue: _character_Catagory,
                                      onChanged: (SingingCharacter? value) {
                                        setState(() {
                                          _character_Catagory = value;
                                        });
                                      },
                                    ),


                                    RadioListTile<SingingCharacter>(
                                      title: const Text('Severe'),
                                      value: SingingCharacter.Sever,
                                      groupValue: _character_Catagory,
                                      onChanged: (SingingCharacter? value) {
                                        setState(() {
                                          _character_Catagory = value;
                                        });
                                      },
                                    ),


                                  ],
                                ),*/





                               /* TextFormField(
                                  //initialValue: "5",
                                    keyboardType: TextInputType.number,

                                    decoration: InputDecoration(

                                      labelText: "Choose File",
                                      enabledBorder: OutlineInputBorder(
                                        borderRadius: BorderRadius.circular(3.0),
                                        borderSide: BorderSide(
                                          color: Color.fromARGB(255, 1, 105, 57),
                                        ),


                                      ),


                                    )
                                ),*/




                                ElevatedButton(


                                  style: ElevatedButton.styleFrom(

                                    minimumSize: Size(300, 40),

                                    primary: Colors.white,


                                      side: BorderSide(
                                        width: 2.0,
                                        color: Color.fromARGB(255, 1, 105, 57),
                                      )
                                  ),

                                    onPressed: () async {

                                      FilePickerResult? result = await FilePicker.platform.pickFiles();

                                      if (result != null) {
                                        Uint8List? fileBytes = result.files.first.bytes;
                                        String fileName = result.files.first.name;
                                        print(fileName);

                                        setState(() {
                                          Uploaded_file=fileName;
                                        });

                                        // Upload file
                                       // await FirebaseStorage.instance.ref('uploads/$fileName').putData(fileBytes);
                                      }





                                      // FilePickerResult? result = await FilePicker.platform.pickFiles();
                                      //
                                      // if (result != null) {
                                      //
                                      //   File file = result.files.first;
                                      //
                                      //
                                      //
                                      //   print(file.name);
                                      //   print(file.bytes);
                                      //   print(file.size);
                                      //   print(file.extension);
                                      //   print(file.path);
                                      //
                                      //   setState(() {
                                      //
                                      //     Uploaded_file=file.path.toString();
                                      //
                                      //   });



                                       // File file = File(result.files.single.path);
                                      // } else {
                                      //
                                      //
                                      //   setState(() {
                                      //
                                      //     Uploaded_file="Choose a file";
                                      //
                                      //   });
                                      //
                                      //   // User canceled the picker
                                      // }





                                    },
                                    child: Row(
                                      mainAxisAlignment: MainAxisAlignment.end,
                                      children: [
                                        Text(Uploaded_file,
                                        style: TextStyle(
                                          color: Colors.black
                                        ),
                                        ),
                                        Icon(
                                          Icons.upload_file_rounded,
                                          color: Color.fromARGB(255, 1, 105, 57),



                                        )
                                      ],
                                    )
                                ),






                                Padding(
                                  padding: const EdgeInsets.fromLTRB(0,15,0,0),//(left, top, right, bottom)//all(8.0),
                                  child: TextField(
                                    //initialValue: "5",
                                      keyboardType: TextInputType.number,
                                      maxLines: 5,
                                      decoration: InputDecoration(


                                        labelText: "Comment",
                                        enabledBorder: OutlineInputBorder(
                                          borderRadius: BorderRadius.circular(3.0),
                                          borderSide: BorderSide(
                                            color: Color.fromARGB(255, 1, 105, 57),


                                          ),


                                        ),


                                      )
                                  ),
                                ),



                                        Padding(
                                          padding: const EdgeInsets.fromLTRB(0,51,0,0),//(left, top, right, bottom)//all(8.0),
                                          child: ElevatedButton(
                                            style: ElevatedButton.styleFrom(
                                              primary: Colors.white,
                                            ),

                                          onPressed: (){},
                                    child: Text("Submit",

                                      style: TextStyle(
                                        color: Colors.black
                                      ),

                                    )
                                          ),
                                        ),



                                /////////////////////////////////////






                              ],

                            ),
                            visible: extension4,
                          ),











                          ///////////////////////////////






                          // ///////////////////////////////////////////////////

                        ],
                      ),

                    ),

                  ],
                ),
              ),


              /////////////////////////////////////////





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
                              Text("Are you suffering from allergy?          ",


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


                            ListView(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              children: [


                                RadioListTile<SingingCharacter>(
                                  title: const Text('YES'),
                                  value: SingingCharacter.A_YES,
                                  groupValue: _character2,
                                  onChanged: (SingingCharacter? value) {
                                    setState(() {
                                      _character2 = value;
                                    });
                                  },
                                ),


                                RadioListTile<SingingCharacter>(
                                  title: const Text('NO'),
                                  value: SingingCharacter.A_NO,
                                  groupValue: _character2,
                                  onChanged: (SingingCharacter? value) {
                                    setState(() {
                                      _character2 = value;
                                    });
                                  },
                                ),


                              ],
                            ),


                            // ///////////////////////////////////////////////////

                          ],
                        ),

                      ),
                      visible: extension2,
                    ),

                  ],
                ),
              ),




              //////////////////////////////////////////



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
                              Text("Are you suffering from Other Diseases?        ",


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


                            ListView(
                              shrinkWrap: true,
                              physics: const BouncingScrollPhysics(),
                              padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
                              children: [


                                RadioListTile<SingingCharacter>(
                                  title: const Text('YES'),
                                  value: SingingCharacter.OD_YES,
                                  groupValue: _character3,
                                  onChanged: (SingingCharacter? value) {
                                    setState(() {
                                      _character3 = value;
                                    });
                                  },
                                ),


                                RadioListTile<SingingCharacter>(
                                  title: const Text('NO'),
                                  value: SingingCharacter.OD_NO,
                                  groupValue: _character3,
                                  onChanged: (SingingCharacter? value) {
                                    setState(() {
                                      _character3 = value;
                                    });
                                  },
                                ),


                              ],
                            ),


                            // ///////////////////////////////////////////////////

                          ],
                        ),

                      ),
                      visible: extension3,
                    ),

                  ],
                ),
              ),








              ///////////////////////////////////////





            ],
          ),
        ),
      ),
    );
  }
}