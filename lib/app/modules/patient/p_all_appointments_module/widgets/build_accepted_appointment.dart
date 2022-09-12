import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/modules/patient/p_all_appointments_module/widgets/widgets.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BuildAcceptedAppointment extends StatelessWidget {
  const BuildAcceptedAppointment({Key? key, required this.appointment}) : super(key: key);
  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 8, 5, 8),
      child: PhysicalModel(
        color: backgroundColor,
        elevation: 1.0,
        child: Column(
          children: [
            Container(
              height: 99.7,
              color: primaryColor,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  BuildAppointmentDoctorDetails(appointment: appointment),
                  const Spacer(),
                ],
              ),
            ),
            const Divider(color: backgroundColor,height: 0.3),
            BuildAppointmentStatusSlot(appointment: appointment),
          ],
        ),
      ),
    );
  }
}
