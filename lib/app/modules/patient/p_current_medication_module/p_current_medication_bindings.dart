import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_current_medication_module/p_current_medication_controller.dart';

class PCurrentMedicationBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PCurrentMedicationController());
  }
}