import 'dart:developer';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/modules/patient/p_current_medication_module/p_current_medication_controller.dart';
import 'package:wha/app/modules/patient/p_current_medication_module/widgets/p_current_dinner_medication.dart';
import 'package:wha/app/modules/patient/p_current_medication_module/widgets/p_current_lunch_medication.dart';
import 'package:wha/app/modules/patient/p_current_medication_module/widgets/p_current_morning_medication.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class PCurrentMedicationPage extends GetView<PCurrentMedicationController> {
  const PCurrentMedicationPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.updateCurrentMedicationList();
    return Obx(
      () {
        if (controller.currentMedications.isEmpty) {
          return const SizedBox();
        }
        return Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.fromLTRB(15, 15, 15, 5),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  const Text(
                    'Current Medication',
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
              height: 40,
              width: double.infinity,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceAround,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  InkWell(
                    onTap: (){
                      controller.swiperController.move(0, animation: true);
                    },
                    child: Column(
                      children: [
                        const Icon(
                          Icons.wb_twighlight,
                          size: 22,
                        ),
                        Text(
                          'breakfast',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: controller.currentIndex == 0
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: controller.currentIndex == 0
                                ? primaryColor
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      controller.swiperController.move(1, animation: true);
                    },
                    child: Column(
                      children: [
                        const Icon(
                          Icons.wb_sunny_outlined,
                          size: 22,
                        ),
                        Text(
                          'lunch',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: controller.currentIndex == 1
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: controller.currentIndex == 1
                                ? primaryColor
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                  InkWell(
                    onTap: (){
                      controller.swiperController.move(2, animation: true);
                    },
                    child: Column(
                      children: [
                        const Icon(
                          Icons.wb_incandescent,
                          size: 22,
                        ),
                        Text(
                          'dinner',
                          style: TextStyle(
                            fontSize: 13,
                            fontWeight: controller.currentIndex == 2
                                ? FontWeight.bold
                                : FontWeight.normal,
                            color: controller.currentIndex == 2
                                ? primaryColor
                                : Colors.grey,
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
            SizedBox(
              height: (controller.currentMedications as List<CurrentMedication>).length * 72,
              child: Swiper(
                onIndexChanged: (int index) {
                  controller.currentIndex = index;
                  log('${controller.currentIndex}');
                },
                itemCount: 3,
                viewportFraction: 1,
                loop: false,
                autoplay: false,
                controller: controller.swiperController,
                scrollDirection: Axis.horizontal,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (BuildContext context, int index) {
                  switch (index) {
                    case 0:
                      return PCurrentMorningMedication(
                          currentMedication: controller.currentMedications as List<CurrentMedication>);
                    case 1:
                      return PCurrentLunchMedication(
                          currentMedication: controller.currentMedications as List<CurrentMedication>);
                    case 2:
                      return PCurrentDinnerMedication(
                          currentMedication: controller.currentMedications as List<CurrentMedication>);
                    default:
                      return PCurrentMorningMedication(
                          currentMedication: controller.currentMedications as List<CurrentMedication>);
                  }
                },
              ),
            ),
          ],
        );
      },
    );
  }
}
