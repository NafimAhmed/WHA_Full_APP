import 'package:wha/app/modules/pharmacy/f_confirm_patient_details_module/widgets/widgets.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/pharmacy/f_confirm_patient_details_module/f_confirm_patient_details_controller.dart';

class FConfirmPatientDetailsPage extends GetView<FConfirmPatientDetailsController> {
  const FConfirmPatientDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: Stack(
        children: [
          Obx(() {
            return Opacity(
              opacity: controller.isLoading ? 0.5 : 1.0,
              child: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
                  child: PhysicalModel(
                    color: backgroundColor,
                    borderRadius: const BorderRadius.only(
                        topLeft: Radius.circular(20),
                        topRight: Radius.circular(20)),
                    elevation: 30,
                    child: SingleChildScrollView(
                      physics: const NeverScrollableScrollPhysics(),
                      child: Column(
                        children: [
                          BuildTopBar(isLoading: controller.isLoading),
                          SingleChildScrollView(
                            physics: const BouncingScrollPhysics(),
                            child: Column(
                              children: [
                                BuildPatientCard(patient: controller.patientWithNamePhone),
                                BuildPurposeOfVisit(
                                    purposeOfVisit: controller.purposeOfVisit),
                                BuildAppointmentDateTime(
                                    dateTime: controller.appointmentTime),
                                Obx(() {
                                  return BuildChoosePatient(
                                      patient: controller.patientWithNamePhone,
                                      isOtherPatient:
                                      controller.isOtherPatient);
                                }),
                                Container(
                                  height: 300,
                                  color: backgroundColor,
                                ),
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
          }),
          Positioned(
            bottom: 0.0,
            child: Obx(() {
              return Opacity(
                opacity: controller.isLoading ? 0.5 : 1.0,
                child: BuildAppointmentConfirmButton(),
              );
            }),
          ),
          Obx(() {
            return controller.isLoading
                ? const Positioned(
              child: Center(
                child: SpinKitCircle(
                  color: primaryColor,
                  size: 70,
                ),
              ),
            )
                : const SizedBox.shrink();
          }),
        ],
      ),
    );
  }
}
