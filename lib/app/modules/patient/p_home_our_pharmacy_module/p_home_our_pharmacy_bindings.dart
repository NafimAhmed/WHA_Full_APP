import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_home_our_pharmacy_module/p_home_our_pharmacy_controller.dart';

class PHomeOurPharmacyBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PHomeOurPharmacyController());
  }
}