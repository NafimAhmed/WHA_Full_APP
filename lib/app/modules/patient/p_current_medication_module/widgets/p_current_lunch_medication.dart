import 'package:wha/app/data/model/model.dart';
import 'package:flutter/material.dart';

import 'build_after_medication.dart';
import 'build_before_medication.dart';

class PCurrentLunchMedication extends StatelessWidget {
  const PCurrentLunchMedication({Key? key, required this.currentMedication}) : super(key: key);
  final List<CurrentMedication> currentMedication;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          BuildBeforeMedication(currentMedication: currentMedication.first, takingTime: 'lunch'),
          BuildBeforeMedication(currentMedication: currentMedication.first, takingTime: 'lunch'),
          BuildAfterMedication(currentMedication: currentMedication.first, takingTime: 'lunch'),
          BuildAfterMedication(currentMedication: currentMedication.first, takingTime: 'lunch'),
        ],
      ),
    );
  }
}
