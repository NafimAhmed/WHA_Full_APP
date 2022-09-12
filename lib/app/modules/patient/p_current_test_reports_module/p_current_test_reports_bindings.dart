import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_current_test_reports_module/p_current_test_reports_controller.dart';

class PCurrentTestReportsBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PCurrentTestReportsController());
  }
}