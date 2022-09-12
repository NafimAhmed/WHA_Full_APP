import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/modules/patient/p_all_prescription_module/widgets/widgets.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BuildPrescriptionHeader extends StatelessWidget {
  const BuildPrescriptionHeader({Key? key, required this.prescription}) : super(key: key);
  final Prescription prescription;

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 0),
      decoration: const BoxDecoration(
          gradient: LinearGradient(
            begin: Alignment.topCenter,
            end: Alignment.bottomCenter,
            colors: [
              primaryColor,
              Colors.white60,
            ],
          ),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          BuildPrescriptionDoctorInfo(prescription: prescription),
          BuildPrescriptionPatientUniqueId(prescription: prescription),
        ],
      ),
    );
  }
}
