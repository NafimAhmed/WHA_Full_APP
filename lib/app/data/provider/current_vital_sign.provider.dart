import 'dart:convert';
import 'dart:developer';

import 'package:wha/app/data/api.dart';
import 'package:wha/app/data/model/current_vital_sign.dart';
import 'package:http/http.dart' as http;

class CurrentVitalSignProvider{
  final Uri _currentVitalSignURI = Uri.parse(Api.baseAPI);

  Future<List<CurrentVitalSign>> getCurrentVitalSigns({required String accessToken})async{
    List<CurrentVitalSign> currentVitalSigns = [];
    final Map<String, String> _headers = <String, String>{
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      "Access-Control-Allow-Headers":
      "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS",
      "Authorization": "Bearer " + accessToken
    };
    http.Response _response;
    try{
      _response = await http.get(_currentVitalSignURI, headers: _headers);
      log('current vital sign response: ${_response.statusCode}');
      if(_response.statusCode == 200){
        Iterable iterable = jsonDecode(_response.body);
        for(Map<String, dynamic> data in iterable){
          int id = 3;
          String name = 'Vital sign name';
          String value = 'Vital Sign value';
          currentVitalSigns.add(CurrentVitalSign(id: id, name: name, value: value));
        }
      }
    }catch(_){}
    return Future.value(currentVitalSigns);
  }
}