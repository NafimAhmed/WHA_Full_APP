import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../p_all_appointments_controller.dart';

class BuildAppointmentCancelButton extends StatelessWidget {
  BuildAppointmentCancelButton({Key? key, required this.appointment})
      : super(key: key);
  final PendingAppointment appointment;
  final PAllAppointmentsController controller =
      Get.find<PAllAppointmentsController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          InkWell(
            onTap: () {
              controller.cancelAppointment(appointment: appointment);
            },
            child: PhysicalModel(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(50),
              child: SizedBox(
                height: 50,
                width: 50,
                child: Center(
                  child: Icon(
                    Icons.cancel,
                    color: Colors.red.shade900,
                    size: 50,
                  ),
                ),
              ),
            ),
          ),
          const Text(
            'Cancel',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
