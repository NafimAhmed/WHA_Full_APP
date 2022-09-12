import 'package:wha/app/modules/pharmacy/f_search_a_patient_empty_feedback_module/f_search_a_patient_empty_feedback_controller.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildAddPatientButton extends StatelessWidget {
  BuildAddPatientButton({Key? key, required this.isLoading}) : super(key: key);
  final bool isLoading;

  final FSearchAPatientEmptyFeedbackController controller =
      Get.find<FSearchAPatientEmptyFeedbackController>();

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height / 3,
      child: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            InkWell(
              onTap: () => isLoading ? null : controller.sendOtp(),
              child: AvatarGlow(
                endRadius: 50,
                duration: const Duration(seconds: 1),
                repeat: true,
                showTwoGlows: true,
                repeatPauseDuration: const Duration(milliseconds: 100),
                animate: true,
                glowColor: primaryColor,
                child: PhysicalModel(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(50),
                  child: const Icon(
                    Icons.add,
                    size: 60,
                    color: backgroundColor,
                  ),
                ),
              ),
            ),
            const SizedBox(height: 5),
            const Text(
              'Add Patient',
              style: TextStyle(
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
