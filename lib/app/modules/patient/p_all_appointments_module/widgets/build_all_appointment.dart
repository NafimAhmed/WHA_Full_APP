import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/modules/patient/p_all_appointments_module/widgets/widgets.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BuildAllAppointment extends StatelessWidget {
  const BuildAllAppointment({Key? key, required this.appointments})
      : super(key: key);
  final List<Appointment> appointments;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Container(
      height: size.height,
      color: backgroundColor,
      margin: const EdgeInsets.only(top: 51),
      child: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: appointments.isEmpty
            ? [const BuildNoAppointmentFound()]
            : appointments
                    .whereType<CallingAppointment>()
                    .map<Widget>((e) => BuildCallingAppointment(appointment: e))
                    .toList() +
                appointments
                    .whereType<AcceptedWithTimeAppointment>()
                    .map<Widget>(
                        (e) => BuildAcceptedAppointment(appointment: e))
                    .toList() +
                appointments
                    .whereType<AcceptedWithoutTimeAppointment>()
                    .map<Widget>(
                        (e) => BuildAcceptedAppointment(appointment: e))
                    .toList() +
                appointments
                    .whereType<PendingAppointment>()
                    .map<Widget>((e) => BuildPendingAppointment(appointment: e))
                    .toList() +
                appointments
                    .whereType<CancelledAppointment>()
                    .map<Widget>((e) => BuildDeadAppointment(appointment: e))
                    .toList() +
                appointments
                    .whereType<CompletedAppointment>()
                    .map<Widget>((e) => BuildDeadAppointment(appointment: e))
                    .toList(),
      ),
    );
  }
}
