import 'dart:convert';
import 'dart:developer';

import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/api.dart';
import 'package:wha/app/data/model/hotline.dart';
import 'package:http/http.dart' as http;
import 'package:get/get.dart';

class HotlineService{
  final Uri _uri = Uri.parse(Api.hotlines);
  final AppState appState = Get.find<AppState>();
  final Map<String, String> _headers = <String, String>{
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": "true",
    "Access-Control-Allow-Headers":
    "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "POST, OPTIONS",
    "Content-Type": "application/json"
  };

  Future<bool> updateHotlines()async{
    List<Hotline> hotlines = [];
    bool isSucceed = false;
    http.Response _response;
    try{
      _response = await http.get(_uri, headers: _headers);
      log('hotline response: ${_response.statusCode}');
      Iterable iterable = jsonDecode(_response.body);
      for(Map<String, dynamic> data in iterable){
        int id = data['id'] ?? 0;
        int organizationId = data['organization_id'] ?? 0;
        String phoneNumber = data['phone'] ?? '';
        hotlines.add(Hotline(id: id,
            organizationId: organizationId,
            phoneNumber: phoneNumber));
      }
      appState.hotlines = hotlines;
      isSucceed = true;
    }catch(_){}
    return Future.value(isSucceed);
  }
}