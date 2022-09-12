import 'dart:convert';
import 'dart:developer';

import 'package:wha/app/data/api.dart';
import 'package:wha/app/data/model/doctor.dart';
import 'package:http/http.dart' as http;

class VisitedDoctorsProvider{
  final Uri _visitedDoctorURI = Uri.parse(Api.visitedDoctor);


  Future<List<Doctor>> getVisitedDoctors({required String accessToken})async{
    List<Doctor> visitedDoctors = [];
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
      _response = await http.get(_visitedDoctorURI, headers: _headers);
      log('visited doctors response ${_response.statusCode}');
      if(_response.statusCode == 200){
        Iterable iterable = jsonDecode(_response.body);
        for(Map<String, dynamic> data in iterable){
          int id = 1;
          int organizationId = 2;
          int roleId = 1;
          String firstName = 'Rafiqul';
          String lastName = 'Islam';
          String phone = '2342353451324';
          String email = 'rafiq@timerni.com';
          String address = 'Bangsal, Dhaka';
          String profession = 'Neurologist';
          String country = 'Bngladesh';
          String city = 'Dhaka';
          String district = 'Dhaka';
          String postcode = '2342234';
          String gender = 'male';
          String image = '';
          visitedDoctors.add(Doctor(id: id, organizationId: organizationId, roleId: roleId, firstName: firstName, lastName: lastName, phone: phone, email: email, address: address, profession: profession, country: country, city: city, district: district, postcode: postcode, gender: gender, image: image));
        }
      }
    }catch(_){}
    return Future.value(visitedDoctors);
  }
}