import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class BuildAppointmentDateTime extends StatelessWidget {
  const BuildAppointmentDateTime({Key? key, required this.dateTime}) : super(key: key);
  final DateTime dateTime;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(15, 5, 15, 10),
      child: PhysicalModel(
        color: backgroundColor,
        elevation: 1.0,
        child: SizedBox(
          height: 90,
          width: size.width - 30,
          child: Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Date & Time',
                  style: GoogleFonts.openSans(
                    color: Colors.black,
                    fontWeight: FontWeight.bold,
                    fontSize: 16,
                  ),
                ),
                const SizedBox(height: 5),
                Row(
                  children: [
                    Text(
                      '${getDayName(dateTime.weekday)},',
                      style: GoogleFonts.openSans(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(width: 5),
                    Text(
                      DateFormat('hh:mm a').format(dateTime),
                      style: const TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                  ],
                ),
                Text(
                  '${dateTime.day}, ${getMonthName(dateTime.month)} ${dateTime.year}',
                  style: GoogleFonts.openSans(
                    color: primaryColor,
                  ),
                ),
                const SizedBox(height: 5),
              ],
            ),
          ),
        ),
      ),
    );
  }
  getMonthName(int monthId){
    switch (monthId){
      case 1:
        return 'January';
      case 2:
        return 'February';
      case 3:
        return 'March';
      case 4:
        return 'April';
      case 5:
        return 'May';
      case 6:
        return 'June';
      case 7:
        return 'July';
      case 8:
        return 'August';
      case 9:
        return 'September';
      case 10:
        return 'October';
      case 11:
        return 'November';
      case 12:
        return 'December';
      default:
        return getMonthName(DateTime.now().month);
    }
  }
  getDayName(int dayId){
    switch(dayId){
      case 6:
        return 'Saturday';
      case 7:
        return 'Sunday';
      case 1:
        return 'Monday';
      case 2:
        return 'Tuesday';
      case 3:
        return 'Wednesday';
      case 4:
        return 'Thursday';
      case 5:
        return 'Friday';
      default:
        return getDayName(DateTime.now().weekday);
    }
  }
  getAmPm(int hour){
    if(hour > 11){
      return 'PM';
    }else{
      return 'AM';
    }
  }
}
