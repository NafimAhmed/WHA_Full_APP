import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BuildNotFoundMessage extends StatelessWidget {
  const BuildNotFoundMessage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Column(
      children: [
        SizedBox(
          height: size.height / 3,
          child: const Center(
            child: Text(
              'Not Found!',
              style: TextStyle(
                color: primaryColor,
                fontSize: 28,
              ),
            ),
          ),
        ),
        const Text(
          'This patient is not registered\nin our system. Please add to continue.',
          style: TextStyle(

          ),
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
