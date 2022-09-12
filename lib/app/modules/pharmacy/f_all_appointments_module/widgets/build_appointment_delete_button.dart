import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/data/service/service.dart';
import 'package:wha/app/modules/pharmacy/f_all_appointments_module/f_all_appointments_controller.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';

class BuildAppointmentDeleteButton extends StatefulWidget {
  const BuildAppointmentDeleteButton({Key? key, required this.appointment})
      : super(key: key);
  final Appointment appointment;

  @override
  State<BuildAppointmentDeleteButton> createState() =>
      _BuildAppointmentDeleteButtonState();
}

class _BuildAppointmentDeleteButtonState
    extends State<BuildAppointmentDeleteButton> {
  bool isLoading = false;
  final AppointmentService appointmentService = Get.find<AppointmentService>();
  final FAllAppointmentsController controller =
      Get.find<FAllAppointmentsController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 15),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          isLoading
              ? const SpinKitCircle(
                  color: backgroundColor,
                )
              : InkWell(
                  onTap: () async {},
                  child: PhysicalModel(
                    color: backgroundColor,
                    borderRadius: BorderRadius.circular(50),
                    child: SizedBox(
                      height: 50,
                      width: 50,
                      child: Center(
                        child: Icon(
                          Icons.delete,
                          color: Colors.red.shade900,
                          size: 35,
                        ),
                      ),
                    ),
                  ),
                ),
          const Text(
            'Delete',
            style: TextStyle(color: Colors.white),
          )
        ],
      ),
    );
  }
}
