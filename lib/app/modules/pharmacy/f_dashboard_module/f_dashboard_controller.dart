import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/data/provider/provider.dart';
import 'package:wha/app/data/service/service.dart';
import 'package:wha/app/modules/pharmacy/f_chat_module/f_chat_page.dart';
import 'package:wha/app/modules/pharmacy/f_home_module/f_home_page.dart';
import 'package:wha/app/modules/pharmacy/f_profile_module/f_profile_page.dart';
import 'package:wha/app/modules/pharmacy/f_settings_module/f_settings_page.dart';
import 'package:get/get.dart';
import 'package:flutter/material.dart';

class FDashboardController extends GetxController{
  final List<Widget> sites = [
    const FHomePage(),
    FProfilePage(),
    const FChatPage(),
    const FSettingsPage(),
  ];

  final AppState appState = Get.find();
  final ConcernProvider concernProvider = Get.find<ConcernProvider>();
  final VitalSignQuestionProvider vitalSignQuestionProvider = Get.find<VitalSignQuestionProvider>();
  final HotlineService hotlineService = Get.find<HotlineService>();

  updateHotlines(){
    if((appState.concerns as List<Concern>).isEmpty){
      concernProvider.getAllConcern();
    }
  }
  updateConcerns(){
    if((appState.hotlines as List<Hotline>).isEmpty){
      hotlineService.updateHotlines();
    }
  }
  updateVitalSignQuestions(){
    if((appState.vitalSignQuestions as List<VitalSignQuestion>).isEmpty){
      vitalSignQuestionProvider.updateVitalSignQuestions();
    }
  }
}
