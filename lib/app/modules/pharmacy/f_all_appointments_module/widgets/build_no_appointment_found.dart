import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BuildNoAppointmentFound extends StatelessWidget {
  const BuildNoAppointmentFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: const Center(
        child: Text(
          'No appointment\nfound!',
          style: TextStyle(
            fontSize: 18,
            color: primaryColor,
          ),
          softWrap: true,
          textAlign: TextAlign.center,
        ),
      ),
    );
  }
}
