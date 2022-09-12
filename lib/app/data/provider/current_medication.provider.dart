import 'dart:convert';
import 'dart:developer';

import 'package:wha/app/data/api.dart';
import 'package:wha/app/data/model/current_medication.dart';
import 'package:http/http.dart' as http;

class CurrentMedicationProvider {
  final Uri _currentMedicationURI = Uri.parse(Api.currentMedication);

  Future<List<CurrentMedication>> getCurrentMedication(
      {required String accessToken}) async {
    List<CurrentMedication> currentMedications = [];
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
      _response = await http.get(_currentMedicationURI, headers: _headers);
      log('current medication response: ${_response.statusCode}');
      if (_response.statusCode == 200) {
        Iterable jsonData = jsonDecode(_response.body);
        for (Map<String, dynamic> data in jsonData) {
          int id = data['id'];
          int prescriptionId = data['prescription_id'];
          int medicineId = data['medicine_id'];
          int duration = 0;
          String durationUnit = '';
          int takingTime = 0;
          bool isBreakfast = false;
          bool isLunch = false;
          bool isDinner = false;

          currentMedications.add(CurrentMedication(
              id: id,
              prescriptionId: prescriptionId,
              medicineId: medicineId,
              duration: duration,
              durationUnit: durationUnit,
              takingTime: takingTime,
              isBreakfast: isBreakfast,
              isLunch: isLunch,
              isDinner: isDinner));
        }
      }
    } catch (_) {}
    return Future.value(currentMedications);
  }
}
