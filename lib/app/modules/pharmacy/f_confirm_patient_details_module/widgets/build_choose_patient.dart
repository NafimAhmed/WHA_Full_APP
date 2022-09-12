import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import '../f_confirm_patient_details_controller.dart';

class BuildChoosePatient extends StatelessWidget {
  BuildChoosePatient(
      {Key? key, required this.patient, required this.isOtherPatient})
      : super(key: key);
  final PatientWithNamePhone patient;
  final bool isOtherPatient;

  final FConfirmPatientDetailsController controller =
      Get.find<FConfirmPatientDetailsController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
      child: PhysicalModel(
        color: backgroundColor,
        elevation: 1.0,
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: SizedBox(
            child: ListView(
              shrinkWrap: true,
              children: [
                Text(
                  'This appointment for',
                  style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                RadioListTile(
                  value: 'false',
                  groupValue: isOtherPatient.toString(),
                  activeColor: primaryColor,
                  onChanged: !controller.isLoading
                      ? (String? value) {
                          if (value == 'true') {
                            controller.isOtherPatient = true;
                          } else if (value == 'false') {
                            controller.isOtherPatient = false;
                          }
                        }
                      : null,
                  title: Text(
                    patient.firstName + ' ' + patient.lastName,
                  ),
                  dense: true,
                  toggleable: true,
                ),
                const Divider(color: Colors.grey),
                RadioListTile(
                  value: 'true',
                  groupValue: isOtherPatient.toString(),
                  activeColor: primaryColor,
                  onChanged: !controller.isLoading
                      ? (String? value) {
                          if (value == 'true') {
                            controller.isOtherPatient = true;
                          } else if (value == 'false') {
                            controller.isOtherPatient = false;
                          }
                        }
                      : null,
                  title: const Text('Other patient'),
                  dense: true,
                  toggleable: true,
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
