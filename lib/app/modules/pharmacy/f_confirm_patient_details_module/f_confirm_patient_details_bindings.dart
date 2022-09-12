import 'package:wha/app/data/service/service.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/pharmacy/f_confirm_patient_details_module/f_confirm_patient_details_controller.dart';

class FConfirmPatientDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FConfirmPatientDetailsController());
    Get.lazyPut(() => AppointmentService());
  }
}
