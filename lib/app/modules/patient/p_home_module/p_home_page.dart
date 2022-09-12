import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p_home_module/p_home_controller.dart';
import 'package:wha/app/modules/patient/p_home_module/widgets/widgets.dart';
import 'package:wha/app/modules/patient/p_home_our_services_module/p_home_our_services_page.dart';

class PHomePage extends GetView<PHomeController> {
  PHomePage({Key? key}) : super(key: key);

  final AppState appState = Get.find<AppState>();

  @override
  Widget build(BuildContext context) {
    Patient? patient = appState.user as Patient;

    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              PHomeTopBar(Pname: '${patient.firstName} ${patient.lastName}'),
              // const PCurrentAppointmentsPage(),
              const PHomeOurServicesPage(),
              // const PCurrentMedicationPage(),
              // const PCurrentPrescriptionPage(),
              // const PVisitedDoctorsPage(),

              // our services
              // const PHomeOurDoctorsPage(),
              // const PHomeOurPharmacyPage(),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
