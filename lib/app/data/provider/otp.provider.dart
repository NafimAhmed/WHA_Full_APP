import 'dart:convert';
import 'dart:developer';

import 'package:wha/app/utils/strings.dart';
import 'package:http/http.dart' as http;
import 'package:wha/app/data/api.dart';

class OtpProvider{
  final String _otpID = 'tribd';
  final String _otpPassword = '8E3FNGQK';
  final Uri _otpURI = Uri.parse(Api.otpAPI);

  Future<int> sendOtp({required String number, required int otp})async{
    final Map<String, String> _headers = <String, String>{
      "Access-Control-Allow-Origin": "*",
      "Access-Control-Allow-Credentials": "true",
      "Access-Control-Allow-Headers": "Origin,Content-Type,X-Amz-Date,Authorization,X-Api-Key,X-Amz-Security-Token,locale",
      "Access-Control-Allow-Methods": "GET, POST",
    };
    final Map<String, String> message = {
    'username': _otpID,
    'password': _otpPassword,
    'number': number,
    'message': '<#> your Wha verification code is $otp\n\n$whaHashKey'
    };
    http.Response _response;
    try{
      _response = await http.post(_otpURI, headers: _headers, body: message);
      log('otp response: ${_response.statusCode}: ${_response.body}');
      if(_response.statusCode == 200){
        return int.parse(_response.body.substring(0, 4));
      }
    }catch(_){}
    return -1;
  }
}
