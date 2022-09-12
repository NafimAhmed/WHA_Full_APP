import 'package:wha/app/modules/pharmacy/f_home_module/widgets/f_home_our_services.dart';
import 'package:wha/app/modules/pharmacy/f_home_module/widgets/widgets.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/pharmacy/f_home_module/f_home_controller.dart';

class FHomePage extends GetView<FHomeController> {
   const FHomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              FHomeTopBar(name: '${controller.pharmacy.firstName} ${controller.pharmacy.lastName}'),
              const FHomeOurServices(),
              const SizedBox(height: 60),
            ],
          ),
        ),
      ),
    );
  }
}
