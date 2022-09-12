import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_visit_history_module/p_visit_history_controller.dart';

class PVisitHistoryBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PVisitHistoryController());
  }
}