import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_current_prescription_module/p_current_prescription_controller.dart';

class PCurrentPrescriptionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PCurrentPrescriptionController());
  }
}