import 'dart:convert';
import 'dart:developer';
import 'dart:js';

import 'package:flutter/services.dart';
import 'package:http/http.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wha/app/modules/patient/p_sign_up_module/p_sign_up_controller.dart';
import 'package:wha/app/modules/user_management/confirm_phone_module/confirm_phone_controller.dart';
import 'package:wha/app/routes/app_pages.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

import '../../../app_state.dart';
import '../../../data/api.dart';
import '../p__dashboard_module/p__dashboard_page.dart';

class PSignUpPage extends GetView<PSignUpController> {




   PSignUpPage({Key? key}) : super(key: key);

   // String phone_number;
   // int otp;
   //
   //
   //
   // PSignUpPage(this.phone_number,this.otp);

   bool goodToGo=false;


  TextEditingController nameEditingController=TextEditingController();
  TextEditingController passwordEditingController=TextEditingController();
  TextEditingController addressEditingController=TextEditingController();

   TextEditingController phoneEditingController=TextEditingController();

  ////////////////////////////////////////////////


    Future<void> _showMyDialog(BuildContext context,String message) async {
      return showDialog<void>(
        context: context,
        barrierDismissible: false, // user must tap button!
        builder: (BuildContext context) {
          return AlertDialog(
            title:  Text(message),
            content: SingleChildScrollView(
              child: ListBody(
                children: const <Widget>[
                  //Text('Body'),
                  //Text('Body'),
                ],
              ),
            ),
            actions: <Widget>[
             TextButton(
                child: const Text('OK'),
                onPressed: () {

                  Navigator.of(context).pop();
                  Navigator.pop(context);

   //               Get.toNamed(Routes.P_DASHBOARD);
               },
              ),
            ],
          );
        },
      );
    }



   final AppState appState = Get.find<AppState>();
   final Uri _signupPatient = Uri.parse(Api.signupPatient);
   final Map<String, String> _headers = <String, String>{
     "Access-Control-Allow-Origin": "*",
     "Access-Control-Allow-Credentials": "true",
     "Access-Control-Allow-Headers":
     "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
     "Access-Control-Allow-Methods": "POST, OPTIONS",
     "Content-Type": "application/json"
   };

   Future<bool> signupPatient(
        String name,
          String image,
          String address,
          String phone,
          int otp,
          String password, BuildContext context) async {
     final SharedPreferences prefs = await SharedPreferences.getInstance();
     final Map<String, dynamic> _body = {
       'name': name,
       'image': image,
       'address': address,
       'phone': phone,
       'otp': otp,
       'password': password,
     };
     final http.Response _response;
     try {
       _response =
       await http.post(_signupPatient, headers: _headers, body: jsonEncode(_body));
       log('signup patient response: ${_response.statusCode}');
       if (_response.statusCode == 200) {
         Map<String, dynamic> data = jsonDecode(_response.body);
         appState.accessToken = data['access_token'] ?? '';
         prefs.setString('access_token',data['access_token'] ?? '');

         Get.toNamed(Routes.P_DASHBOARD);
         return Future.value(true);
       }else{

         ScaffoldMessenger.of(context).showSnackBar(SnackBar(
           content: Text("You are already registered"),
         ));

       }
     } catch (_) {}
     return Future.value(false);
   }


   Future<bool> registerPatient(
       {required String name,
         required String image,
         required String address,
         required String phone,
         required int otp,
         required String password}) async {
     final Map<String, dynamic> _body = {
       'name': name,
       'image': image,
       'address': address,
       'phone': phone,
       'otp': otp,
       'password': password,
     };
     final http.Response _response;
     try {
       _response =
       await http.post(_signupPatient, headers: _headers, body: jsonEncode(_body));
       log('register patient response: ${_response.statusCode}');
       if (_response.statusCode == 200) {

         return Future.value(true);
       }
     } catch (_) {}
     return Future.value(false);
   }




   //////////////////////////////////////////////////////////////////


   // void Register(String Name, String Address, String Password, BuildContext context)async{
   //   try{
   //
   //     var response = await post(Uri.parse("https://worldhealthaid.com/api/signupPatient"),
   //         body: {
   //           'first_name':Name,
   //           'address':Address,
   //           'password':Password,
   //         }
   //     );
   //
   //     print(response.statusCode.toString());
   //
   //     print(response.body.toString());
   //
   //     var data=jsonDecode(response.body.toString());
   //
   //
   //     print(data['status']);
   //     print(data['message']);
   //
   //      if(data['status']=="false") {
   //        //Get.toNamed(Routes.P_DASHBOARD);
   //
   //       ///////////////////////////////////////////
   //
   //
   //
   //
   //        //_showMyDialog(context,data['message'].toString());
   //
   //
   //
   //        ///////////////////////////////
   //
   //
   //      }
   //      else{
   //        Get.toNamed(Routes.P_DASHBOARD);
   //
   //      }
   //
   //   }catch(e)
   //   {
   //     print(e.toString());
   //   }
   //
   // }
   //

   //////////////////////////////////////////////









   ///////////////////////////////////////////////////////////




   //= {'zero': 0, 'one': 1, 'two': 2};


  /*void Register(String Name, String Address, String Password)async {
    Map<String, String> map1 ;
    try {

      map1={'name':Name,'address':Address,'password':Password};

      var response = await post(
          Uri.parse("https://worldhealthaid.com/api/patient_register"),
          body: {
            'first_name': Name,
            'password': Password,
            'phone': Address

          }
      );


      print(response.statusCode.toString());

      print(response.body.toString());
      if(response.statusCode==200)
        {
          Get.toNamed(Routes.P_DASHBOARD);

        }

      var data = jsonDecode(response.body.toString());


      print(data['error']);
     // print(data['id']);

      if (data['error'] == null) {
        //PDashboardPage


        //BuildContext context;
        /*Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) =>
                    PDashboardPage()));*/

        Get.toNamed(Routes.P_DASHBOARD);
      }
    } catch (e) {
      print(e.toString());
    }
  }*/






    @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarColor: primaryColor,
        systemNavigationBarDividerColor: primaryColor,
        systemStatusBarContrastEnforced: false,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    Size size = MediaQuery.of(context).size;

    ///////////////////////////////////////








    /////////////////////////




    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: true,
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Image(
                image: AssetImage(
                  'assets/logo.png',
                ),
                height: 30,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey,
                        child: ClipOval(
                          child: SizedBox(
                            width: 150.0,
                            height: 150.0,
                            child: controller.image,
                          ),
                        ),
                      ),
                      PhysicalModel(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(50),
                        elevation: 1,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.camera_alt,
                            size: 30,
                            color: secondaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 33,
                    width: 130,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Upload Image',
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(Colors.grey.shade100),
                        elevation: MaterialStateProperty.all(0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 50),
          Form(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Patient name',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),




                  const SizedBox(height: 12),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      controller: nameEditingController,
                      cursorColor: primaryColor,
                      keyboardType: TextInputType.name,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 2.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 2.0),
                        ),
                        hintText: 'patient name',
                        enabled: controller.formOpacity == 1 ? true : false,
                        focusColor: primaryColor,
                      ),
                      onSaved: (String? value) {
                        controller.name = value ?? '';
                        controller.refreshSignupButtonColor();
                      },
                      onChanged: (String? value) {
                        controller.name = value ?? '';
                        controller.refreshSignupButtonColor();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'name is required';
                          goodToGo=false;

                        }else{
                          goodToGo=true;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),






                  const Text(
                    'Address',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 50,
                    child: TextFormField(

                      controller: addressEditingController,
                      cursorColor: primaryColor,
                      keyboardType: TextInputType.name,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 2.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 2.0),
                        ),
                        hintText: 'address',
                        enabled: controller.formOpacity == 1 ? true : false,
                        focusColor: primaryColor,
                      ),
                      onSaved: (String? value) {
                        controller.name = value ?? '';
                        controller.refreshSignupButtonColor();
                      },
                      onChanged: (String? value) {
                        controller.name = value ?? '';
                        controller.refreshSignupButtonColor();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'address is required';
                          goodToGo=false;
                        }
                        else{
                          goodToGo=true;
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    'Phone Number',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 12),


                 /////////////////////////////////////////////


                  SizedBox(
                    height: 50,
                    child: TextFormField(

                      controller: phoneEditingController,

                      cursorColor: primaryColor,
                      keyboardType: TextInputType.name,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 2.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 2.0),
                        ),
                        hintText: 'Phone Number',
                        enabled: controller.formOpacity == 1 ? true : false,
                        focusColor: primaryColor,
                      ),
                      onSaved: (String? value) {
                        controller.name = value ?? '';
                        controller.refreshSignupButtonColor();
                      },
                      onChanged: (String? value) {
                        controller.name = value ?? '';
                        controller.refreshSignupButtonColor();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Phone number is required';
                          goodToGo=false;
                        }
                        else{
                          goodToGo=true;
                        }
                        return null;
                      },
                    ),
                  ),









                 /////////////////////////////////////////////



                  const SizedBox(height: 20),


                  const Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),






                  SizedBox(
                    height: 50,
                    child: TextFormField(

                      controller: passwordEditingController,

                      cursorColor: primaryColor,
                      keyboardType: TextInputType.name,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 2.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 2.0),
                        ),
                        hintText: 'password',
                        enabled: controller.formOpacity == 1 ? true : false,
                        focusColor: primaryColor,
                      ),
                      onSaved: (String? value) {
                        controller.name = value ?? '';
                        controller.refreshSignupButtonColor();
                      },
                      onChanged: (String? value) {
                        controller.name = value ?? '';
                        controller.refreshSignupButtonColor();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'password is required';
                          goodToGo=false;
                        }
                        else{
                          goodToGo=true;
                        }
                        return null;
                      },
                    ),
                  ),



                  const SizedBox(height: 20),

                  const Text(
                    'Confirm Password',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 50,
                    child: TextFormField(

                      controller: passwordEditingController,


                      cursorColor: primaryColor,
                      keyboardType: TextInputType.name,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 2.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 2.0),
                        ),
                        hintText: 'confirm password',
                        enabled: controller.formOpacity == 1 ? true : false,
                        focusColor: primaryColor,
                      ),
                      onSaved: (String? value) {
                        controller.name = value ?? '';
                        controller.refreshSignupButtonColor();
                      },
                      onChanged: (String? value) {
                        controller.name = value ?? '';
                        controller.refreshSignupButtonColor();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'password is required';
                          goodToGo=false;
                        }
                        else{
                          goodToGo=true;

                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: size.width,
                    child: ElevatedButton(
                      onPressed: (){

                        ///////////////////////////////////////

                       signupPatient(nameEditingController.text.toString(),"assets/icon.png",phoneEditingController.text.toString(),addressEditingController.text.toString(),123456,passwordEditingController.text.toString(),context);




                        // if(a!=true)
                        //   {
                        //     //Get.toNamed(Routes.P_DASHBOARD);
                        //     _showMyDialog(context,"This number is already registered");
                        //   }
                        // else{
                        //
                        // }


                        //Register(nameEditingController.text.toString(),addressEditingController.text.toString(),passwordEditingController.text.toString(),context);
                       /* if(nameEditingController.text.toString()!=null&&passwordEditingController.text.toString()!=null&&addressEditingController.text.toString()!=null) {
                          Get.toNamed(Routes.P_DASHBOARD);
                          print(nameEditingController.text.toString());
                        }*/

                        /////////////////////////


                      },
                      child: const Text(
                          'SIGN UP',
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(primaryColor),
                        elevation: MaterialStateProperty.all(1),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );




  }
}
