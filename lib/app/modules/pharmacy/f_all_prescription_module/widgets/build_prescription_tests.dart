import 'package:wha/app/data/model/model.dart';
import 'package:flutter/material.dart';


class BuildPrescriptionTests extends StatelessWidget {
  const BuildPrescriptionTests({Key? key, required this.prescription}) : super(key: key);
  final Prescription prescription;

  @override
  Widget build(BuildContext context) {
    return ListView(
      shrinkWrap: true,
      physics: const NeverScrollableScrollPhysics(),
      children: [
        const Text(
          'Test Advice:',
          style: TextStyle(
            decoration: TextDecoration.underline,
            decorationThickness: 1.5,
            fontWeight: FontWeight.bold,
            fontSize: 22,
          ),
        ),
        const SizedBox(height: 5),
        ListView.builder(
          padding: const EdgeInsets.only(left: 15),
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          itemCount: prescription.tests.length,
          itemBuilder: (context, index){
            return Row(
              children: [
                Text(
                  '${index + 1}. ',
                  style: const TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                Text(
                  prescription.tests[index].name,
                  style: const TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.normal,
                  ),
                ),
              ],
            );
          },
        ),
      ],
    );
  }
}
