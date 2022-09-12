import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/modules/patient/p_appointment_vital_sign_module/widgets/widgets.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BuildQuestions extends StatelessWidget {
  const BuildQuestions({Key? key, required this.questions, required this.buttonText}) : super(key: key);
  final List<VitalSignQuestion> questions;
  final String buttonText;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return questions.isEmpty
        ? BuildEmptyQuestions(buttonText: buttonText)
        : ListView(
            shrinkWrap: true,
            physics: const BouncingScrollPhysics(),
            children: [
              const Padding(
                padding: EdgeInsets.fromLTRB(15, 5, 0, 10),
                child: Text(
                  'Enter your Vital Signs',
                  style: TextStyle(
                    fontSize: 20,
                    fontWeight: FontWeight.bold,
                    color: primaryColor,
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
                child: Wrap(
                  direction: Axis.horizontal,
                  alignment: WrapAlignment.spaceBetween,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: questions.map((e) {
                    return e.parameter == Parameter.DOUBLE_PARAMETER
                        ? BuildDoubleParameterQuestion(question: e)
                        : BuildSingleParameterQuestion(
                            question: e,
                            width: getQuestionWidth(e, size, context));
                  }).toList(),
                ),
              ),
              BuildNextButton(buttonText: buttonText),
            ],
          );
  }

  double getQuestionWidth(
      VitalSignQuestion q, Size size, BuildContext context) {
    double fullSize = size.width - 30;
    double halfWidth = size.width / 2;

    int length = questions.length;
    int currentQuestionIndex = questions.indexOf(q);
    if ((currentQuestionIndex + 1) == length) {
      return fullSize;
    } else if ((currentQuestionIndex + 1) < length) {
      VitalSignQuestion nextQuestion = questions[currentQuestionIndex + 1];
      if (nextQuestion.parameter == Parameter.DOUBLE_PARAMETER) {
        return fullSize;
      } else if (halfWidth < getQuestionTextSizeWidth(nextQuestion, context)) {
        return fullSize;
      } else if ((halfWidth > getQuestionTextSizeWidth(nextQuestion, context) ||
              halfWidth == getQuestionTextSizeWidth(nextQuestion, context)) &&
          (halfWidth > getQuestionTextSizeWidth(q, context) ||
              halfWidth == getQuestionTextSizeWidth(q, context))) {
        return halfWidth - 20;
      } else {
        return fullSize;
      }
    } else {
      return fullSize;
    }
  }

  double getQuestionTextSizeWidth(
          VitalSignQuestion question, BuildContext context) =>
      ((TextPainter(
              text: TextSpan(
                  text: question.question + ' ?',
                  style: const TextStyle(fontSize: 20)),
              maxLines: 1,
              textScaleFactor: MediaQuery.of(context).textScaleFactor,
              textDirection: TextDirection.ltr)
            ..layout())
          .size
          .width);
}
