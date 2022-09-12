import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BuildCurrentPrescription extends StatelessWidget {
  const BuildCurrentPrescription({Key? key, required this.prescription}) : super(key: key);
  final CurrentPrescription prescription;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 5, 5, 10),
      child: PhysicalModel(
        color: backgroundColor,
        elevation: 1.0,
        child: Image(
          image: NetworkImage(
            prescription.imageUrl,
          ),
          fit: BoxFit.fitHeight,
        ),
      ),
    );
  }
}
