import 'package:wha/app/modules/pharmacy/f_appointment_vital_sign_module/f_appointment_vital_sign_controller.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildNextButton extends StatelessWidget {
  BuildNextButton({Key? key, required this.buttonText}) : super(key: key);
  final String buttonText;
  final FAppointmentVitalSignController controller = Get.find<FAppointmentVitalSignController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 15, 15, 15),
      child: SizedBox(
        height: 45,
        child: ElevatedButton(
          onPressed: () => controller.submit(),
          style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(primaryColor),
          ),
          child: Text(
            buttonText,
            style: const TextStyle(
              color: backgroundColor,
              fontSize: 18,
            ),
          ),
        ),
      ),
    );
  }
}
