import 'dart:convert';
import 'dart:developer';
import 'dart:js';
//import 'dart:js';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wha/app/data/service/login.service.dart';
import 'package:wha/app/data/service/login.service.dart';
import 'package:wha/app/routes/app_pages.dart';


import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:wha/app/modules/patient/p__dashboard_module/p__dashboard_page.dart';
import 'package:wha/app/modules/user_management/login_module/login_controller.dart';
import 'package:wha/app/theme/app_colors.dart';

import '../../../app_state.dart';
import '../../../data/api.dart';
import '../../../data/service/login.service.dart';
import '../../../data/service/login.service.dart';



//import '../../../data/service/login.service.dart';

class LoginPage extends GetView<LoginController> {

  ///////////////////////////////////

  final AppState appState = Get.find<AppState>();
  final Uri _loginURI = Uri.parse(Api.loginAPI);
  final Map<String, String> _headers = <String, String>{
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": "true",
    "Access-Control-Allow-Headers":
    "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS",
    "Content-Type": "application/json"
  };

  Future<bool> login( String phone,String password) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> _body = {'phone': phone, 'password': password};
    http.Response _response;
    try {
      _response = await http.post(_loginURI, headers: _headers, body: jsonEncode(_body));
      log('login response code: ${_response.statusCode}');
      if(_response.statusCode == 200){
        Map<String, dynamic> data = jsonDecode(_response.body);
        appState.accessToken = data['access_token'] ?? '';
        prefs.setString('access_token',data['access_token'] ?? '');

        Get.toNamed(Routes.P_DASHBOARD);

        return Future.value(true);
      }
    } catch (_) {}
    return Future.value(false);
  }











  ///////////////////////////





  //const LoginPage({Key? key}) : super(key: key);

  void signIn(String Phone_Number, String password, BuildContext context){
    try{

      // var response = await post(Uri.parse("https://worldhealthaid.com/api/patient/login"),
      //     body: {
      //       'phone':Phone_Number,
      //       'password':password
      //     }
      // );
      //
      // print(response.statusCode.toString());
      //
      // print(response.body.toString());
      //
      // var data=jsonDecode(response.body.toString());
      //
      //
      // print(data['error']);
      // print(data['id']);







    }catch(e)
    {
      print(e.toString());
    }






  }


  TextEditingController phoneNumberEditingController=TextEditingController();
  TextEditingController passwordEditingController=TextEditingController();




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
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor ,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: -40.0,
            right: -40.0,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                color: primaryColor,
                borderRadius: BorderRadius.circular(100)
              ),
            ),
          ),
          Positioned(
            top: 50.0,
            right: 50.0,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(100)
              ),
            ),
          ),
          Positioned(
            bottom: -40.0,
            left: -40.0,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(100)
              ),
            ),
          ),
          Positioned(
            bottom: 60.0,
            left: 45.0,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: backgroundColor,
                  borderRadius: BorderRadius.circular(100),
                border: Border.all(
                  width: 3,
                  color: secondaryColor
                ),
              ),
              child: Center(
                child: Image.asset(
                  'assets/icon.png',
                  height: 50,
                  width: 50,
                ),
              ),
            ),
          ),
          Positioned(
            child: Center(
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: 115,
                        child: CountryCodePicker(
                          onChanged: (CountryCode countryCode) {
                            controller.countryCode = countryCode.toString();
                          },
                          initialSelection: 'BD',
                          favorite: const [
                            '+880',
                            '+91',
                            'United Kingdom'
                          ],
                          showCountryOnly: true,
                          showOnlyCountryWhenClosed: false,
                          alignLeft: false,
                          padding: const EdgeInsets.all(0.0),
                          enabled: controller.opacity == 1.0 ? true : false,
                          showFlagDialog: true,
                          showFlag: true,
                          flagWidth: 35,
                          showDropDownButton: false,
                          closeIcon: const Icon(
                            Icons.close,
                            color: primaryColor,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      SizedBox(
                        width: ((size.width - 108) * 0.9),
                        child: Form(
                          key: controller.formKey,
                          child: TextFormField(
                            controller: phoneNumberEditingController,
                            cursorColor: primaryColor,
                            inputFormatters: [
                              FilteringTextInputFormatter.digitsOnly
                            ],
                            keyboardType: TextInputType.phone,
                            decoration: const InputDecoration(
                              border: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: primaryColor, width: 2.0),
                              ),
                              enabledBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: primaryColor, width: 1.0),
                              ),
                              focusedBorder: UnderlineInputBorder(
                                borderSide: BorderSide(
                                    color: primaryColor, width: 2.0),
                              ),
                              hintText: 'phone',
                              enabled: true,
                              focusColor: primaryColor,
                            ),
                            enabled: controller.opacity == 1.0
                                ? true
                                : false,
                            onSaved: (String? value) {
                              controller.phone = value ?? '';
                            },
                            onChanged: (String? value) {
                              controller.phone = value ?? '';
                              // controller.validate();
                            },
                            validator: (value) {
                              if (value == null || value.isEmpty) {
                                return 'phone is required';
                              }
                              return null;
                            },
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(
                        width: ((size.width - 120) * 0.9) + 120,
                        child: TextFormField(
                          controller: passwordEditingController,
                          cursorColor: primaryColor,
                          inputFormatters: [
                            FilteringTextInputFormatter.digitsOnly
                          ],
                          keyboardType: TextInputType.phone,
                          decoration: const InputDecoration(
                            border: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: primaryColor, width: 2.0),
                            ),
                            enabledBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: primaryColor, width: 1.0),
                            ),
                            focusedBorder: UnderlineInputBorder(
                              borderSide: BorderSide(
                                  color: primaryColor, width: 2.0),
                            ),
                            hintText: 'password',
                            enabled: true,
                            focusColor: primaryColor,
                          ),
                          enabled: controller.opacity == 1.0
                              ? true
                              : false,
                          onSaved: (String? value) {
                            controller.phone = value ?? '';
                          },
                          onChanged: (String? value) {
                            controller.phone = value ?? '';
                            // controller.validate();
                          },
                          validator: (value) {
                            if (value == null || value.isEmpty) {
                              return 'phone is required';
                            }
                            return null;
                          },
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 10),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      InkWell(
                        onTap: () => controller.forgotPassword(),
                        child: Padding(
                          padding: const EdgeInsets.fromLTRB(8, 4, 8, 4),
                          child: Text(
                            'Forgot your password ? ',
                            style: TextStyle(
                              color: Colors.red.shade900,
                              fontSize: 15,
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(width: 15),
                    ],
                  ),
                  const SizedBox(height: 20),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      SizedBox(
                        height: 45,
                        width: ((size.width - 120) * 0.9) + 120,
                        child: ElevatedButton(
                          onPressed:() /*controller.opacity == 1.0 ?()*/ {
                            //controller.signIn();

                           // signIn(phoneNumberEditingController.text.toString(),passwordEditingController.text.toString(),context);
                            //loginService.login( phone,password);
                            login(phoneNumberEditingController.text.toString(), passwordEditingController.text.toString());





                          },
                              //: null,
                          style: ButtonStyle(
                            elevation: MaterialStateProperty.all(0.3),
                            backgroundColor: MaterialStateProperty.all(primaryColor),
                          ),
                          child: const Text(
                            'SIGN IN',
                            style: TextStyle(
                                fontSize: 15, color: backgroundColor),
                            softWrap: true,
                            textAlign: TextAlign.center,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Row(
                        children: [
                          const Text(
                            'Do not have an account ? ',
                            style: TextStyle(
                              fontSize: 14,
                            ),
                          ),
                          InkWell(
                            onTap: (){
                              controller.signUp();
                            },
                            child: const Padding(
                              padding: EdgeInsets.fromLTRB(8, 4, 8, 4),
                              child: Text(
                                'SIGN UP',
                                style: TextStyle(
                                  color: primaryColor,
                                  fontWeight: FontWeight.bold,
                                  fontSize: 16,
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              )
            ),
          ),
        ],
      ),
    );
  }
}
