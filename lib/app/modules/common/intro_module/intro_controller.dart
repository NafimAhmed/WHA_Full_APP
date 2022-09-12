import 'package:flutter/material.dart';
import 'package:wha/app/modules/common/intro_module/widgets/widgets.dart';
import 'package:wha/app/routes/app_pages.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:get/get.dart';
import 'package:shared_preferences/shared_preferences.dart';

class IntroController extends GetxController {
  final _currentIndex = 0.obs;
  final SwiperController swiperController = SwiperController();

  final List<Widget> sliders = [
    const Slide(text:
    'There are many variations of passages of Lorem Ipsum available, but the majority have suffered embarrassing hidden in the middle of text.',
        gif: 'intro_a.gif'
    ),
    const Slide(text:
    'There are many variations of passages of Lorem Ipsum available, but the majority have suffered embarrassing hidden in the middle of text.',
        gif: 'intro_b.gif'
    ),
    const Slide(text:
    'There are many variations of passages of Lorem Ipsum available, but the majority have suffered embarrassing hidden in the middle of text.',
        gif: 'intro_c.gif'
    ),
    const Slide(text:
    'There are many variations of passages of Lorem Ipsum available, but the majority have suffered embarrassing hidden in the middle of text.',
        gif: 'intro_d.gif'
    ),
    const Slide(text:
    'There are many variations of passages of Lorem Ipsum available, but the majority have suffered embarrassing hidden in the middle of text.',
        gif: 'intro_e.gif'
    ),
  ];
  final List<String> sliderTitles = [
    'Welcome',
    '24/7 Support',
    'Track & Record Your Vitals',
    'Keep Prescriptions & Reports in One Place',
    'Smart Prescription System & Automated Alert'
  ];

  get currentIndex => _currentIndex.value;
  set currentIndex(value) => _currentIndex.value = value;

  void cacheShouldIntro() async {
    Get.find<SharedPreferences>().setBool('shouldIntro', false);
  }
  void navigateToLoginPage(){
    Get.offAllNamed(Routes.LOGIN);
  }
  void nextHandler(){
    if(currentIndex == 4)  navigateToLoginPage();
    swiperController.next(animation: true);
  }
}
