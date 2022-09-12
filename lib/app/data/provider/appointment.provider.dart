import 'dart:convert';
import 'dart:developer';

import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/api.dart';
import 'package:wha/app/data/model/accepted_with_time_appointment.dart';
import 'package:wha/app/data/model/accepted_without_time_appointment.dart';
import 'package:wha/app/data/model/appointment.dart';
import 'package:wha/app/data/model/calling_appointment.dart';
import 'package:wha/app/data/model/cancelled_appointment.dart';
import 'package:wha/app/data/model/completed_appointment.dart';
import 'package:wha/app/data/model/doctor_for_appointment.dart';
import 'package:wha/app/data/model/patient_for_appointment.dart';
import 'package:wha/app/data/model/pending_appointment.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class AppointmentProvider {
  final Uri _liveUri = Uri.parse(Api.liveAppointments);
  final Uri _deadUri = Uri.parse(Api.deadAppointments);
  final Uri _callingAppointmentUri = Uri.parse(Api.callingAppointment);
  final Map<String, String> _headers = <String, String>{
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": "true",
    "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS",
    "Content-Type": "application/json",
    "Authorization": "Bearer " + Get.find<AppState>().accessToken
  };

  Future<List<Appointment>> getLiveAppointments() async {
    List<Appointment> liveAppointments = [];
    http.Response _response;
    try {
      _response = await http.get(_liveUri, headers: _headers);
      log('live appointments response: ${_response.statusCode}');
      Iterable _iterable = jsonDecode(_response.body);

      for (Map<String, dynamic> data in _iterable) {
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

        if (status == 0) {
          // pending appointment
          PendingAppointment pendingAppointment = PendingAppointment(
              id: id,
              patientId: patientId,
              pharmacyId: pharmacyId,
              doctorId: doctorId,
              specialistId: specialistId,
              slotId: slotId,
              requestedBy: requestedBy,
              requestTime: requestTime,
              doctorForAppointment: doctorForAppointment,
              patientForAppointment: patientForAppointment);
          liveAppointments.add(pendingAppointment);
        } else if (status == 1) {
          String strAppointmentDate = data['appointment_date'] ?? '';
          String strAppointmentTime = data['appointment_time'] ?? '';

          if (strAppointmentDate == '' || strAppointmentTime == '') {
            // accepted appointment without date and time
            AcceptedWithoutTimeAppointment acceptedWithoutTimeAppointment =
                AcceptedWithoutTimeAppointment(
                    id: id,
                    patientId: patientId,
                    pharmacyId: pharmacyId,
                    doctorId: doctorId,
                    specialistId: specialistId,
                    slotId: slotId,
                    requestedBy: requestedBy,
                    requestTime: requestTime,
                    doctorForAppointment: doctorForAppointment,
                    patientForAppointment: patientForAppointment);
            liveAppointments.add(acceptedWithoutTimeAppointment);
          } else if (strAppointmentDate != '' && strAppointmentTime != '') {
            // accepted appointment with data and time
            DateTime appointmentDate = DateTime.now();
            DateTime appointmentTime = DateTime.now();
            try {
              appointmentDate =
                  DateFormat('yyyy-MM-dd').parse(strAppointmentDate);
              appointmentTime = DateFormat('hh:mm').parse(strAppointmentTime);
            } catch (_) {}

            AcceptedWithTimeAppointment acceptedWithTimeAppointment =
                AcceptedWithTimeAppointment(
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
                    doctorForAppointment: doctorForAppointment,
                    patientForAppointment: patientForAppointment);
            liveAppointments.add(acceptedWithTimeAppointment);
          }
        } else if (status == 2) {
          // // calling appointment
          String strAppointmentDateA = data['appointment_date'] ?? '';
          String strAppointmentTimeA = data['appointment_time'] ?? '';
          String strMeetLinkTime = data['meet_link_time'] ?? '';
          String meetLink = data['meet_link'] ?? '';

          DateTime appointmentDateA = DateTime.now();
          DateTime appointmentTimeA = DateTime.now();
          DateTime meetLinkTime = DateTime.now();
          try {
            if (strAppointmentDateA != '') {
              appointmentDateA =
                  DateFormat('yyyy-MM-dd').parse(strAppointmentDateA);
            }
            if (strAppointmentTimeA != '') {
              appointmentTimeA = DateFormat('hh:mm').parse(strAppointmentTimeA);
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
              appointmentDate: appointmentDateA,
              appointmentTime: appointmentTimeA,
              meetLink: meetLink,
              meetLinkTime: meetLinkTime,
              doctorForAppointment: doctorForAppointment,
              patientForAppointment: patientForAppointment);
          liveAppointments.add(callingAppointment);
        }
      }
    } catch (_) {
      log('live appointments error: ${_.toString()}');
    }
    return Future.value(liveAppointments);
  }

  Future<List<Appointment>> getDeadAppointments() async {
    List<Appointment> deadAppointments = [];
    http.Response _response;
    try {
      _response = await http.get(_deadUri, headers: _headers);
      log('dead appointments response: ${_response.statusCode}');
      Iterable _iterable = jsonDecode(_response.body);

      for (Map<String, dynamic> data in _iterable) {
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

        if (status == 3) {
          String strAppointmentDate = data['appointment_date'] ?? '';
          String strAppointmentTime = data['appointment_time'] ?? '';
          String strMeetLinkTime = data['meet_link_time'] ?? '';
          String meetLink = data['meet_link'] ?? '';

          DateTime appointmentDate = DateTime.now();
          DateTime appointmentTime = DateTime.now();
          DateTime meetLinkTime = DateTime.now();
          try {
            if (strAppointmentDate != '') {
              appointmentDate =
                  DateFormat('yyyy-MM-dd').parse(strAppointmentDate);
            }
            if (strAppointmentTime != '') {
              appointmentTime = DateFormat('hh:mm').parse(strAppointmentTime);
            }
            if (strMeetLinkTime != '') {
              meetLinkTime = DateFormat('hh:mm:ss').parse(strMeetLinkTime);
            }
          } catch (_) {}
          CompletedAppointment completedAppointment = CompletedAppointment(
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
          deadAppointments.add(completedAppointment);
        } else if (status == 4) {
          CancelledAppointment cancelledAppointment = CancelledAppointment(
              id: id,
              patientId: patientId,
              pharmacyId: pharmacyId,
              doctorId: doctorId,
              specialistId: specialistId,
              slotId: slotId,
              requestedBy: requestedBy,
              requestTime: requestTime,
              doctorForAppointment: doctorForAppointment,
              patientForAppointment: patientForAppointment);
          deadAppointments.add(cancelledAppointment);
        }
      }
    } catch (_) {
      log('dead appointments error: ${_.toString()}');
    }
    return Future.value(deadAppointments);
  }

  Future<CallingAppointment?> getCallingAppointment() async {
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
}
