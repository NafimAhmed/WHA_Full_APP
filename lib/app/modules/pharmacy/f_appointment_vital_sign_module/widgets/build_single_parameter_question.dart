import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/modules/pharmacy/f_appointment_vital_sign_module/f_appointment_vital_sign_controller.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BuildSingleParameterQuestion extends StatelessWidget {
  BuildSingleParameterQuestion(
      {Key? key, required this.question, required this.width})
      : super(key: key);
  final VitalSignQuestion question;
  final double width;
  final FAppointmentVitalSignController controller = Get.find<FAppointmentVitalSignController>();

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: SizedBox(
        width: width,
        child: TextFormField(
          keyboardType: const TextInputType.numberWithOptions(decimal: true),
          inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]+'))],
          decoration: InputDecoration(
              border: const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              enabledBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              focusedBorder: const OutlineInputBorder(
                borderSide: BorderSide(color: primaryColor),
              ),
              hintText: question.firstPlaceholder,
              labelText: question.question,
              labelStyle: const TextStyle(color: Colors.black),
          ),
          cursorColor: primaryColor,
          enableSuggestions: true,
          enableInteractiveSelection: true,
          onChanged: (String value){
            controller.updateFirstAnswer(question.id, value);
          },
        ),
      ),
    );
  }
}
