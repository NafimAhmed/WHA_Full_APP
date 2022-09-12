import 'dart:convert';
import 'dart:developer';

import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class JoinService{
  final AppState appState = Get.find<AppState>();
  final Uri _joinURI = Uri.parse(Api.joinAPI);
  final Map<String, String> _headers = <String, String>{
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": "true",
    "Access-Control-Allow-Headers":
    "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS",
    "Content-Type": "application/json"
  };

  Future<bool> join({required String phone, required  int otp})async{
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    Map<String, dynamic> _body = {'phone': phone, 'otp': otp};
    http.Response _response;
    try{
      _response = await http.post(_joinURI, headers: _headers, body: jsonEncode(_body));
      log('join with otp response: ${_response.statusCode}');
      if(_response.statusCode == 200){
        Map<String, dynamic> data = jsonDecode(_response.body);
        appState.accessToken = data['access_token'] ?? '';
        prefs.setString('access_token',data['access_token'] ?? '');
        return Future.value(true);
      }
    }catch(_){}
    return Future.value(false);
  }
}