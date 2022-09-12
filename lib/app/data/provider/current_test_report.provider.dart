import 'dart:convert';
import 'dart:developer';

import 'package:wha/app/data/api.dart';
import 'package:wha/app/data/model/current_test_report.dart';
import 'package:http/http.dart' as http;

class CurrentTestReportProvider{
  final Uri _currentReportURI = Uri.parse(Api.baseAPI);


  Future<List<CurrentTestReport>> getCurrentReports({required String accessToken})async{
    List<CurrentTestReport> currentReports = [];
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
      _response = await http.get(_currentReportURI, headers: _headers);
      log('current reports response: ${_response.statusCode}');
      if(_response.statusCode == 200){
        Iterable iterable = jsonDecode(_response.body);
        for(Map<String, dynamic> data in iterable){
          int id = 1;
          String name = 'report name';
          currentReports.add(CurrentTestReport(id: id, name: name));
        }
      }
    }catch(_){}
    return Future.value(currentReports);
  }
}