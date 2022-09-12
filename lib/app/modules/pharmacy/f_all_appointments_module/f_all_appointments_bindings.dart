import 'package:wha/app/data/provider/provider.dart';
import 'package:wha/app/data/service/service.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/pharmacy/f_all_appointments_module/f_all_appointments_controller.dart';

class FAllAppointmentsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FAllAppointmentsController());
    Get.lazyPut(() => DoctorProvider());
    Get.lazyPut(() => AppointmentService());
    Get.lazyPut(() => AppointmentProvider());
  }
}