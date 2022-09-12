import 'dart:developer';

import 'package:wha/app/modules/pharmacy/f_home_module/widgets/build_f_home_service_button.dart';
import 'package:wha/app/routes/app_pages.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FHomeOurServices extends StatelessWidget {
  const FHomeOurServices({Key? key}) : super(key: key);

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
                  BuildFHomeServiceButton(image: 'assets/icon.png', title: 'Get\nAppointment', onTap: (){
                    Get.toNamed(Routes.F_CHOOSE_HEALTH_CONCERN);
                  }),

                  BuildFHomeServiceButton(image: 'assets/icon.png', title: 'All\nAppointments', onTap: (){
                    Get.toNamed(Routes.F_ALL_APPOINTMENTS);
                  }),

                  BuildFHomeServiceButton(image: 'assets/icon.png', title: 'Prescriptions', onTap: (){
                    Get.toNamed(Routes.F_ALL_PRESCRIPTION);
                  }),
                  BuildFHomeServiceButton(image: 'assets/icon.png', title: 'Test Report', onTap: (){
                    log('service A button clicked');
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
