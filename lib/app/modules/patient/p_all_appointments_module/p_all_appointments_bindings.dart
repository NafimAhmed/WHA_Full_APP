import 'package:wha/app/data/provider/provider.dart';
import 'package:wha/app/data/service/service.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_all_appointments_module/p_all_appointments_controller.dart';

class PAllAppointmentsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PAllAppointmentsController());
    Get.lazyPut(() => DoctorProvider());
    Get.lazyPut(() => AppointmentService());
    Get.lazyPut(() => AppointmentProvider());
  }
}