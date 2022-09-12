import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/modules/patient/p_choose_a_doctor_module/p_choose_a_doctor_controller.dart';
import 'package:wha/app/modules/patient/p_choose_a_doctor_module/widgets/widgets.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PChooseADoctorPage extends GetView<PChooseADoctorController> {
  const PChooseADoctorPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.updateDoctors();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
          child: PhysicalModel(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            elevation: 30,
            child: SingleChildScrollView(
              physics: const NeverScrollableScrollPhysics(),
              child: Column(
                children: [
                  const BuildTopBar(),
                  const BuildTitle(),
                  BuildAnyAvailableDoctor(concernId: controller.concernId),
                  SingleChildScrollView(
                    child: Column(
                      children: [
                        Obx(() {
                          if (controller.isLoading) {
                            return const BuildDoctorShimmerList();
                          } else if ((controller.doctors as List).isEmpty) {
                            return const BuildNoDoctorAvailable();
                          }
                          return BuildDoctorList(
                              concernId: controller.concernId,
                              doctors: (controller.doctors
                                  as List<DoctorForAppointment>));
                        }),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
