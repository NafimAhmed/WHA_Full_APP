import 'dart:convert';
import 'dart:developer';

import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/api.dart';
import 'package:wha/app/data/model/doctor.dart';
import 'package:wha/app/data/model/doctor_for_appointment.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class DoctorProvider {
  final Uri _allDoctorsURI = Uri.parse(Api.allDoctor);
  final Map<String, String> _headers = <String, String>{
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": "true",
    "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS",
    "Authorization": "Bearer " + Get.find<AppState>().accessToken
  };

  Future<List<Doctor>> getAllDoctor() async {
    List<Doctor> doctors = [];
    http.Response _response;
    try {
      _response = await http.get(_allDoctorsURI, headers: _headers);
      log('all doctors response: ${_response.statusCode}');
      if (_response.statusCode == 200) {
        Iterable iterable = jsonDecode(_response.body);
        for (Map<String, dynamic> data in iterable) {
          int id = data['id'] ?? 0;
          int organizationId = data['organization_id'] ?? 0;
          int roleId = data['role_id'] ?? 0;
          String firstName = data['first_name'] ?? '';
          String lastName = data['last_name'] ?? '';
          String phone = data['phone'] ?? '';
          String email = data['email'] ?? '';
          String address = data['address'] ?? '';
          String profession = data['profession'] ?? '';
          String country = data['country'] ?? '';
          String city = data['city'] ?? '';
          String district = data['district'] ?? '';
          String postcode = data['postcode'] ?? '';
          String gender = data['gender'] ?? '';
          String? image = data['image'];
          if (image == null) {
            image =
                'https://thumbs.dreamstime.com/b/doctor-smile-208399616.jpg';
          } else {
            image = '${Api.baseAPI}/$image';
          }
          Doctor doctor = Doctor(
              id: id,
              organizationId: organizationId,
              roleId: roleId,
              firstName: firstName,
              lastName: lastName,
              phone: phone,
              email: email,
              address: address,
              profession: profession,
              country: country,
              city: city,
              district: district,
              postcode: postcode,
              gender: gender,
              image: image);
          doctors.add(doctor);
        }
      }
    } catch (_) {}
    return Future.value(doctors);
  }

  Future<List<DoctorForAppointment>> getDoctorByConcernId(
      {required int id}) async {
    List<DoctorForAppointment> doctors = [];
    final Uri _doctorByConcernIdURI =
        Uri.parse('${Api.doctorsBySpecialistId}/$id');
    http.Response _response;
    try {
      _response = await http.get(_doctorByConcernIdURI, headers: _headers);
      log('doctors by concern id response: ${_response.statusCode}');
      if (_response.statusCode == 200) {
        Map<String, dynamic> map = jsonDecode(_response.body);
        Iterable iterable = map['data'] ?? [];
        for (Map<String, dynamic> data in iterable) {
          int id = data['id'] ?? 0;
          String firstName = data['first_name'] ?? '';
          String lastName = data['last_name'] ?? '';
          String hospitalName = data['hospital_name'] ?? 'Wha Telemedicine';
          String degrees = data['degrees'] ?? 'Medicine Expert';
          String image = data['image'] ?? '';
          int fee = data['fee'] ?? 0;
          int vat = data['vat'] ?? 0;
          DoctorForAppointment doctor = DoctorForAppointment(
              id: id,
              firstName: firstName,
              lastName: lastName,
              hospitalName: hospitalName,
              degrees: degrees,
              image: image,
              fee: fee,
              vat: vat);
          doctors.add(doctor);
        }
      }
    } catch (_) {}
    return Future.value(doctors);
  }

  Future<DoctorForAppointment?> getDoctorById({required int doctorId}) async {
    Uri _uri = Uri.parse('${Api.getDoctorById}/$doctorId');
    http.Response _response;
    try {
      _response = await http.get(_uri, headers: _headers);
      log('doctor by id response: ${_response.statusCode}');

      Map<String, dynamic> d = jsonDecode(_response.body);
      Map<String, dynamic> data = d['data'] ?? {};

      int id = data['id'] ?? 0;
      String firstName = data['first_name'] ?? '';
      String lastName = data['last_name'] ?? '';
      String hospitalName = data['hospital_name'] ?? 'Wha Telemedicine';
      String degrees = data['degrees'] ?? 'Medicine Expert';
      String image = data['image'] ?? '';
      int fee = data['fee'] ?? 0;
      int vat = data['vat'] ?? 0;
      DoctorForAppointment doctor = DoctorForAppointment(
          id: id,
          firstName: firstName,
          lastName: lastName,
          hospitalName: hospitalName,
          image: image,
          degrees: degrees,
          fee: fee,
          vat: vat);
      return Future.value(doctor);
    } catch (_) {
      log(_.toString());
    }
  }
}
