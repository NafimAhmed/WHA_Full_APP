import 'dart:convert';
import 'dart:developer';

import 'package:wha/app/data/api.dart';
import 'package:wha/app/data/model/current_prescription.dart';
import 'package:http/http.dart' as http;

class CurrentPrescriptionProvider {
  final Uri _currentPrescriptionURI = Uri.parse(Api.currentPrescription);

  Future<List<CurrentPrescription>> getCurrentPrescriptions(
      {required String accessToken}) async {
    List<CurrentPrescription> currentPrescriptions = [];
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
      _response = await http.get(_currentPrescriptionURI, headers: _headers);
      log('current prescriptions response ${_response.statusCode}');
      if (_response.statusCode == 200) {
        Iterable iterable = jsonDecode(_response.body);
        for (Map<String, dynamic> data in iterable) {
          int id = data['id'];
          String imageUrl = data['image_url'];
          String pdfUrl = data['pdf_url'];

          currentPrescriptions.add(CurrentPrescription(id: id, imageUrl: imageUrl, pdfUrl: pdfUrl));
        }
      }
    } catch (_) {}
    return Future.value(currentPrescriptions);
  }
}
