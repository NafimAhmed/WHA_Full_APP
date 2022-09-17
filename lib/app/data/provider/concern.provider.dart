import 'dart:convert';
import 'dart:developer';

import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/api.dart';
import 'package:wha/app/data/model/concern.dart';
import 'package:get/get.dart';
import 'package:http/http.dart' as http;

class ConcernProvider {
  final Uri _concernListURI = Uri.parse(Api.allConcern);
  final AppState appState = Get.find<AppState>();
  final Map<String, String> _headers = <String, String>{
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": "true",
    "Access-Control-Allow-Headers":
    "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS",
    "Content-Type": "application/json"
  };

  Future<List<Concern>> getAllConcern() async {
    List<Concern> concerns = [];
    http.Response _response;
    try {
      _response = await http.get(_concernListURI, headers: _headers);
      log('all concern response: ${_response.statusCode}');
      if(_response.statusCode == 200){
        Map<String, dynamic> data = jsonDecode(_response.body);
        Iterable iterable = data['specialists'];
        for(Map<String, dynamic> info in iterable){
          int id = info['id'] ?? 0;
          String concern = info['name'] ?? '';
          String icon = info['image'] !=null ? '${info['image']}': '';

          concerns.add(Concern(id: id, concern: concern, icon: icon));
        }
      }
    } catch (_) {
      log(_.toString());
    }
    appState.concerns = concerns;
    return Future.value(concerns);
  }
}
