import 'dart:convert';
import 'dart:developer';

import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:get/get.dart';
import 'package:wha/app/data/api.dart';
import 'package:http/http.dart' as http;

class VitalSignQuestionProvider {
  final Uri _uri = Uri.parse(Api.vitalSignQuestions);
  final AppState appState = Get.find<AppState>();
  final Map<String, String> _headers = <String, String>{
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": "true",
    "Access-Control-Allow-Headers":
        "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS",
    "Content-Type": "application/json",
    "Authorization": "Bearer " + Get.find<AppState>().accessToken
  };

  Future<List<VitalSignQuestion>> getVitalSignQuestions() async {
    List<VitalSignQuestion> questions = [];
    http.Response _response;
    try {
      _response = await http.get(_uri, headers: _headers);
      log('vital sign questions response: ${_response.statusCode}');
      Iterable iterable = jsonDecode(_response.body) ?? [];
      for (Map<String, dynamic> data in iterable) {
        questions.add(decodeQuestionData(data));
      }
    } catch (_) {
      log(_.toString());
    }
    return Future.value(questions);
  }

  Future<bool> updateVitalSignQuestions() async {
    bool isSucceed = false;
    List<VitalSignQuestion> questions = [];
    http.Response _response;
    try {
      _response = await http.get(_uri, headers: _headers);
      log('vital sign questions response: ${_response.statusCode}');
      Iterable iterable = jsonDecode(_response.body) ?? [];
      for (Map<String, dynamic> data in iterable) {
        questions.add(decodeQuestionData(data));
      }
      appState.vitalSignQuestions = questions;
      isSucceed = true;
    } catch (_) {
      log(_.toString());
    }
    return Future.value(isSucceed);
  }

  VitalSignQuestion decodeQuestionData(Map<String, dynamic> data) {
    int id = data['id'] ?? 0;
    String question = data['name'] ?? '';
    int _pr = data['parameter'] ?? 1;
    String firstPlaceholder = data['value_place1'] ?? '';
    String secondPlaceholder = data['value_place2'] ?? '';
    VitalSignQuestion vitalSignQuestion = VitalSignQuestion(
        id: id,
        question: question,
        parameter:
            _pr == 2 ? Parameter.DOUBLE_PARAMETER : Parameter.SINGLE_PARAMETER,
        firstPlaceholder: firstPlaceholder,
        secondPlaceholder: secondPlaceholder);
    return vitalSignQuestion;
  }
}
