import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../p_confirm_patient_details_controller.dart';

class BuildAppointmentConfirmButton extends StatelessWidget {
  BuildAppointmentConfirmButton({Key? key}) : super(key: key);
  final PConfirmPatientDetailsController pConfirmPatientDetailsController = Get.find<PConfirmPatientDetailsController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 10, 10, 10),
      child: SizedBox(
        height: 40,
        width: size.width - 20,
        child: ElevatedButton(
          onPressed: !pConfirmPatientDetailsController.isLoading ? () {
            pConfirmPatientDetailsController.submitAppointment();
          } : null,
          child: const Center(
            child: Text('Confirm'),
          ),
          style: ButtonStyle(
            elevation: MaterialStateProperty.all(10.0),
            backgroundColor: MaterialStateProperty.all(primaryColor),
          ),
        ),
      ),
    );
  }
}
