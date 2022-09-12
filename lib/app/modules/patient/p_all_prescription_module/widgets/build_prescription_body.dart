import 'package:wha/app/data/model/model.dart';
import 'package:flutter/material.dart';
import 'package:wha/app/modules/patient/p_all_prescription_module/widgets/widgets.dart';

class BuildPrescriptionBody extends StatelessWidget {
  const BuildPrescriptionBody({Key? key, required this.prescription})
      : super(key: key);
  final Prescription prescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10),
      child: ListView(
        physics: const NeverScrollableScrollPhysics(),
        shrinkWrap: true,
        children: [
          const SizedBox(height: 5),
          const Text(
            'Rx',
            style: TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 33,
            ),
          ),
          const SizedBox(height: 3),
          ListView.builder(
            shrinkWrap: true,
            itemCount: prescription.medicines.length,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return BuildPrescriptionMedicine(
                  index: index, medicine: prescription.medicines[index]);
            },
          ),
          const SizedBox(height: 25),
          BuildPrescriptionComplains(prescription: prescription),
          const SizedBox(height: 10),
          BuildPrescriptionTests(prescription: prescription),
          const SizedBox(height: 10),
          BuildPrescriptionAdvice(prescription: prescription),
        ],
      ),
    );
  }
}
