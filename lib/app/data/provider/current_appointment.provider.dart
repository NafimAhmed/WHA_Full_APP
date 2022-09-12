import 'dart:convert';
import 'dart:developer';

import 'package:wha/app/data/api.dart';
import 'package:wha/app/data/model/current_appointment.dart';
import 'package:http/http.dart' as http;

class CurrentAppointmentProvider {
  final Uri _currentAppointmentURI = Uri.parse(Api.baseAPI);

  Future<List<CurrentAppointment>> getCurrentAppointments(
      {required String accessToken}) async {
    List<CurrentAppointment> currentAppointments = [];
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
      _response = await http.get(_currentAppointmentURI, headers: _headers);
      log('current appointments response ${_response.statusCode}');
      if(_response.statusCode == 200){
        Iterable iterable = jsonDecode(_response.body);
        for(Map<String, dynamic> data in iterable){
          int id = data['id'];
          int doctorId = data['doctor_id'];
          DateTime time = DateTime(2021, 2, 3, 5, 65, 345, 234, 234);
          currentAppointments.add(CurrentAppointment(id: id, doctorId: doctorId, time: time));
        }
      }
    }catch(_){}
    return Future.value(currentAppointments);
  }
}
