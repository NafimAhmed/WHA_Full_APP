import 'dart:convert';
import 'dart:developer';

import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/api.dart';
import 'package:wha/app/data/model/appointment_slot.dart';
import 'package:wha/app/data/model/appointment_time.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppointmentTimeSlotProvider {
  final Map<String, String> _headers = <String, String>{
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": "true",
    "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS",
    "Content-Type": "application/json",
    "Authorization": "Bearer " + Get.find<AppState>().accessToken
  };

  Future<List<AppointmentTime>> getTimeSlot({required int doctorId}) async {
    final Uri _uri = Uri.parse('${Api.doctorAppointmentSlotList}/$doctorId');
    List<AppointmentTime> appointmentTimes = [];
    http.Response _response;
    try {
      _response = await http.get(_uri, headers: _headers);
      log('doctor($doctorId) time slot response: ${_response.statusCode}');
      if (_response.statusCode == 200) {
        Iterable iterable = jsonDecode(_response.body);
        for (Map<String, dynamic> data in iterable) {
          int id = data['id'] ?? 0;
          String strDate = data['date'] ?? '';
          String strStartTime = data['start_time'] ?? '';
          String strEndTime = data['end_time'] ?? '';
          int slotTimeInMinute = data['slot_time'] ?? 0;

          DateTime date = DateTime.now();
          DateTime startTime = DateTime.now();
          DateTime endTime = DateTime.now();

          if (strDate != '') date = DateFormat('yyyy-MM-dd').parse(strDate);
          if (strStartTime != '') startTime = DateFormat('hh:mm').parse(strStartTime);
          if (strEndTime != '') endTime = DateFormat('hh:mm').parse(strEndTime);

          AppointmentTime appointmentTime = AppointmentTime(
              id: id,
              date: date,
              startTime: startTime,
              endTime: endTime,
              slotTimeInMinute: slotTimeInMinute);
          List<AppointmentSlot> appointmentSlots = [];

          Iterable iterable2 = data['slots'] ?? [];
          for (Map<String, dynamic> data2 in iterable2) {
            int id2 = data2['id'] ?? 0;
            String strStartTime2 = data2['start_time'] ?? '';
            String strEndTime2 = data2['end_time'] ?? '';

            DateTime startTime2 = DateTime.now();
            DateTime endTime2 = DateTime.now();

            if (strStartTime2 != '') startTime2 = DateFormat('hh:mm').parse(strStartTime2);
            if (strEndTime2 != '') endTime2 = DateFormat('hh:mm').parse(strEndTime2);

            AppointmentSlot appointmentSlot = AppointmentSlot(
                id: id2, startTime: startTime2, endTime: endTime2);
            appointmentSlots.add(appointmentSlot);
          }

          appointmentTime.slots = appointmentSlots;
          if(appointmentTime.slots.isNotEmpty) appointmentTimes.add(appointmentTime);
        }
      }
    } catch (_) {
      log('doctor($doctorId)time slot error: '+_.toString());
    }
    return Future.value(appointmentTimes);
  }
}
