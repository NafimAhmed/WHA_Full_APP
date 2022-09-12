import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_current_vital_signs_module/p_current_vital_signs_controller.dart';

class PCurrentVitalSignsPage extends GetView<PCurrentVitalSignsController> {
  const PCurrentVitalSignsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const SizedBox(
      height: 500,
      child: Center(
        child: Text(
          'Vital Signs',
          style: TextStyle(
            color: Colors.black26,
            fontSize: 33,
          ),
        ),
      ),
    );
  }
}
