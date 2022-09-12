import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_current_test_reports_module/p_current_test_reports_controller.dart';

class PCurrentTestReportsPage extends GetView<PCurrentTestReportsController> {
  const PCurrentTestReportsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 500,
      child: Center(
        child: Text(
          'Test Reports',
          style: TextStyle(
            color: Colors.black26,
            fontSize: 33,
          ),
        ),
      ),
    );
  }
}
