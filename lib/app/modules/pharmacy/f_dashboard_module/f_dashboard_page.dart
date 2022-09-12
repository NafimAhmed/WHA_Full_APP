import 'package:wha/app/routes/app_pages.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:avatar_glow/avatar_glow.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/pharmacy/f_dashboard_module/f_dashboard_controller.dart';

class FDashboardPage extends GetView<FDashboardController> {
  const FDashboardPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.updateConcerns();
    controller.updateHotlines();
    controller.updateVitalSignQuestions();
    Size size = MediaQuery.of(context).size;
    return WillPopScope(
      onWillPop: () async {
        final value = await showDialog<bool>(
            context: context,
            builder: (context) {
              return AlertDialog(
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
                content: const Text('Are you sure you want to exit?'),
                actions: <Widget>[
                  TextButton(
                    child: const Text(
                      'No',
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(false);
                    },
                  ),
                  const SizedBox(width: 20),
                  TextButton(
                    child: const Text(
                      'Yes, exit',
                      style: TextStyle(
                          color: Colors.black
                      ),
                    ),
                    onPressed: () {
                      Navigator.of(context).pop(true);
                    },
                  ),
                ],
              );
            });
        return value == true;
      },
      child: Scaffold(
        body: Swiper(
          itemCount: 4,
          itemBuilder: (BuildContext context, int index) {
            return controller.sites[index];
          },
          physics: const NeverScrollableScrollPhysics(),
          pagination: SwiperCustomPagination(
              builder: (BuildContext context, SwiperPluginConfig? config) {
                return Stack(
                  alignment: Alignment.bottomCenter,
                  children: [
                    Positioned(
                      bottom: 0.0,
                      child: Container(
                        height: 55,
                        width: size.width,
                        color: backgroundColor,
                      ),
                    ),
                    Positioned(
                      child: SizedBox(
                        width: size.width,
                        height: 70,
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceAround,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: [
                            buildButton(Icons.home_filled, 0, config!),
                            buildButton(Icons.person, 1, config),
                            InkWell(
                              onTap: () {
                                Get.toNamed(Routes.F_CHOOSE_HEALTH_CONCERN);
                              },
                              child: AvatarGlow(
                                glowColor: primaryColor,
                                endRadius: 40.0,
                                duration: const Duration(milliseconds: 1000),
                                repeat: true,
                                showTwoGlows: true,
                                repeatPauseDuration:
                                const Duration(milliseconds: 50),
                                animate: true,
                                child: PhysicalModel(
                                  color: backgroundColor,
                                  borderRadius: BorderRadius.circular(50),
                                  elevation: 10,
                                  child: const Icon(
                                    Icons.add_circle,
                                    color: primaryColor,
                                    size: 55,
                                  ),
                                ),
                              ),
                            ),
                            buildButton(Icons.message, 2, config),
                            buildButton(Icons.settings, 3, config),
                          ],
                        ),
                      ),
                      bottom: 0,
                    ),
                  ],
                );
              }),
        ),
      ),
    );
  }

  buildButton(IconData iconData, int index, SwiperPluginConfig config) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        IconButton(
          onPressed: () {
            config.controller.move(index, animation: true);
          },
          icon: Icon(
            iconData,
            size: index == config.activeIndex ? 33 : 24,
            color: index == config.activeIndex
                ? primaryColor
                : Colors.grey,
          ),
        ),
      ],
    );
  }
}
