import 'dart:convert';
import 'dart:developer';

import 'package:wha/app/data/model/doctor_for_appointment.dart';
import 'package:wha/app/data/model/patient_for_appointment.dart';
import 'package:http/http.dart' as http;
import 'package:wha/app/data/api.dart';
import 'package:wha/app/data/model/calling_appointment.dart';
import 'package:intl/intl.dart';

class CallingAppointmentService{
  final Uri _updateUri = Uri.parse(Api.updateAppointmentObject);
  final Uri _callingAppointmentUri = Uri.parse(Api.callingAppointment);

  Future<CallingAppointment?> getCallingAppointment({required String accessToken}) async {
    final Map<String, String> _headers = <String, String>{
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      "Access-Control-Allow-Headers":
      "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS",
      "Content-Type": "application/json",
      "Authorization": "Bearer " + accessToken
    };
    http.Response _response;
    try {
      _response = await http.get(_callingAppointmentUri, headers: _headers);
      log('calling appointment response: ${_response.statusCode}');
      if (_response.statusCode == 200) {
        Iterable iterable = jsonDecode(_response.body);
        log('calling appointment length: ${iterable.length}');
        if (iterable.isNotEmpty) {
          Map<String, dynamic> data = iterable.first;
          int id = data['id'] ?? 0;
          int patientId = data['patient_id'] ?? 0;
          int pharmacyId = data['pharmacy_id'] ?? 0;
          int doctorId = data['doctor_id'] ?? 0;
          int specialistId = data['specialist_id'] ?? 0;
          int slotId = data['slot_id'] ?? 0;
          int requestedBy = data['request_by'] ?? 0;
          int status = data['status'] ?? 0;
          DateTime requestTime = DateTime.now();
          try {
            requestTime =
                DateFormat('yyyy-MM-dd hh:mm:ss').parse(data['created_at']);
          } catch (_) {}
          Map<String, dynamic> patientData = data['patient_name'] ?? {};
          Map<String, dynamic> doctorData = data['doctor_name'] ?? {};
          int doctorDataId = doctorData['id'] ?? 0;
          String doctorFirstName = doctorData['first_name'] ?? '';
          String doctorLastName = doctorData['last_name'] ?? '';
          String doctorImage = doctorData['image'] ?? '';
          DoctorForAppointment doctorForAppointment = DoctorForAppointment(
              id: doctorDataId,
              firstName: doctorFirstName,
              lastName: doctorLastName,
              hospitalName: '',
              image: doctorImage,
              degrees: '',
              fee: 0,
              vat: 0);

          int patientDataId = patientData['id'] ?? 0;
          String patientFirstName = patientData['first_name'] ?? '';
          String patientLastName = patientData['last_name'] ?? '';
          String patientImage = patientData['image'] ?? '';

          PatientForAppointment patientForAppointment = PatientForAppointment(
              id: patientDataId,
              firstName: patientFirstName,
              lastName: patientLastName,
              image: patientImage);
          String strAppointmentDateA = data['appointment_date'] ?? '';
          String strAppointmentTimeA = data['appointment_time'] ?? '';
          String strMeetLinkTime = data['meet_link_time'] ?? '';
          String meetLink = data['meet_link'] ?? '';

          DateTime appointmentDate = DateTime.now();
          DateTime appointmentTime = DateTime.now();
          DateTime meetLinkTime = DateTime.now();
          try {
            if (strAppointmentDateA != '') {
              appointmentDate =
                  DateFormat('yyyy-MM-dd').parse(strAppointmentDateA);
            }
            if (strAppointmentTimeA != '') {
              appointmentTime = DateFormat('hh:mm').parse(strAppointmentTimeA);
            }
            if (strMeetLinkTime != '') {
              meetLinkTime = DateFormat('hh:mm:ss').parse(strMeetLinkTime);
            }
          } catch (_) {}

          CallingAppointment callingAppointment = CallingAppointment(
              id: id,
              patientId: patientId,
              pharmacyId: pharmacyId,
              doctorId: doctorId,
              specialistId: specialistId,
              slotId: slotId,
              requestedBy: requestedBy,
              requestTime: requestTime,
              appointmentDate: appointmentDate,
              appointmentTime: appointmentTime,
              meetLink: meetLink,
              meetLinkTime: meetLinkTime,
              doctorForAppointment: doctorForAppointment,
              patientForAppointment: patientForAppointment);
          return Future.value(callingAppointment);
        }
      }
    } catch (_) {
      log(_.toString());
    }
    return Future.value(null);
  }
  Future<bool> endCall({required String accessToken, required int appointmentId})async{
    final Map<String, String> _headers = <String, String>{
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      "Access-Control-Allow-Headers":
      "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS",
      "Content-Type": "application/json",
      "Authorization": "Bearer " + accessToken
    };
    final Map<String, dynamic> _body = <String, dynamic>{
      'id': appointmentId,
      'status': 4
    };
    http.Response _response;
    try {
      _response = await http.post(_updateUri,
          headers: _headers, body: jsonEncode(_body));
      log('request body: ${_body.toString()}');
      log('cancel appointment response: ${_response.statusCode}');
      log('cancel appointment response body: ${_response.body}');
      return Future.value(_response.statusCode == 200);
    } catch (_) {
      log(_.toString());
    }
    return Future.value(false);
  }
  Future<bool> completeCall({required String accessToken, required int appointmentId})async{
    final Map<String, String> _headers = <String, String>{
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      "Access-Control-Allow-Headers":
      "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS",
      "Content-Type": "application/json",
      "Authorization": "Bearer " + accessToken
    };
    final Map<String, dynamic> _body = <String, dynamic>{
      'id': appointmentId,
      'status': 3
    };
    http.Response _response;
    try {
      _response = await http.post(_updateUri,
          headers: _headers, body: jsonEncode(_body));
      log('request body: ${_body.toString()}');
      log('complete appointment response: ${_response.statusCode}');
      log('complete appointment response body: ${_response.body}');
      return Future.value(_response.statusCode == 200);
    } catch (_) {
      log(_.toString());
    }
    return Future.value(false);
  }
}