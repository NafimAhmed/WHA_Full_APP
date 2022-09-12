import 'dart:convert';
import 'dart:developer';

import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:intl/intl.dart';

class AppointmentService {
  final Uri _uri = Uri.parse(Api.submitAppointment);
  final Uri _updateUri = Uri.parse(Api.updateAppointmentObject);
  final Map<String, String> _headers = <String, String>{
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": "true",
    "Access-Control-Allow-Headers":
    "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS",
    "Content-Type": "application/json",
    "Authorization": "Bearer " + Get
        .find<AppState>()
        .accessToken
  };

  Future<bool> submitAppointment({
    required int concernId,
    required int doctorId,
    required int patientId,
    required int pharmacyId,
    required int slotId,
  }) async {
    bool isSucceed = false;
    Map<String, dynamic> _body = <String, dynamic>{
      'patient_id': patientId,
      'doctor_id': doctorId == 0 ? null : doctorId,
      'specialist_id': concernId == 0 ? null : concernId,
      'pharmacy_id': pharmacyId == 0 ? null : pharmacyId,
      'slot_id': slotId == 0 ? null : slotId
    };
    http.Response _response;
    try {
      _response =
      await http.post(_uri, headers: _headers, body: jsonEncode(_body));
      log('appointment submit response: ${_response.statusCode}');
      log('appointment body: ${_body.toString()}');
      log('appointment feedback: ${_response.body.toString()}');
      if (_response.statusCode == 200) isSucceed = true;
    } catch (_) {}
    return Future.value(isSucceed);
  }

  Future<bool> cancelAppointment({required int appointmentId}) async {
    final Map<String, dynamic> _body = <String, dynamic>{
      'id': appointmentId,
      'status': 4
    };
    http.Response _response;
    try {
      _response = await http.post(_updateUri,
          headers: _headers, body: jsonEncode(_body));
      log('cancel appointment response: ${_response.statusCode}');
      log('cancel appointment response body: ${_response.body}');
      return Future.value(_response.statusCode == 200);
    } catch (_) {
      log(_.toString());
    }
    return Future.value(false);
  }

  Future<bool> deleteAppointment({required int appointmentId}) async {
    final Map<String, dynamic> _body = <String, dynamic>{'id': appointmentId};
    http.Response _response;
    try {
      _response = await http.post(_updateUri,
          headers: _headers, body: jsonEncode(_body));
      log('delete appointment response: ${_response.statusCode}');
      // final Map<String, dynamic> _data = jsonDecode(_response.body) ?? {};
      // final int status = _data['status'] ?? 0;
      // return Future.value(status == 4);
    } catch (_) {
      log(_.toString());
    }
    return Future.value(false);
  }

  Future<bool> approveAppointment({required int appointmentId, required int doctorId})async {
    String appointment_date = DateFormat('yyyy:MM:dd').format(DateTime.now());
    String appointment_time = DateFormat('hh:mm').format(DateTime.now());

    Map<String, dynamic> _body = <String, dynamic>{
      'id': appointmentId,
      'doctor_id': doctorId,
      'appointment_date': appointment_date,
      'appointment_time': appointment_time,
      'status': 1,
    };

    http.Response _response;
    try {
      _response = await http.post(_updateUri, headers: _headers, body: jsonEncode(_body));
      log('approve appointment status: ${_response.statusCode}');
      log('approve appointment response: ${_response.body}');
      return Future.value(_response.statusCode == 200);
    } catch (_) {
      log(_.toString());
    }
    return Future.value(false);
  }

  Future<bool> callAppointment({required int appointmentId, required int doctorId})async{
    Map<String, dynamic> _body = <String, dynamic>{
      'id': appointmentId,
      'doctor_id': doctorId,
      'status': 2
    };
    http.Response _response;
    try {
      _response =
      await http.post(_updateUri, headers: _headers, body: jsonEncode(_body));
      log('calling appointment status: ${_response.statusCode}');
      log('calling appointment response body: ${_response.body}');
      return Future.value(_response.statusCode == 200);
    }catch(_){log(_.toString());}
    return Future.value(false);
  }
}
