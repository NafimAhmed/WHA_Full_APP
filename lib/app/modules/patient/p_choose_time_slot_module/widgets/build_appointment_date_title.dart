import 'package:wha/app/data/model/model.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BuildAppointmentDateTitle extends StatelessWidget {
  const BuildAppointmentDateTitle({Key? key, required this.appointmentTime}) : super(key: key);
  final AppointmentTime appointmentTime;

  @override
  Widget build(BuildContext context) {
    bool isToday = false;
    bool isTomorrow = false;
    if (appointmentTime.date.year == DateTime.now().year &&
        appointmentTime.date.month == DateTime.now().month &&
        appointmentTime.date.day == DateTime.now().day) {
      isToday = true;
    }
    if (appointmentTime.date.year == DateTime.now().year &&
        appointmentTime.date.month == DateTime.now().month &&
        appointmentTime.date.day == DateTime.now().day + 1) {
      isTomorrow = true;
    }

    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 0, 15, 25),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 8, 0, 2),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  isToday
                      ? 'Today'
                      : isTomorrow
                      ? 'Tomorrow'
                      : DateFormat('EEEE').format(appointmentTime.date),
                  style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 22,
                  ),
                )
              ],
            ),
          ),
          const Divider(color: Colors.grey),
        ],
      ),
    );
  }
}
