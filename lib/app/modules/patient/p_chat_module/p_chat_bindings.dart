import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_chat_module/p_chat_controller.dart';

class PChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PChatController());
  }
}