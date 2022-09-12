import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_visited_doctors_module/p_visited_doctors_controller.dart';

class PVisitedDoctorsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PVisitedDoctorsController());
  }
}