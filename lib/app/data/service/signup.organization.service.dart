import 'dart:convert';
import 'dart:developer';

import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class SignupOrganizationService{
  final AppState appState = Get.find<AppState>();
  final Uri _signupOrganization = Uri.parse(Api.signupOrganization);
  final Map<String, String> _headers = <String, String>{
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": "true",
    "Access-Control-Allow-Headers":
    "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS",
  };

  Future<bool> signupOrganization({required String name, required String phone, required String password, required int otp})async{
    final Map<String, dynamic> _body = {
      'name': name,
      'phone': phone,
      'password': password,
      'otp': otp
    };
    final http.Response _response;
    try{
      _response = await http.post(_signupOrganization, headers: _headers, body: _body);
      log('signup organization response: ${_response.statusCode}');
      if(_response.statusCode == 200){
        Map<String, dynamic> data = jsonDecode(_response.body);
        appState.accessToken = data['access_token'] ?? '';
        return Future.value(true);
      }
    }catch(_){}
    return Future.value(false);
  }
}