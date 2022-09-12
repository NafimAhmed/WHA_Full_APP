import 'package:wha/app/data/provider/provider.dart';
import 'package:wha/app/data/service/service.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_confirm_patient_details_module/p_confirm_patient_details_controller.dart';
import 'package:wha/app/modules/patient/p_current_appointments_module/p_current_appointments_controller.dart';

class PConfirmPatientDetailsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PConfirmPatientDetailsController());
    Get.lazyPut(() => PCurrentAppointmentsController());
    Get.lazyPut(() => CurrentAppointmentProvider());
    Get.lazyPut(() => AppointmentService());
  }
}