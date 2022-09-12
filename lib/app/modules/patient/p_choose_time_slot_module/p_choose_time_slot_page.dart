import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/modules/patient/p_choose_time_slot_module/widgets/widgets.dart';
import 'package:wha/app/modules/patient/p_choose_time_slot_module/p_choose_time_slot_controller.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class PChooseTimeSlotPage extends GetView<PChooseTimeSlotController> {
  const PChooseTimeSlotPage({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    controller.updateTimeSlot();
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
                  BuildMakeItQuick(
                    doctorId: controller.doctorId,
                    concernId: controller.concernId,
                  ),
                  Obx(() {
                    return controller.isLoading
                        ? const BuildLoadingAppointmentTimeSlot()
                        : (controller.appointmentTimes as List<AppointmentTime>)
                                .isEmpty
                            ? BuildEmptyTimeSlot(
                                doctorId: controller.doctorId,
                                concernId: controller.concernId)
                            : Column(children: [
                                BuildAppointmentTimes(
                                    appointmentTimes:
                                        controller.appointmentTimes),
                                BuildAppointmentDateTitle(
                                    appointmentTime: (controller
                                                .appointmentTimes
                                            as List<AppointmentTime>)[
                                        controller.selectedAppointmentTimeIndex
                                            as int]),
                                BuildAppointmentSlots(
                                    doctorId: controller.doctorId,
                                    concernId: controller.concernId,
                                    appointmentTime: (controller
                                                .appointmentTimes
                                            as List<AppointmentTime>)[
                                        controller.selectedAppointmentTimeIndex
                                            as int]),
                              ]);
                  }),
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
