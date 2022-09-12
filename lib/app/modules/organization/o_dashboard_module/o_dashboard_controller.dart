import 'package:get/get.dart';
import 'package:flutter/material.dart';
import 'package:wha/app/modules/organization/o_chat_module/o_chat_page.dart';
import 'package:wha/app/modules/organization/o_home_module/o_home_page.dart';
import 'package:wha/app/modules/organization/o_profile_module/o_profile_page.dart';
import 'package:wha/app/modules/organization/o_settings_module/o_settings_page.dart';

class ODashboardController extends GetxController{
  final List<Widget> sites = [
    const OHomePage(),
    const OProfilePage(),
    const OChatPage(),
    const OSettingsPage(),
  ];
}
