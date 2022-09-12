import 'dart:convert';
import 'dart:developer';

import 'package:wha/app/data/api.dart';
import 'package:wha/app/data/model/current_visit_history.dart';
import 'package:http/http.dart' as http;

class CurrentVisitHistoryProvider{
  final Uri _currentVisitHistoryURI = Uri.parse(Api.baseAPI);

  Future<List<CurrentVisitHistory>> getCurrentVisitHistory({required String accessToken})async{
    List<CurrentVisitHistory> visitHistory = [];
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
      _response = await http.get(_currentVisitHistoryURI, headers: _headers);
      log('current visit history response: ${_response.statusCode}');
      if(_response.statusCode == 200){
        Iterable iterable = jsonDecode(_response.body);
        for(Map<String, dynamic> data in iterable){
          int id = 2;
          String name = 'visit history';
          visitHistory.add(CurrentVisitHistory(id: id, name: name));
        }
      }
    }catch(_){}
    return Future.value(visitHistory);
  }
}