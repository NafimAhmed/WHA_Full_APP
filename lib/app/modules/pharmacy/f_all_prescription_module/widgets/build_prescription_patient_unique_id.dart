import 'package:wha/app/data/model/model.dart';
import 'package:flutter/material.dart';

class BuildPrescriptionPatientUniqueId extends StatelessWidget {
  const BuildPrescriptionPatientUniqueId({Key? key, required this.prescription}) : super(key: key);
  final Prescription prescription;

  @override
  Widget build(BuildContext context) {
    if(prescription.patient.uniqueId.toInt() == 0){
      return const SizedBox.shrink();
    }
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Patient ID:',
          style: TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.normal,
          ),
          softWrap: true,
          textAlign: TextAlign.center,
        ),
        const SizedBox(height: 2),
        Text(
          prescription.patient.uniqueId.toInt().toString(),
          style: const TextStyle(
            fontSize: 14,
            fontWeight: FontWeight.bold,
          ),
          softWrap: true,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
