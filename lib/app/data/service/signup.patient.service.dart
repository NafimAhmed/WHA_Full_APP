import 'dart:convert';
import 'dart:developer';

import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class SignupPatientService {
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
      {required String name,
      required String image,
      required String address,
      required String phone,
      required int otp,
      required String password}) async {
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
        return Future.value(true);
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
}
