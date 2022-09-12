import 'dart:developer';

import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/data/provider/provider.dart';
import 'package:wha/app/data/service/service.dart';
import 'package:wha/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FSearchAPatientController extends GetxController {
  final doctorId = Get.arguments ?? 0;
  final concernId = int.parse(Get.parameters['concernId'] ?? '0');
  final slotId = int.parse(Get.parameters['slotId'] ?? '0');

  final String message = 'You appeared in a search result of our pharmacies.\n\nThank you.\nWha';

  final _phone = ''.obs;
  final _countryCode = '+880'.obs;
  final _opacity = 1.0.obs;
  final _error = ''.obs;
  final RxList<PatientWithNamePhone> _patients = <PatientWithNamePhone>[].obs;

  get phone => _phone.value;

  get countryCode => _countryCode.value;

  get opacity => _opacity.value;

  get error => _error.value;

  get patients => _patients.value;

  set phone(value) => _phone.value = value;

  set countryCode(value) => _countryCode.value = value;

  set opacity(value) => _opacity.value = value;

  set error(value) => _error.value = value;

  set patients(value) => _patients.value = value;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final SmsService smsService = Get.find<SmsService>();
  final PatientProvider patientProvider = Get.find<PatientProvider>();

  bool validate() => formKey.currentState!.validate();

  submit() async {
    if (validate()) {
      opacity = 0.6;
      int feedback = await smsService.sendSms(
          number: '$countryCode$phone', message: message);
      log(feedback.toString());
      if (feedback == 1101) {
        await Future.wait([updatePatientByPhoneWithCountryCode(), updatePatientByPhoneWithoutCountryCode()]);
        opacity = 1.0;
        formKey.currentState!.reset();
        if((patients as List<PatientWithNamePhone>).isNotEmpty){
          Get.toNamed(Routes.F_APPOINTMENT_VITAL_SIGN, arguments: (patients as List<PatientWithNamePhone>).first, parameters: <String, String>{
            'doctorId': doctorId.toString(),
            'concernId': concernId.toString(),
            'slotId': slotId.toString(),
            'phone': phone,
            'otp': '0',
          });
        }else{
          Get.toNamed(Routes.F_SEARCH_A_PATIENT_EMPTY_FEEDBACK, arguments: doctorId, parameters: <String, String>{
            'concernId': '$concernId',
            'slotId': '$slotId',
            'phone': '$countryCode$phone'
          });
        }
      } else if (feedback == 1004 || feedback == 1005) {
        error = 'Invalid phone number.\nPlease enter a valid phone number.';
        opacity = 0.8;
      } else {
        error = 'Something went wrong.\nWe are working on it.';
        opacity = 0.8;
      }
    }
  }

  Future updatePatientByPhoneWithCountryCode()async{
    if(phone != '' && countryCode != ''){
      if((patients as List<PatientWithNamePhone>).isEmpty){
        PatientWithNamePhone? patientWithNamePhone = await patientProvider.getPatientWithNamePhone(phone: '$countryCode$phone');
        if(patientWithNamePhone != null){
          _patients.assign(patientWithNamePhone);
        }
      }
    }
  }
  Future updatePatientByPhoneWithoutCountryCode()async{
    if(phone != ''){
      if((patients as List<PatientWithNamePhone>).isEmpty){
        PatientWithNamePhone? patientWithNamePhone = await patientProvider.getPatientWithNamePhone(phone: '0$phone');
        if(patientWithNamePhone != null){
          _patients.assign(patientWithNamePhone);
        }
      }
    }
  }
}
