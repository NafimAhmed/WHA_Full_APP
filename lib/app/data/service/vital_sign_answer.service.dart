import 'dart:convert';
import 'dart:developer';
import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/api.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;
import 'package:wha/app/data/model/model.dart';

class VitalSignAnswerService {
  final Uri _uri = Uri.parse(Api.submitVitalSignAnswer);
  final Map<String, String> _headers = <String, String>{
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": "true",
    "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS",
    "Content-Type": "application/json",
    "Authorization": "Bearer " + Get.find<AppState>().accessToken
  };

  Future<bool> submitVitalSignAnswers(
      {required List<VitalSignAnswer> answers}) async {
    bool isSucceed = false;
    answers = filterEmptyAnswers(answers);
    if (answers.isEmpty) {
      isSucceed = true;
      return Future.value(isSucceed);
    }
    Map<String, dynamic> _body = <String, dynamic>{
      'vital_answers': prepareBodyData(answers)
    };
    http.Response _response;
    try {
      log('submitting answer json body: ${jsonEncode(_body)}');
      _response =
          await http.post(_uri, headers: _headers, body: jsonEncode(_body));
      log('vital sign submit response: ${_response.statusCode}');
      return Future.value(_response.statusCode == 200);
    } catch (_) {
      log(_.toString());
    }
    return Future.value(isSucceed);
  }

  List<VitalSignAnswer> filterEmptyAnswers(List<VitalSignAnswer> answers) {
    return answers
        .where((element) =>
            element.firstAnswer != '' || element.secondAnswer != '')
        .toList();
  }

  List<Map<String, dynamic>> prepareBodyData(List<VitalSignAnswer> answers) {
    List<Map<String, dynamic>> data = [];
    for (VitalSignAnswer answer in answers) {
      data.add(<String, dynamic>{
        'patient_id': answer.patientId,
        'vital_id': answer.id,
        'value_one': answer.firstAnswer,
        'value_two': answer.secondAnswer,
        'comment': '',
      });
    }
    return data;
  }
}
