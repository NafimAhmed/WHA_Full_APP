import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'widgets.dart';

class BuildPrescriptions extends StatelessWidget {
  const BuildPrescriptions({Key? key, required this.prescriptions})
      : super(key: key);
  final List<Prescription> prescriptions;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      color: backgroundColor,
      margin: const EdgeInsets.only(top: 51),
      child: prescriptions.isEmpty
          ? const BuildNoPrescriptionFound()
          : Scrollbar(
            child: ListView.builder(
                itemCount: prescriptions.length,
                physics: const AlwaysScrollableScrollPhysics(),
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return BuildPrescription(
                      prescription: prescriptions[index]);
                }),
          ),
    );
  }
}