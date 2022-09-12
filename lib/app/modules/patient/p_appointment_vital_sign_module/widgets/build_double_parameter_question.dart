import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/modules/patient/p_appointment_vital_sign_module/p_appointment_vital_sign_controller.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class BuildDoubleParameterQuestion extends StatelessWidget {
  BuildDoubleParameterQuestion({Key? key, required this.question})
      : super(key: key);
  final VitalSignQuestion question;
  final PAppointmentVitalSignController controller = Get.find<PAppointmentVitalSignController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    double width = size.width - 30;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 10, 0, 10),
      child: Row(
        children: [
          SizedBox(
            width: width / 2,
            child: TextFormField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),],
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5)),
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5)),
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topLeft: Radius.circular(5),
                        bottomLeft: Radius.circular(5)),
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  hintText:
                      question.firstPlaceholder.toUpperCase(),
                  labelText: question.question.toUpperCase() + '-' +
                      question.firstPlaceholder.toLowerCase(),
                  labelStyle: const TextStyle(color: Colors.black)),
              cursorColor: primaryColor,
              enableSuggestions: true,
              enableInteractiveSelection: true,
              onChanged: (String value){
                controller.updateFirstAnswer(question.id, value);
              },
            ),
          ),
          SizedBox(
            width: width / 2,
            child: TextFormField(
              keyboardType: const TextInputType.numberWithOptions(decimal: true),
              inputFormatters: [FilteringTextInputFormatter.allow(RegExp('[0-9.,]+')),],
              decoration: InputDecoration(
                  border: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  enabledBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  focusedBorder: const OutlineInputBorder(
                    borderRadius: BorderRadius.only(
                        topRight: Radius.circular(5),
                        bottomRight: Radius.circular(5)),
                    borderSide: BorderSide(color: primaryColor),
                  ),
                  hintText:
                      question.secondPlaceholder.toUpperCase(),
                  labelText: question.question.toUpperCase() + '-' +
                      question.secondPlaceholder.toLowerCase(),
                  labelStyle: const TextStyle(color: Colors.black)),
              cursorColor: primaryColor,
              enableSuggestions: true,
              enableInteractiveSelection: true,
              onChanged: (String value){
                controller.updateSecondAnswer(question.id, value);
              },
            ),
          ),
        ],
      ),
    );
  }
}
