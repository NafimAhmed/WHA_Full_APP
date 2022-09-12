import 'package:wha/app/data/model/model.dart';
import 'package:flutter/material.dart';
import 'package:wha/app/modules/patient/p_all_prescription_module/widgets/widgets.dart';

class BuildPrescriptionBodyBackground extends StatelessWidget {
  const BuildPrescriptionBodyBackground({Key? key, required this.prescription})
      : super(key: key);
  final Prescription prescription;

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        const Center(
          child: Opacity(
              opacity: 0.2,
              child: Image(image: AssetImage('assets/tri_logo.png'))),
        ),
        BuildPrescriptionBody(prescription: prescription),
      ],
    );
  }
}
