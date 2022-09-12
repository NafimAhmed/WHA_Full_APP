import 'package:flutter/material.dart';
import 'package:wha/app/modules/patient/p_appointment_vital_sign_module/widgets/build_next_button.dart';

class BuildEmptyQuestions extends StatelessWidget {
  const BuildEmptyQuestions({Key? key, required this.buttonText}) : super(key: key);
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          const Text(
            'No question found'
          ),
          BuildNextButton(buttonText: buttonText)
        ],
      ),
    );
  }
}
