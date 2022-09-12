import 'dart:convert';
import 'dart:developer';

import 'package:wha/app/data/api.dart';
import 'package:wha/app/data/model/pharmacy.dart';
import 'package:http/http.dart' as http;

class PharmacyProvider {
  final Uri _allPharmacyURI = Uri.parse(Api.allPharmacy);

  Future<List<Pharmacy>> getAllPharmacy({required String accessToken}) async {
    List<Pharmacy> pharmacies = [];
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
      _response = await http.get(_allPharmacyURI, headers: _headers);
      log('all pharmacy response: ${_response.statusCode}');
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
          if(image == null){
            image = 'https://thumbs.dreamstime.com/b/doctor-smile-208399616.jpg';
          }else{
            image = '${Api.baseAPI}/$image';
          }
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
          pharmacies.add(pharmacy);
        }
      }
    } catch (_) {}
    return Future.value(pharmacies);
  }
}
