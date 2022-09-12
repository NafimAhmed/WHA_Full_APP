import 'package:wha/app/data/model/model.dart';
import 'package:flutter/material.dart';

class BuildPrescriptionAdvice extends StatelessWidget {
  const BuildPrescriptionAdvice({Key? key, required this.prescription}) : super(key: key);
  final Prescription prescription;

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Advice: ',
          style: TextStyle(
            fontSize: 25,
            fontWeight: FontWeight.bold,
          ),
        ),
        Padding(
          padding: const EdgeInsets.only(left: 10),
          child: Text(
            '* ${prescription.advice}.',
            style: const TextStyle(),
            softWrap: true,
            textAlign: TextAlign.center,
          ),
        ),
      ],
    );
  }
}
