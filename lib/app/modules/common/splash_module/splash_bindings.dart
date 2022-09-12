import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/provider/user.provider.dart';
import 'package:wha/app/data/service/login.service.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'package:wha/app/modules/common/splash_module/splash_controller.dart';

class SplashBinding implements Bindings {
  @override
  void dependencies() {
    Get.put<AppState>(AppState(), permanent: true);
    Get.lazyPut<SplashController>(() => SplashController());
    Get.put<UserProvider>(UserProvider());
    Get.put<LoginService>(LoginService());
    Get.putAsync<SharedPreferences>(() async => await SharedPreferences.getInstance(), permanent: true);
  }
}