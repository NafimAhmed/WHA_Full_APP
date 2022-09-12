import 'package:flutter/material.dart';

class BuildNoPrescriptionFound extends StatelessWidget {
  const BuildNoPrescriptionFound({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height,
      width: size.width,
      child: SingleChildScrollView(
        physics: const AlwaysScrollableScrollPhysics(),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            SizedBox(height: size.height/2),
            const Center(
              child: Text(
                'No Prescriptions found',
                style: TextStyle(
                  color: Colors.black,
                  fontSize: 18
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ),
          ]
        ),
      ),
    );
  }
}
