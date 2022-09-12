import 'dart:developer';
import 'package:http/http.dart' as http;
import 'package:wha/app/data/api.dart';

class SmsService{
  final String _smsID = 'tribd';
  final String _smsPassword = '8E3FNGQK';
  final Uri _uri = Uri.parse(Api.smsAPI);
  final Map<String, String> _headers = <String, String>{
    "Access-Control-Allow-Origin": "*",
    "Access-Control-Allow-Credentials": "true",
    "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
    "Access-Control-Allow-Methods": "GET, POST",
  };

  Future<int> sendSms({required String number, required String message})async{
    final Map<String, String> _body = {
      'username': _smsID,
      'password': _smsPassword,
      'number': number,
      'message': message
    };
    http.Response _response;
    try{
      _response = await http.post(_uri, headers: _headers, body: _body);
      log('sms response: ${_response.statusCode}: ${_response.body}');
      if(_response.statusCode == 200){
        return int.parse(_response.body.substring(0, 4));
      }
    }catch(_){}
    return -1;
  }
}