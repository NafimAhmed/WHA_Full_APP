import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/routes/app_pages.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class FSettingsController extends GetxController{
  final _logoutDialogVisible = false.obs;
  get logoutDialogVisible => _logoutDialogVisible.value;
  set logoutDialogVisible(value) => _logoutDialogVisible.value = value;


  final AppState appState = Get.find<AppState>();
  final SharedPreferences sharedPreferences = Get.find<SharedPreferences>();

  logout(){
    appState.user = Patient(
        id: 0,
        organizationId: 0,
        uniqueId: 0,
        roleId: 0,
        firstName: '',
        lastName: '',
        phone: '',
        email: '',
        address: '',
        profession: '',
        country: '',
        city: '',
        district: '',
        postcode: '',
        gender: '',
        image: '');
    appState.accessToken = '';
    sharedPreferences.setString('phone', '');
    sharedPreferences.setInt('otp', 0);
    sharedPreferences.remove('phone');
    sharedPreferences.remove('otp');
    sharedPreferences.clear();
    Future.delayed(const Duration(milliseconds: 50), (){
      logoutDialogVisible = false;
      Get.offAllNamed(Routes.SPLASH);
    });
  }
}
