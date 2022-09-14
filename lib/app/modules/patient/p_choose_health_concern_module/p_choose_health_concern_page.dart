import 'package:wha/app/modules/patient/p_choose_health_concern_module/widgets/widgets.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'p_choose_health_concern_controller.dart';

class PChooseHealthConcernPage extends GetView<PChooseHealthConcernController> {
  const PChooseHealthConcernPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.updateConcerns();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
          child: PhysicalModel(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20),
                topRight: Radius.circular(20)
            ),
            elevation: 30,
            child: Column(
              children: [
                const BuildTopBar(),
                const BuildTitle(),
                Obx(() {
                  return SingleChildScrollView(
                    child: (controller.concerns as List).isNotEmpty
                        ? Column(
                            children: [
                              BuildConcernList(concerns: controller.concerns)
                            ],
                          )
                        : const BuildConcernsLoading(),
                  );
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
