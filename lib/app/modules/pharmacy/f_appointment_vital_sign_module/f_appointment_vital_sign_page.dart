import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/modules/pharmacy/f_appointment_vital_sign_module/widgets/widgets.dart';
import 'package:wha/app/modules/pharmacy/f_appointment_vital_sign_module/f_appointment_vital_sign_controller.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FAppointmentVitalSignPage extends GetView<FAppointmentVitalSignController> {
  const FAppointmentVitalSignPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    controller.updateQuestions();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Container(
              margin: const EdgeInsets.only(top: 51),
              color: backgroundColor,
              height: (size.height - 51),
              width: size.width,
              child: Obx(() {
                return controller.isLoading
                    ? const BuildLoading()
                    : BuildQuestions(
                    questions:
                    controller.questions as List<VitalSignQuestion>, buttonText: controller.buttonText);
              }),
            ),
            const BuildTopBar(),
          ],
        ),
      ),
    );
  }
}
