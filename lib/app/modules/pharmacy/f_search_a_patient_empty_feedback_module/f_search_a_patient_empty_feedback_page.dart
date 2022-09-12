import 'package:wha/app/modules/pharmacy/f_search_a_patient_empty_feedback_module/widgets/widgets.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/pharmacy/f_search_a_patient_empty_feedback_module/f_search_a_patient_empty_feedback_controller.dart';

class FSearchAPatientEmptyFeedbackPage
    extends GetView<FSearchAPatientEmptyFeedbackController> {
  const FSearchAPatientEmptyFeedbackPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
          child: PhysicalModel(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            elevation: 30,
            child: Stack(
              children: [
                const BuildTopBar(),
                Obx(() {
                  return Opacity(
                    opacity: controller.isLoading ? 0.5 : 1.0,
                    child: Column(
                      children: [
                        const SizedBox(height: 30),
                        const BuildNotFoundMessage(),
                        BuildAddPatientButton(isLoading: controller.isLoading),
                      ],
                    ),
                  );
                }),
                Obx(() {
                  return controller.isLoading
                      ? const Positioned(
                          child: Center(
                            child: SpinKitCircle(
                              color: primaryColor,
                              size: 60,
                            ),
                          ),
                        )
                      : const SizedBox.shrink();
                }),
                Obx(() {
                  return !controller.isLoading && controller.error != ''
                      ? AlertDialog(
                          elevation: 20.0,
                          title: Row(
                            mainAxisAlignment: MainAxisAlignment.start,
                            children: const [
                              Image(
                                image: AssetImage(
                                  'assets/icon.png',
                                ),
                                height: 30,
                                width: 30,
                              ),
                              SizedBox(width: 5),
                              Text(
                                'Wha',
                                style: TextStyle(
                                  color: Colors.black,
                                  fontWeight: FontWeight.bold,
                                ),
                              )
                            ],
                          ),
                          content: Text(controller.error),
                          actions: <Widget>[
                            TextButton(
                                child: const Text(
                                  'Close',
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {
                                  controller.error = '';
                                }),
                          ],
                        )
                      : const SizedBox.shrink();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
