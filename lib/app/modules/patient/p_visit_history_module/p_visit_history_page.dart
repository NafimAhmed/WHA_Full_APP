import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_visit_history_module/p_visit_history_controller.dart';

class PVisitHistoryPage extends GetView<PVisitHistoryController> {
  const PVisitHistoryPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 500,
      child: Center(
        child: Text(
          'History',
          style: TextStyle(
            color: Colors.black26,
            fontSize: 33,
          ),
        ),
      ),
    );
  }
}
