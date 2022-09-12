import 'package:wha/app/data/provider/provider.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_current_appointments_module/p_current_appointments_controller.dart';

class PCurrentAppointmentsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PCurrentAppointmentsController());
    Get.lazyPut(() => CurrentAppointmentProvider());
  }
}