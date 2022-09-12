import 'package:wha/app/data/provider/provider.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_all_prescription_module/p_all_prescription_controller.dart';

class PAllPrescriptionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PAllPrescriptionController());
    Get.lazyPut(() => PrescriptionProvider());
  }
}
