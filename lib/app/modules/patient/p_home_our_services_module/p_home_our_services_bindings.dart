import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_home_our_services_module/p_home_our_services_controller.dart';

class PHomeOurServicesBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PHomeOurServicesController());
  }
}