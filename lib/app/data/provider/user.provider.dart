import 'dart:convert';
import 'dart:developer';

import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/api.dart';
import 'package:wha/app/data/model/doctor.dart';
import 'package:wha/app/data/model/organization.dart';
import 'package:wha/app/data/model/patient.dart';
import 'package:wha/app/data/model/pharmacy.dart';
import 'package:wha/app/data/model/user.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class UserProvider {
  Uri userProfileDataURI = Uri.parse(Api.profileDataAPI);
  final AppState appState = Get.find<AppState>();

  Future<User?> getUser({required String accessToken}) async {
    final Map<String, String> _headers = <String, String>{
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      "Access-Control-Allow-Headers":
          "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "POST, OPTIONS",
      "Authorization": "Bearer " + accessToken
    };
    http.Response _response;
    try {
      _response = await http.post(userProfileDataURI, headers: _headers);
      log('profile data response: ' + _response.statusCode.toString());
      if (_response.statusCode == 200) {
        Map<String, dynamic> _data = jsonDecode(_response.body);
        int id = _data['id'] ?? 0;
        int organizationId = _data['organization_id'] ?? 0;
        int roleId = _data['role_id'] ?? 0;
        int uniqueId = _data['unique_id'] ?? 0;
        String firstName = _data['first_name'] ?? '';
        String lastName = _data['last_name'] ?? '';
        String phone = _data['phone'] ?? '';
        String email = _data['email'] ?? '';
        String address = _data['address'] ?? '';
        String profession = _data['profession'] ?? '';
        String country = _data['country'] ?? '';
        String city = _data['city'] ?? '';
        String district = _data['district'] ?? '';
        String postcode = _data['postcode'] ?? '';
        String gender = _data['gender'] ?? '0';
        String image = (_data['image'] == null || _data['image'] == '')
            ? Api.baseAPI
            : '${Api.baseAPI}/${_data['image']}';
        if (roleId == 1) {
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
          return Future.value(doctor);
        } else if (roleId == 2) {
          Organization organization = Organization(
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
          return Future.value(organization);
        } else if (roleId == 3) {
          Patient patient = Patient(
              id: id,
              organizationId: organizationId,
              uniqueId: uniqueId,
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
          return Future.value(patient);
        } else if (roleId == 4) {
          Pharmacy pharmacy = Pharmacy(
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
          return Future.value(pharmacy);
        } else {
          Patient patient = Patient(
              id: id,
              organizationId: organizationId,
              uniqueId: uniqueId,
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
          return Future.value(patient);
        }
      }
    } catch (e) {
      return null;
    }
  }
}
