import 'package:wha/app/data/api.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class BuildAppointmentDoctorDetails extends StatelessWidget {
  const BuildAppointmentDoctorDetails({Key? key, required this.appointment}) : super(key: key);
  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
          child: ClipOval(
            child: Image(
              image: NetworkImage(
                  '${Api.baseAPI}/${appointment.doctorForAppointment.image}'),
              errorBuilder: (context, error, stackTrace) {
                return const Image(
                  image: AssetImage(
                    'assets/person.jpg',
                  ),
                  fit: BoxFit.fill,
                  height: 60,
                  width: 60,
                );
              },
              fit: BoxFit.fill,
              height: 70,
              width: 70,
            ),
          ),
        ),
        Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              '${appointment.doctorForAppointment.firstName} ${appointment.doctorForAppointment.lastName}',
              style: GoogleFonts.openSans(
                color: backgroundColor,
                fontWeight: FontWeight.bold,
                fontSize: 18,
              ),
            ),
            Text(
              // appointment.doctorForAppointment.degrees,
              'Wha Telemedicine',
              style: GoogleFonts.openSans(
                color: backgroundColor,
                fontSize: 12,
              ),
            ),
          ],
        ),
      ],
    );
  }
}
