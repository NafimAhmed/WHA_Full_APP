import 'package:wha/app/data/model/model.dart';
import 'package:flutter/material.dart';
import 'package:wha/app/modules/patient/p_current_medication_module/widgets/build_after_medication.dart';
import 'package:wha/app/modules/patient/p_current_medication_module/widgets/build_before_medication.dart';

class PCurrentMorningMedication extends StatelessWidget {
  const PCurrentMorningMedication({Key? key, required this.currentMedication})
      : super(key: key);
  final List<CurrentMedication> currentMedication;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: ListView(
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        children: [
          BuildBeforeMedication(currentMedication: currentMedication.first, takingTime: 'morning'),
          BuildBeforeMedication(currentMedication: currentMedication.first, takingTime: 'morning'),
          BuildAfterMedication(currentMedication: currentMedication.first, takingTime: 'morning'),
          BuildAfterMedication(currentMedication: currentMedication.first, takingTime: 'morning'),
        ],
      ),
    );
  }
}
