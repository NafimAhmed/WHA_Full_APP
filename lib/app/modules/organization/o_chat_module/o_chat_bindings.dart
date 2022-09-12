import 'package:get/get.dart';
import 'package:wha/app/modules/organization/o_chat_module/o_chat_controller.dart';

class OChatBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => OChatController());
  }
}