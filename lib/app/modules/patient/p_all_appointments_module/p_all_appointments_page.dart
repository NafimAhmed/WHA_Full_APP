import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/modules/patient/p_all_appointments_module/p_all_appointments_controller.dart';
import 'package:wha/app/modules/patient/p_all_appointments_module/widgets/widgets.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class PAllAppointmentsPage extends GetView<PAllAppointmentsController> {
  const PAllAppointmentsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.updateLiveAppointments();
    controller.updateDeadAppointments();
    controller.updateAppointmentRepeatedly();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Stack(
          children: [
            Obx(() {
              return controller.isLoading
                  ? Positioned(
                      child: Container(
                          color: backgroundColor,
                          child: const Center(
                              child: SpinKitCircle(color: primaryColor))))
                  : BuildAllAppointment(
                      appointments:
                      (controller.liveAppointments as List<Appointment>) + (controller.deadAppointments as List<Appointment>));
            }),
            const BuildTopBar(),
          ],
        ),
      ),
    );
  }
}
