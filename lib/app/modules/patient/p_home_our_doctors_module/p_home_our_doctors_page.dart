import 'package:wha/app/modules/patient/p_home_our_doctors_module/p_home_our_doctors_controller.dart';
import 'package:wha/app/modules/patient/p_home_our_doctors_module/widgets/build_our_doctor.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PHomeOurDoctorsPage extends GetView<PHomeOurDoctorsController> {
  const PHomeOurDoctorsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.updateOurDoctors();
    return Obx(
      () {
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
                    'Our Doctors & Specialist',
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
                  children: controller.doctors
                      .map<Widget>((doctor) => BuildOurDoctor(doctor: doctor))
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
