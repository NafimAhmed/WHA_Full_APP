import 'package:wha/app/data/provider/provider.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_choose_time_slot_module/p_choose_time_slot_controller.dart';

class PChooseTimeSlotBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PChooseTimeSlotController());
    Get.lazyPut(() => AppointmentTimeSlotProvider());
  }
}