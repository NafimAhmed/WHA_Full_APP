import 'package:wha/app/data/provider/provider.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/pharmacy/f_all_prescription_module/f_all_prescription_controller.dart';

class FAllPrescriptionBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FAllPrescriptionController());
    Get.lazyPut(() => PrescriptionProvider());
  }
}
