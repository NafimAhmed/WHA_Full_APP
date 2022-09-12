import 'package:wha/app/modules/patient/p_current_prescription_module/p_current_prescription_controller.dart';
import 'package:wha/app/modules/patient/p_current_prescription_module/widgets/build_current_prescription.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PCurrentPrescriptionPage extends GetView<PCurrentPrescriptionController> {
  const PCurrentPrescriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.updateCurrentPrescriptions();
    return Obx(
      () {
        if (controller.currentPrescriptions.isEmpty) {
          return const SizedBox(height: 0, width: 0);
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  const Text(
                    'Prescriptions',
                    style: TextStyle(
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                      fontSize: 18,
                    ),
                  ),
                  InkWell(
                    onTap: (){},
                    child: Padding(
                      padding: const EdgeInsets.fromLTRB(5, 2, 0, 2),
                      child: Text(
                        'see all',
                        style: GoogleFonts.openSans(
                          color: primaryColor,
                          fontWeight: FontWeight.normal,
                        ),
                      ),
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 10),
            SizedBox(
              height: 300,
              child: SingleChildScrollView(
                physics: const BouncingScrollPhysics(),
                scrollDirection: Axis.horizontal,
                child: Row(
                  children: controller.currentPrescriptions
                      .map<Widget>((prescription) => BuildCurrentPrescription(prescription: prescription))
                      .toList(),
                ),
              ),
            ),
          ],
        );
      },
    );
  }
}
