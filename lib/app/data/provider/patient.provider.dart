import 'dart:convert';
import 'dart:developer';

import 'package:wha/app/data/api.dart';
import 'package:wha/app/data/model/patient_with_name_phone.dart';
import 'package:get/get_core/src/get_main.dart';
import 'package:get/get_instance/src/extension_instance.dart';
import 'package:http/http.dart' as http;

import '../../app_state.dart';

class PatientProvider{
  final Uri _uri = Uri.parse(Api.filterByPatientPhone);
  final Map<String, String> _headers = <String, String>{
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": "true",
    "Access-Control-Allow-Headers":
    "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS",
    "Content-Type": "application/json",
    "Authorization": "Bearer " + Get.find<AppState>().accessToken
  };

  Future<PatientWithNamePhone?> getPatientWithNamePhone({required String phone})async{
    Map<String, dynamic> _body = {
      'phone': phone
    };
    http.Response _response;
    try{
      _response = await http.post(_uri, headers: _headers, body: jsonEncode(_body));
      log('patient with name phone response: ${_response.statusCode}, phone: $phone, body: ${_response.body}');
      Map<String, dynamic> data = jsonDecode(_response.body);
      int id = data['id'] ?? 0;
      String firstName = data['first_name'] ?? '';
      String lastName = data['last_name'] ?? '';
      String ph = data['phone'] ?? '';
      if(id != 0) return Future.value(PatientWithNamePhone(id: id, firstName: firstName, lastName: lastName, phone: ph));
    }catch(_){
      log(_.toString());
    }
    return Future.value(null);
  }
}
