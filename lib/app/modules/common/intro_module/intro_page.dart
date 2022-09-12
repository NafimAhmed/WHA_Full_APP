import 'package:flutter/services.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'intro_controller.dart';

class IntroPage extends GetView<IntroController> {
  const IntroPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: backgroundColor,
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarColor: primaryColor,
        systemNavigationBarDividerColor: primaryColor,
        systemStatusBarContrastEnforced: false,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual, overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Obx(() {
          return Stack(
            alignment: Alignment.topCenter,
            children: [
              Padding(
                padding: EdgeInsets.fromLTRB(25, 105, 25, (size.height * 0.12)),
                child: Swiper(
                  loop: false,
                  itemCount: 5,
                  index: controller.currentIndex,
                  autoplay: true,
                  onIndexChanged: (int index) {
                    controller.currentIndex = index;
                  },
                  itemBuilder: (BuildContext context, int index) =>
                  controller.sliders[index],
                  viewportFraction: 1,
                  controller: controller.swiperController,
                  pagination: SwiperPagination.dots,
                  autoplayDisableOnInteraction: true,
                ),
              ),
              Positioned(
                top: 0.0,
                child: Container(
                  color: backgroundColor,
                  width: size.width,
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Image.asset(
                            'assets/logo.png',
                            height: 40,
                          ),
                        ],
                      ),
                      const SizedBox(height: 5),
                      Padding(
                        padding: const EdgeInsets.fromLTRB(25, 10, 0, 10),
                        child: Obx(() {
                          return Text(
                            controller.sliderTitles[controller.currentIndex],
                            style: const TextStyle(
                              fontSize: 18,
                            ),
                          );
                        }),
                      ),
                    ],
                  ),
                ),
              ),
              Positioned(
                bottom: 0.0,
                child: Container(
                  width: size.width,
                  height: size.height * 0.12,
                  color: primaryColor,
                  child: Center(
                    child: SizedBox(
                      height: size.height * 0.05,
                      width: size.width * 0.6,
                      child: RaisedButton(
                        color: Colors.white,
                        onPressed: () => controller.nextHandler(),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Obx(() {
                              return Text(
                                  controller.currentIndex == 4 ? 'Next' : 'Skip'
                              );
                            }),
                            const Icon(
                              Icons.arrow_forward,
                              semanticLabel: 'Skip',
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
        }),
      ),
    );
  }
}
