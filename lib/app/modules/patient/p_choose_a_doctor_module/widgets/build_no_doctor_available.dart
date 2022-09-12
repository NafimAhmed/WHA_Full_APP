import 'package:flutter/material.dart';

class BuildNoDoctorAvailable extends StatelessWidget {
  const BuildNoDoctorAvailable({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height - 130,
      child: const Padding(
        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
        child: Center(
          child: Text(
            'No doctor available'
          ),
        ),
      ),
    );
  }
}
