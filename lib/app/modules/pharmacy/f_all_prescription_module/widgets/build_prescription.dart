import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/modules/pharmacy/f_all_prescription_module/widgets/widgets.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:screenshot/screenshot.dart';

class BuildPrescription extends StatelessWidget {
  BuildPrescription({Key? key, required this.prescription}) : super(key: key);
  final Prescription prescription;
  final ScreenshotController controller = ScreenshotController();

  @override
  Widget build(BuildContext context) {
    return Screenshot(
      controller: controller,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
        child: PhysicalModel(
          color: backgroundColor,
          elevation: 0.5,
          child: ListView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            children: [
              BuildPrescriptionHeader(prescription: prescription),
              const SizedBox(height: 5),
              const Divider(),
              const SizedBox(height: 5),
              BuildPrescriptionPatientInfo(prescription: prescription),
              const SizedBox(height: 5),
              const Divider(),
              const SizedBox(height: 5),
              BuildPrescriptionBodyBackground(prescription: prescription),
              const SizedBox(height: 35),
              BuildPrescriptionSaveButton(controller: controller, prescription: prescription),
            ],
          ),
        ),
      ),
    );
  }
}
