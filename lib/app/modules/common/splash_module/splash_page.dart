import 'package:flutter/services.dart';
import 'package:wha/app/modules/common/splash_module/splash_controller.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';


class SplashPage extends GetView<SplashController> {
  const SplashPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    controller.checkNavigate();
    SystemChrome.setSystemUIOverlayStyle(
        const SystemUiOverlayStyle(statusBarColor: backgroundColor));
    return Scaffold(
      resizeToAvoidBottomInset: false,
      backgroundColor: backgroundColor,
      body: Stack(
        children: [
          Container(
            color: backgroundColor,
            width: MediaQuery.of(context).size.width,
            child: Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: const [
                  Image(
                    height: 200.0,
                    width: 200.0,
                    image: AssetImage(
                      'assets/logo.png',
                    ),
                  ),
                  SpinKitThreeBounce(
                    color: primaryColor,
                  ),
                ],
              ),
            ),
          ),
          Positioned(
            bottom: 20.0,
            child: SizedBox(
              width: MediaQuery.of(context).size.width,
              child: Column(
                children: [
                  Text(
                    'Developed & Maintained By',
                    style: GoogleFonts.openSans(
                      fontSize: 10,
                      color: primaryColor,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 15),
                  Center(
                    child: Image.asset(
                      'assets/tri_logo.png',
                      height: 50,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
