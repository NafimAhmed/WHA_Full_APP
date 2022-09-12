import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BuildAppointmentStatusSlot extends StatelessWidget {
  const BuildAppointmentStatusSlot({Key? key, required this.appointment}) : super(key: key);
  final Appointment appointment;

  @override
  Widget build(BuildContext context) {
    String status = 'Pending';
    if(appointment is PendingAppointment) {
      status = 'Pending';
    }else if(appointment is AcceptedWithTimeAppointment) {
      status = 'Approved';
    }else if(appointment is AcceptedWithoutTimeAppointment){
      status = 'Approved';
    }else if(appointment is CallingAppointment){
      status = 'Calling...';
    }else if(appointment is CompletedAppointment){
      status = 'Completed';
    }else if(appointment is CancelledAppointment){
      status = 'Cancelled';
    }
    return Container(
      height: 100,
      color: primaryColor,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Status: $status',
                  style: GoogleFonts.openSans(
                    color: backgroundColor,
                    fontSize: 24,
                  ),
                ),
                const SizedBox(height: 5),
                Text(
                  'Request time',
                  style: GoogleFonts.openSans(
                    color: backgroundColor,
                    fontSize: 16,
                  ),
                ),
                Text(
                  DateFormat('dd MMM yyyy, hh:mm a')
                      .format(appointment.requestTime),
                  style: GoogleFonts.openSans(
                    color: backgroundColor,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }
}
