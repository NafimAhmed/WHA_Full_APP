import 'dart:developer';

import 'package:wha/app/P_Doctor_List.dart';
import 'package:wha/app/modules/patient/P_History.dart';
import 'package:wha/app/modules/patient/P_Vital_Sign_Detail.dart';
import 'package:wha/app/modules/patient/p_home_our_services_module/p_home_our_services_controller.dart';
import 'package:wha/app/modules/patient/p_home_our_services_module/widgets/build_service.dart';
import 'package:wha/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../P_All_Package.dart';
import '../P_All_Report.dart';
import '../P_Nearest_Triage.dart';
import '../P_Prescribtion_DashBoard.dart';

class PHomeOurServicesPage extends GetView<PHomeOurServicesController> {
  const PHomeOurServicesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const SizedBox(height: 10),
        Padding(
          padding: const EdgeInsets.fromLTRB(15, 15, 15, 0),
          child: CustomScrollView(
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            slivers: [
              SliverGrid.count(
                crossAxisCount: 2,
                crossAxisSpacing: 15,
                mainAxisSpacing: 15,
                childAspectRatio: 1,
                children: [
                  BuildService(
                      image: 'assets/Appointment.jpg',
                      title: 'Get\nAppointment',
                      onTap: () {
                        Get.toNamed(Routes.P_CHOOSE_HEALTH_CONCERN);
                      }),

                  BuildService(
                      image: 'assets/doctor.jpg',
                      title: 'Doctors',
                      onTap: () {

                        //P_Doctor_List

                      //    Navigator.push(
                      // context,
                      // MaterialPageRoute(
                      //     builder: (context) =>
                      //     P_Doctor_List()));

                        Get.toNamed(Routes.F_CHOOSE_HEALTH_CONCERN);
                      }),


                  BuildService(
                      image: 'assets/vital_sign.jpg',
                      title: 'Vital Sign & BMI',
                      onTap: () {

                        //P_Vital_Sign_Detail
                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    P_Vital_Sign_Detail()
                            )
                        );


                        //Get.toNamed(Routes.P_CHOOSE_HEALTH_CONCERN);
                      }),


                  BuildService(
                      image: 'assets/icon.png',
                      title: 'All\nAppointments',
                      onTap: () {
                        Get.toNamed(Routes.P_ALL_APPOINTMENTS);
                      }),
                  BuildService(
                      image: 'assets/prescription.jpg',
                      title: 'Prescriptions',
                      onTap: () {

                        //P_Prescription_DashBoard

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    P_Prescription_DashBoard()
                            )
                        );




                        //Get.toNamed(Routes.P_ALL_PRESCRIPTION);
                      }),
                  BuildService(
                      image: 'assets/history.jpg',
                      title: 'History',
                      onTap: () {

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    P_History()
                            )
                        );


                        //Get.toNamed(Routes.P_HOME_OUR_PHARMACY);
                        //Get.toN amed(Routes.P_HOME_OUR_PHARMACY);
                      }),


                  BuildService(
                      image: 'assets/fontisto_prescription.jpg',
                      title: 'Report',
                      onTap: () {

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    P_All_Report()
                            )
                        );




                        // Get.toNamed(Routes.P_HOME_OUR_PHARMACY);
                        //Get.toNamed(Routes.P_HOME_OUR_PHARMACY);P_All_Report
                      }),

                  BuildService(
                      image: 'assets/package.jpg',
                      title: 'Package',
                      onTap: () {


                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    P_All_Package()
                            )
                        );



                        //P_All_Package
                        // Get.toNamed(Routes.P_HOME_OUR_PHARMACY);
                        //Get.toNamed(Routes.P_HOME_OUR_PHARMACY);
                      }),







                  BuildService(
                      image: 'assets/nearest_pharmacy.jpg',
                      title: 'Pharmacies',
                      onTap: () {
                        Get.toNamed(Routes.P_HOME_OUR_PHARMACY);
                        //Get.toNamed(Routes.P_HOME_OUR_PHARMACY);
                      }),

                  BuildService(
                      image: 'assets/nearest_doctor.jpg',
                      title: 'Nearest Doctor',
                      onTap: () {

                        // Navigator.push(
                        //     context,
                        //     MaterialPageRoute(
                        //         builder: (context) =>
                        //             P_All_Package()
                        //     )
                        // );



                        Get.toNamed(Routes.F_CHOOSE_HEALTH_CONCERN);
                        //Get.toNamed(Routes.P_HOME_OUR_PHARMACY);
                        //Get.toNamed(Routes.P_HOME_OUR_PHARMACY);
                      }),


                  BuildService(
                      image: 'assets/nearest_Triage.jpg',
                      title: 'Nearest Triage\nPoint',
                      onTap: () {

                        Navigator.push(
                            context,
                            MaterialPageRoute(
                                builder: (context) =>
                                    P_Nearest_Triage()
                            )
                        );



                        //Get.toNamed(Routes.P_HOME_OUR_PHARMACY);
                        //Get.toNamed(Routes.P_HOME_OUR_PHARMACY);
                      }),




                ],
              ),
              const SliverToBoxAdapter(child: SizedBox(height: 11)),
            ],
          ),
        ),
      ],
    );
  }
}
