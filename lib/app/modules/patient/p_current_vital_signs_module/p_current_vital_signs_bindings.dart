import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_current_vital_signs_module/p_current_vital_signs_controller.dart';

class PCurrentVitalSignsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PCurrentVitalSignsController());
  }
}