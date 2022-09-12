import 'package:wha/app/data/provider/concern.provider.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/pharmacy/f_choose_health_concern_module/f_choose_health_concern_controller.dart';

class FChooseHealthConcernBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => FChooseHealthConcernController());
    Get.lazyPut(() => ConcernProvider());
  }
}
