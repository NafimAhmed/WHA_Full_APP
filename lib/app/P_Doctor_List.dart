

import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;

class P_Doctor_List extends StatefulWidget
{

  @override
  State<P_Doctor_List> createState() => _P_Doctor_ListState();
}

class _P_Doctor_ListState extends State<P_Doctor_List> {
  ////////////////////////////////////////

  String bdy="nothing";
  List<dynamic> list=[
    {
      "id": 64,
      "role_id": 1,
      "first_name": "Arup Sarker",
      "last_name": null,
      "phone": "+8801754925692",
      "fee": 0,
      "vat": 0,
      "gender": "1",
      "address": null,
      "image": "assets/backend/images/user/xMAit2NKk4I4NGvfbxZ48nUfT21ClLQUyswTyNfC.jpg",
      "email": "arupsarker.tri@gmail.com",
      "specialist": "[\"7\"]",
      "status": 1
    },
    {
      "id": 658,
      "role_id": 1,
      "first_name": "Dr. Abed-Al-Hasnat",
      "last_name": null,
      "phone": "+8801712173931",
      "fee": 100,
      "vat": 0,
      "gender": "1",
      "address": "Charpara, Mymensingh.",
      "image": "assets/backend/images/user/zb2BuTpQWDt3j44VeQpY1E6BdXVVZJO6mSbMsONb.jpg",
      "email": "abedhasnat@gmail.com",
      "specialist": "[\"17\"]",
      "status": 1
    },
    {
      "id": 576,
      "role_id": 1,
      "first_name": "Dr. Minhaj Uddin, PT",
      "last_name": null,
      "phone": "+8801954207707",
      "fee": 0,
      "vat": 0,
      "gender": "1",
      "address": "Chadpur",
      "image": null,
      "email": "morujhorsaimom@gmail.com",
      "specialist": "[\"7\"]",
      "status": 1
    },
    {
      "id": 635,
      "role_id": 1,
      "first_name": "Dr.Falgune nath",
      "last_name": null,
      "phone": "01859-454089",
      "fee": 100,
      "vat": 0,
      "gender": "2",
      "address": null,
      "image": "assets/backend/images/user/MbJvzoWisi7LCb190cbKLQ1OV6xu6kGUN2nRaTP0.jpg",
      "email": "falgunenath@gmail.com",
      "specialist": "[\"17\"]",
      "status": 1
    },
    {
      "id": 665,
      "role_id": 1,
      "first_name": "Dr.Md.Shahabuddin Rony",
      "last_name": null,
      "phone": "+8801878350839",
      "fee": 0,
      "vat": 0,
      "gender": "1",
      "address": "Present:Noor jahan villa,Hazi Wazed R/A,77 Kulgaon,Bayezid,Chattogram.post code :4210",
      "image": "assets/backend/images/user/gullZSEjCgAougdaWUw5X5KGNgKW3X06MgvIE8TN.jpg",
      "email": "drshahabasif@gmail.com",
      "specialist": "[\"4\"]",
      "status": 1
    },
    {
      "id": 872,
      "role_id": 1,
      "first_name": "Faisal Kabir",
      "last_name": null,
      "phone": "+8801303613328",
      "fee": 0,
      "vat": 0,
      "gender": null,
      "address": "Dhaka, , Dhaka District, Dhaka Division",
      "image": "assets/backend/images/user/1661cc589a6e7bd_1.jpg",
      "email": null,
      "specialist": "[2]",
      "status": 1
    },
    {
      "id": 120,
      "role_id": 1,
      "first_name": "Fazlul Karim",
      "last_name": null,
      "phone": "+8801726344575",
      "fee": 0,
      "vat": 0,
      "gender": "1",
      "address": null,
      "image": "assets/backend/images/user/ds6LFzO4AXxfzGQSpHITjdJFDRvEBFRrOZL47QkY.jpg",
      "email": "fazlulkarimm47@gmail.com",
      "specialist": "[\"14\"]",
      "status": 1
    },
    {
      "id": 110,
      "role_id": 1,
      "first_name": "JULFIARA",
      "last_name": null,
      "phone": "+8801975552716",
      "fee": 100,
      "vat": 0,
      "gender": "2",
      "address": "91SHS tower wireless railgate boro moghbazar",
      "image": null,
      "email": "dr.julfiara@gmail.com",
      "specialist": "[\"17\"]",
      "status": 1
    },
    {
      "id": 141,
      "role_id": 1,
      "first_name": "JULFIARA",
      "last_name": null,
      "phone": "+8801768600167",
      "fee": 100,
      "vat": 0,
      "gender": "2",
      "address": "91SHS tower wireless railgate boro moghbazar",
      "image": null,
      "email": "julfiara.mim@gmail.com",
      "specialist": "[\"17\"]",
      "status": 1
    },
    {
      "id": 637,
      "role_id": 1,
      "first_name": "Keya Das",
      "last_name": null,
      "phone": "+8801935103903",
      "fee": 100,
      "vat": 0,
      "gender": "2",
      "address": "24/1 Gopal shah lane, sutrapur.",
      "image": "assets/backend/images/user/xTDIzxw9XpaUTJpjXdWQBOfVDCpl1RwZGA80Hgxv.jpg",
      "email": "keyadas001@gmail.com",
      "specialist": "[\"17\"]",
      "status": 1
    },
    {
      "id": 812,
      "role_id": 1,
      "first_name": "shanjida",
      "last_name": null,
      "phone": "+8801721356203",
      "fee": 0,
      "vat": 0,
      "gender": null,
      "address": "Dhaka, Badda, Dhaka District, Dhaka Division",
      "image": null,
      "email": null,
      "specialist": "[2]",
      "status": 1
    },
    {
      "id": 18,
      "role_id": 1,
      "first_name": "Trinath",
      "last_name": "Saha",
      "phone": "+8801751867845",
      "fee": 100,
      "vat": 0,
      "gender": "3",
      "address": "rampura",
      "image": "assets/backend/images/user/sGbVJttVXwFggb56VmLOxdGSPt1xUA7rBInv0uTW.png",
      "email": "tri@gmail.com",
      "specialist": "[\"17\"]",
      "status": 1
    }
  ];








  /*Future getUserData() async
  {
    var response=await http.get(
        Uri.parse('https://worldhealthaid.com/api/doctor/list')
    );

   /* setState((){
      list = jsonDecode(response.body);
      // list=list?..sort((a,b)=>a['id'].compareTo(b['id']));    [index]['created_at'].toString()
      list=list?..sort((a,b)=>a['created_at'].compareTo(b['created_at']));

    });*/

    print(response.body.toString());
    bdy=list!.length.toString();



  }*/

  /////////////////////////////////






  @override
  Widget build(BuildContext context) {
    // TODO: implement build
    return MaterialApp(
      home: Scaffold(
        body: SingleChildScrollView(
          child: Column(
            children: [







              ListView.builder(
                  itemCount: list.length,
                  physics: ClampingScrollPhysics(),
                  shrinkWrap: true,
                  itemBuilder: (BuildContext context, int index) {

                    return Padding(
                      padding: const EdgeInsets.fromLTRB(30,0,30,7),//all(3.0),
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
                                    child: Text(list[index]["first_name"],

                                      style: TextStyle(fontSize: 12,
                                          fontWeight: FontWeight.bold,
                                          color: Colors.black
                                      ),

                                    ),

                                    // Icon(Icons.thermostat_auto),



                                  ),

                                  // Container(
                                  //     alignment: Alignment.topRight,
                                  //     child: Icon(Icons.edit_outlined)
                                  // ),




                                ],
                              ),


                              Row(
                                children: [

                                  CircleAvatar(

                                    backgroundImage: AssetImage("image/person.jpg"),
                                    radius: 22,

                                  ),



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
                    );//Text('Child');
                  }
              ),






            ],

          ),
        ),
      ),
    );
  }

  /*@override
  void initState() {

    getUserData();

    super.initState();


  }*/




}