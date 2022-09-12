import 'package:wha/app/data/provider/provider.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_choose_health_concern_module/p_choose_health_concern_controller.dart';

class PChooseHealthConcernBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PChooseHealthConcernController());
    Get.lazyPut(() => ConcernProvider());
  }
}
