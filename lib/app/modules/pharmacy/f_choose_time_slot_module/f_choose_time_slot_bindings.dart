import 'package:wha/app/data/provider/provider.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/pharmacy/f_choose_time_slot_module/f_choose_time_slot_controller.dart';

class FChooseTimeSlotBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FChooseTimeSlotController());
    Get.lazyPut(() => AppointmentTimeSlotProvider());
  }
}