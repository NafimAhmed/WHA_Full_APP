import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/user_management/signup_select_role_module/signup_select_role_controller.dart';
import 'package:wha/app/theme/app_colors.dart';

class SignupSelectRolePage extends GetView<SignupSelectRoleController> {
  const SignupSelectRolePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(
      const SystemUiOverlayStyle(
        statusBarColor: Colors.transparent,
        systemNavigationBarContrastEnforced: true,
        systemNavigationBarColor: primaryColor,
        systemNavigationBarDividerColor: primaryColor,
        systemStatusBarContrastEnforced: false,
        systemNavigationBarIconBrightness: Brightness.light,
      ),
    );
    SystemChrome.setEnabledSystemUIMode(SystemUiMode.manual,
        overlays: [SystemUiOverlay.top, SystemUiOverlay.bottom]);

    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Positioned(
            top: -40.0,
            right: -40.0,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(100)),
            ),
          ),
          Positioned(
            top: 50.0,
            right: 50.0,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                  color: secondaryColor,
                  borderRadius: BorderRadius.circular(100)),
            ),
          ),
          Positioned(
            bottom: -40.0,
            left: -40.0,
            child: Container(
              height: 160,
              width: 160,
              decoration: BoxDecoration(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(100)),
            ),
          ),
          Positioned(
            bottom: 60.0,
            left: 45.0,
            child: Container(
              height: 70,
              width: 70,
              decoration: BoxDecoration(
                color: backgroundColor,
                borderRadius: BorderRadius.circular(100),
                border: Border.all(width: 3, color: secondaryColor),
              ),
              child: Center(
                child: Image.asset(
                  'assets/icon.png',
                  height: 50,
                  width: 50,
                ),
              ),
            ),
          ),
          Positioned(
            child: Center(
              child: ListView(
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.fromLTRB(20, 0, 20, 0),
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: const [
                      Text(
                        'Select your',
                        style: TextStyle(
                          fontSize: 22,
                          color: secondaryColor
                        ),
                      ),
                      SizedBox(width: 10),
                      Text(
                        'Role',
                        style: TextStyle(
                          fontSize: 28,
                          color: secondaryColor,
                          fontWeight: FontWeight.bold
                        ),
                      )
                    ],
                  ),
                  const SizedBox(height: 25),
                  SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.patientSignup();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'Patient',
                            style: TextStyle(
                              fontSize: 16,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                          ),
                        ],
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                            MaterialStateProperty.all(primaryColor),
                        elevation: MaterialStateProperty.all(1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.doctorSignup();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'Doctor',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.white70),
                        elevation: MaterialStateProperty.all(1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.pharmacySignup();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'Pharmacy',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.white70),
                        elevation: MaterialStateProperty.all(1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.nurseSignup();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'Nurse ',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.white70),
                        elevation: MaterialStateProperty.all(1),
                      ),
                    ),
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 45,
                    child: ElevatedButton(
                      onPressed: () {
                        controller.organizationSignup();
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: const [
                          Text(
                            'Organization',
                            style: TextStyle(
                              fontSize: 16,
                              color: Colors.black54,
                            ),
                          ),
                          Icon(
                            Icons.arrow_forward,
                            color: Colors.black54,
                          ),
                        ],
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.white70),
                        elevation: MaterialStateProperty.all(1),
                      ),
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
