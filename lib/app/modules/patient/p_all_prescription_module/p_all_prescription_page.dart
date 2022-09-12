import 'package:get/get.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/modules/patient/p_all_prescription_module/p_all_prescription_controller.dart';
import 'package:wha/app/modules/patient/p_all_prescription_module/widgets/widgets.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';

class PAllPrescriptionPage extends GetView<PAllPrescriptionController> {
  const PAllPrescriptionPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.updatePrescriptions();
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: RefreshIndicator(
          onRefresh: () async => controller.refreshPrescriptions(),
          color: primaryColor,
          displacement: 100,
          edgeOffset: 51,
          strokeWidth: 2,
          child: Stack(
            children: [
              Obx(() {
                return controller.isLoading
                    ? Positioned(
                    child: Container(
                        color: backgroundColor,
                        child: const Center(
                            child: SpinKitCircle(color: primaryColor))))
                    : BuildPrescriptions(
                    prescriptions:
                    controller.prescriptions as List<Prescription>);
              }),
              const BuildTopBar(),
              Obx(() {
                return Visibility(
                  visible: controller.showSavedMessage,
                  child: AlertDialog(
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
                    content: const Text('Prescription saved.'),
                    actions: <Widget>[
                      TextButton(
                          child: const Text(
                            'Open',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            controller.openPrescription();
                            controller.showSavedMessage = false;
                          }),
                      const SizedBox(width: 20),
                      TextButton(
                          child: const Text(
                            'Close',
                            style: TextStyle(color: Colors.black),
                          ),
                          onPressed: () {
                            controller.showSavedMessage = false;
                          }),
                    ],
                  ),
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
