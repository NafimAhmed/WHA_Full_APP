import 'package:flutter/services.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/pharmacy/f_sign_up_module/f_sign_up_controller.dart';

class FSignUpPage extends GetView<FSignUpController> {
  const FSignUpPage({Key? key}) : super(key: key);


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
    Size size = MediaQuery.of(context).size;

    return Scaffold(
      backgroundColor: backgroundColor,
      resizeToAvoidBottomInset: false,
      body: ListView(
        shrinkWrap: true,
        physics: const BouncingScrollPhysics(),
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Image(
                image: AssetImage(
                  'assets/logo.png',
                ),
                height: 30,
              ),
            ],
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Stack(
                    alignment: Alignment.bottomRight,
                    children: [
                      CircleAvatar(
                        radius: 60,
                        backgroundColor: Colors.grey,
                        child: ClipOval(
                          child: SizedBox(
                            width: 150.0,
                            height: 150.0,
                            child: controller.image,
                          ),
                        ),
                      ),
                      PhysicalModel(
                        color: backgroundColor,
                        borderRadius: BorderRadius.circular(50),
                        elevation: 1,
                        child: const Padding(
                          padding: EdgeInsets.all(8.0),
                          child: Icon(
                            Icons.camera_alt,
                            size: 30,
                            color: secondaryColor,
                          ),
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 15),
                  SizedBox(
                    height: 33,
                    width: 130,
                    child: TextButton(
                      onPressed: () {},
                      child: Text(
                        'Upload Image',
                        style: TextStyle(color: Colors.grey.shade500),
                      ),
                      style: ButtonStyle(
                        backgroundColor:
                        MaterialStateProperty.all(Colors.grey.shade100),
                        elevation: MaterialStateProperty.all(0),
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
          const SizedBox(height: 50),
          Form(
            child: Padding(
              padding: const EdgeInsets.fromLTRB(15, 0, 15, 0),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Pharmacy name',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      cursorColor: primaryColor,
                      keyboardType: TextInputType.name,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 2.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 2.0),
                        ),
                        hintText: 'patient name',
                        enabled: controller.formOpacity == 1 ? true : false,
                        focusColor: primaryColor,
                      ),
                      onSaved: (String? value) {
                        controller.name = value ?? '';
                        controller.refreshSignupButtonColor();
                      },
                      onChanged: (String? value) {
                        controller.name = value ?? '';
                        controller.refreshSignupButtonColor();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'name is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    'Address',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      cursorColor: primaryColor,
                      keyboardType: TextInputType.name,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 2.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 2.0),
                        ),
                        hintText: 'address',
                        enabled: controller.formOpacity == 1 ? true : false,
                        focusColor: primaryColor,
                      ),
                      onSaved: (String? value) {
                        controller.name = value ?? '';
                        controller.refreshSignupButtonColor();
                      },
                      onChanged: (String? value) {
                        controller.name = value ?? '';
                        controller.refreshSignupButtonColor();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'address is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    'Password',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      cursorColor: primaryColor,
                      keyboardType: TextInputType.name,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 2.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 2.0),
                        ),
                        hintText: 'password',
                        enabled: controller.formOpacity == 1 ? true : false,
                        focusColor: primaryColor,
                      ),
                      onSaved: (String? value) {
                        controller.name = value ?? '';
                        controller.refreshSignupButtonColor();
                      },
                      onChanged: (String? value) {
                        controller.name = value ?? '';
                        controller.refreshSignupButtonColor();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'password is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  const Text(
                    'Confirm Password',
                    style: TextStyle(
                      fontSize: 18,
                    ),
                  ),
                  const SizedBox(height: 12),
                  SizedBox(
                    height: 50,
                    child: TextFormField(
                      cursorColor: primaryColor,
                      keyboardType: TextInputType.name,
                      textAlignVertical: TextAlignVertical.bottom,
                      decoration: InputDecoration(
                        border: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 2.0),
                        ),
                        enabledBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 1.0),
                        ),
                        focusedBorder: const OutlineInputBorder(
                          borderSide: BorderSide(color: primaryColor, width: 2.0),
                        ),
                        hintText: 'confirm password',
                        enabled: controller.formOpacity == 1 ? true : false,
                        focusColor: primaryColor,
                      ),
                      onSaved: (String? value) {
                        controller.name = value ?? '';
                        controller.refreshSignupButtonColor();
                      },
                      onChanged: (String? value) {
                        controller.name = value ?? '';
                        controller.refreshSignupButtonColor();
                      },
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'password is required';
                        }
                        return null;
                      },
                    ),
                  ),
                  const SizedBox(height: 20),

                  SizedBox(
                    width: size.width,
                    child: ElevatedButton(
                      onPressed: (){},
                      child: const Text(
                        'SIGN UP',
                      ),
                      style: ButtonStyle(
                        backgroundColor: MaterialStateProperty.all(primaryColor),
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

