import 'package:wha/app/data/provider/provider.dart';
import 'package:wha/app/data/service/service.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/pharmacy/f_add_patient_details_module/f_add_patient_details_controller.dart';

class FAddPatientDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FAddPatientDetailsController());
    Get.lazyPut(() => SignupPatientService());
    Get.lazyPut(() => PatientProvider());
  }
}