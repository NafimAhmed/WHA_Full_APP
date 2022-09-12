import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/modules/pharmacy/f_all_appointments_module/widgets/widgets.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildPendingAppointment extends StatelessWidget {
  const BuildPendingAppointment({Key? key, required this.appointment})
      : super(key: key);
  final PendingAppointment appointment;

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
                  appointment.doctorId != 0
                      ? BuildAppointmentDoctorDetails(appointment: appointment)
                      : Row(
                          children: [
                            Padding(
                              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                              child: ClipOval(
                                child: Image.asset(
                                  'assets/person.jpg',
                                  fit: BoxFit.fill,
                                  height: 60,
                                  width: 60,
                                ),
                              ),
                            ),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Text(
                                  'General Physician\nWha Telemedicine',
                                  style: GoogleFonts.openSans(
                                    color: backgroundColor,
                                    fontWeight: FontWeight.normal,
                                    fontSize: 10,
                                  ),
                                ),
                              ],
                            ),
                          ],
                        ),
                  const Spacer(),
                  BuildAppointmentCancelButton(appointment: appointment),
                ],
              ),
            ),
            const Divider(color: backgroundColor, height: 0.3),
            BuildAppointmentStatusSlot(appointment: appointment),
          ],
        ),
      ),
    );
  }
}
