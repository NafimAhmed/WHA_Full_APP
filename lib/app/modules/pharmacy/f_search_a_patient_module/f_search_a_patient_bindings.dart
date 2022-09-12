import 'package:wha/app/data/provider/patient.provider.dart';
import 'package:wha/app/data/service/service.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/pharmacy/f_search_a_patient_module/f_search_a_patient_controller.dart';

class FSearchAPatientBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FSearchAPatientController());
    Get.lazyPut(() => PatientProvider());
    Get.lazyPut(() => SmsService());
  }
}