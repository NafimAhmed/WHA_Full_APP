import 'package:get/get.dart';
import 'package:wha/app/modules/pharmacy/f_chat_module/f_chat_controller.dart';

class FChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FChatController());
  }
}