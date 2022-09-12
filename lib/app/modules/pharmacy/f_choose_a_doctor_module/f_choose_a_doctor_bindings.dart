import 'package:wha/app/data/provider/provider.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/pharmacy/f_choose_a_doctor_module/f_choose_a_doctor_controller.dart';

class FChooseADoctorBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FChooseADoctorController());
    Get.lazyPut(() => DoctorProvider());
  }
}