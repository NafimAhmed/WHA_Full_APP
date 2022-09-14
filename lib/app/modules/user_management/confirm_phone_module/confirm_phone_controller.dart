import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wha/app/routes/app_pages.dart';

class ConfirmPhoneController extends GetxController{
  final _phone = ''.obs;
  final _countryCode = '+880'.obs;
  final _opacity = 1.0.obs;
  final _error = ''.obs;

  get phone2 => _phone.value;

  get countryCode => _countryCode.value;

  get opacity => _opacity.value;

  get error => _error.value;

  set phone(value) => _phone.value = value;

  set countryCode(value) => _countryCode.value = value;

  set opacity(value) => _opacity.value = value;

  set error(value) => _error.value = value;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();

  confirmPhone(){
    Get.toNamed(Routes.VERIFY_OTP);
  }

}
