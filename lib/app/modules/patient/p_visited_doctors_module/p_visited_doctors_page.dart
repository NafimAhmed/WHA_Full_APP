import 'package:wha/app/modules/patient/p_visited_doctors_module/p_visited_doctors_controller.dart';
import 'package:wha/app/modules/patient/p_visited_doctors_module/widgets/build_visited_doctors.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PVisitedDoctorsPage extends GetView<PVisitedDoctorsController> {
  const PVisitedDoctorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.updateVisitedDoctors();
    return Obx(() {
      if (controller.visitedDoctors.isEmpty) {
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
                  'Visited Doctors',
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
            height: 185,
            child: SingleChildScrollView(
              physics: const BouncingScrollPhysics(),
              scrollDirection: Axis.horizontal,
              child: Row(
                children: controller.visitedDoctors
                    .map<Widget>((doctor) => BuildVisitedDoctors(doctor: doctor))
                    .toList(),
              ),
            ),
          ),
        ],
      );
    });
  }
}
