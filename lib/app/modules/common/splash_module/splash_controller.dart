import 'dart:async';
import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/data/provider/provider.dart';
import 'package:wha/app/data/service/service.dart';
import 'package:get/get.dart';
import 'package:wha/app/routes/app_pages.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashController extends GetxController {
  final AppState appState = Get.find<AppState>();
  final LoginService loginService = Get.find<LoginService>();
  final UserProvider userProvider = Get.find<UserProvider>();

  checkNavigate() async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    final String phone = prefs.getString('phone') ?? '';
    final String password = prefs.getString('password') ?? '';
    if(phone != '' || password != ''){
      // phone and password exist
      bool isLoginSucceed = await loginService.login( phone,password);
      if(isLoginSucceed){
        // login succeed
        User? user = await userProvider.getUser(accessToken: appState.accessToken);
        if(user != null){
          appState.user = user;
          if(user is Patient){
            Get.offNamed(Routes.P_DASHBOARD);
          }else if(user is Doctor){
            Get.offNamed(Routes.D_DASHBOARD);
          }else if(user is Pharmacy) {
            Get.offNamed(Routes.F_DASHBOARD);
          }else if(user is Organization){
            Get.offNamed(Routes.O_DASHBOARD);
          }
          // fetching user failed
        }else{
          Get.offNamed(Routes.JOIN);
        }
        // login failed
      }else{
        Get.offNamed(Routes.JOIN);
      }
      // identity and password doesn't exist
    }else{
      Timer(const Duration(milliseconds: 1500), (){
        Get.offNamed(Routes.INTRO);
      });
    }
  }
}
