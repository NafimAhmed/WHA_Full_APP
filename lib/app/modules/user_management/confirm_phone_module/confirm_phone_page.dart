import 'dart:convert';
import 'dart:developer';

import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:http/http.dart'as http;
import 'package:wha/app/modules/user_management/confirm_phone_module/confirm_phone_controller.dart';
import 'package:wha/app/modules/user_management/verify_otp_module/verify_otp_page.dart';
import 'package:wha/app/routes/app_pages.dart';
import 'package:wha/app/theme/app_colors.dart';

import '../../../data/api.dart';
import '../../../utils/strings.dart';


class ConfirmPhonePage extends GetView<ConfirmPhoneController> {
  //const ConfirmPhonePage({Key? key}) : super(key: key);

  //////////////////////////////////////////
  TextEditingController phoneEditingController=TextEditingController();




 /* void Verifi_Phone(String Phone)async {

    try {



      var response = await http.post(
          Uri.parse("https://worldhealthaid.com/api/verify_code_login"),
          body: {
            'phone': Phone
          }
      );


      print(response.statusCode.toString());

      print(response.body.toString());
      // if(response.statusCode==200)
      // {
      //   Get.toNamed(Routes.P_DASHBOARD);
      //
      // }

     // var data = jsonDecode(response.body.toString());


     // print(data.toString());
      // print(data['id']);

    //   if (data['error'] == null) {
    //
    //   }
    } catch (e) {
      print(e.toString());
     }
  }*/


  ///////////////////////////////////////////






  final String _otpID = 'tribd';
  final String _otpPassword = '8E3FNGQK';
  final Uri _otpURI = Uri.parse(Api.otpAPI);

  Future<int> sendOtp({required String number, required int otp})async{
    final Map<String, String> _headers = <String, String>{
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "GET, POST",
    };
    final Map<String, String> message = {
      'username': _otpID,
      'password': _otpPassword,
      'number': number,
      'message': '<#> your Wha verification code is $otp\n\n$whaHashKey'
    };
    http.Response _response;
    try{
      _response = await http.post(_otpURI, headers: _headers, body: message);
      log('otp response: ${_response.statusCode}: ${_response.body}');
      if(_response.statusCode == 200){
        Get.toNamed(Routes.VERIFY_OTP);
        return int.parse(_response.body.substring(0, 4));
      }
    }catch(_){}
    return -1;
  }








//////////////////////////////////////////


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
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: const [
                        Image(
                          image: AssetImage(
                            'assets/logo.png'
                          ),
                          height: 50,
                        ),
                      ],
                    ),
                    const SizedBox(height: 30),
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
                              controller: phoneEditingController,
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
                    const SizedBox(height: 30),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 45,
                          width: ((size.width - 120) * 0.9) + 120,
                          child: ElevatedButton(
                            /*controller.opacity == 1.0? */
                            onPressed: () {



                              sendOtp(
                                  number: phoneEditingController.text.toString(),//phoneEditingController.text.toString(),
                                otp: 123456

                              );

                              // Navigator.push(
                              //     context,
                              //     MaterialPageRoute(
                              //         builder: (context) =>
                              //             VerifyOtpPage()
                              //     )
                              // );

                              //Verifi_Phone(phoneEditingController.text.toString());

                              controller.confirmPhone();
                            },

                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0.3),
                              backgroundColor: MaterialStateProperty.all(primaryColor),
                            ),
                            child: const Text(
                              'Get verification code',
                              style: TextStyle(
                                  fontSize: 15, color: backgroundColor),
                              softWrap: true,
                              textAlign: TextAlign.center,
                            ),
                          ),
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
