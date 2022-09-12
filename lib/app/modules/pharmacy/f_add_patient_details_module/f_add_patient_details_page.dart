import 'package:wha/app/modules/pharmacy/f_add_patient_details_module/f_add_patient_details_controller.dart';
import 'package:wha/app/modules/pharmacy/f_add_patient_details_module/widgets/widgets.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class FAddPatientDetailsPage extends GetView<FAddPatientDetailsController> {
  const FAddPatientDetailsPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.fromLTRB(0, 3, 0, 0),
          child: PhysicalModel(
            color: backgroundColor,
            borderRadius: const BorderRadius.only(
                topLeft: Radius.circular(20), topRight: Radius.circular(20)),
            elevation: 30,
            child: Stack(
              children: [
                SafeArea(
                  child: SingleChildScrollView(
                    physics: const BouncingScrollPhysics(),
                    child: Column(
                      children: [
                        SizedBox(
                          child: Center(
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.center,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                const BuildTopBar(),
                                const SizedBox(height: 50),
                                Padding(
                                  padding: const EdgeInsets.only(left: 20),
                                  child: Row(
                                    mainAxisAlignment: MainAxisAlignment.center,
                                    crossAxisAlignment: CrossAxisAlignment.end,
                                    children: [
                                      Obx(() {
                                        return InkWell(
                                          onTap: controller.formOpacity == 1.0
                                              ? () {
                                                  controller.getImage();
                                                }
                                              : null,
                                          child: Align(
                                            alignment: Alignment.center,
                                            child: CircleAvatar(
                                              radius: 70,
                                              backgroundColor: Colors.grey,
                                              child: ClipOval(
                                                child: SizedBox(
                                                  width: 180.0,
                                                  height: 180.0,
                                                  child: controller.image,
                                                ),
                                              ),
                                            ),
                                          ),
                                        );
                                      }),
                                      Obx(() {
                                        return InkWell(
                                          onTap: controller.formOpacity == 1.0
                                              ? () {
                                                  controller.getImage();
                                                }
                                              : null,
                                          child: const Icon(
                                            Icons.camera_alt_rounded,
                                            color: primaryColor,
                                            size: 20,
                                          ),
                                        );
                                      }),
                                    ],
                                  ),
                                ),
                                const SizedBox(height: 8),
                                const Text('profile picture   '),
                                const SizedBox(height: 15),
                              ],
                            ),
                          ),
                        ),
                        Obx(() {
                          return Opacity(
                            opacity: double.parse('${controller.formOpacity}'),
                            child: Form(
                              key: controller.formKey,
                              child: SingleChildScrollView(
                                child: Column(
                                  children: [
                                    // name
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: TextFormField(
                                        cursorColor: primaryColor,
                                        keyboardType: TextInputType.name,
                                        decoration: InputDecoration(
                                          border: const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: primaryColor,
                                                width: 2.0),
                                          ),
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: primaryColor,
                                                width: 1.0),
                                          ),
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: primaryColor,
                                                width: 2.0),
                                          ),
                                          hintText: 'name',
                                          enabled: controller.formOpacity == 1
                                              ? true
                                              : false,
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
                                    const SizedBox(height: 15),
                                    // address
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      child: TextFormField(
                                        controller:
                                            controller.addressValueController,
                                        cursorColor: primaryColor,
                                        keyboardType: TextInputType.text,
                                        decoration: InputDecoration(
                                          border: const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: primaryColor,
                                                width: 2.0),
                                          ),
                                          enabledBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: primaryColor,
                                                width: 1.0),
                                          ),
                                          focusedBorder:
                                              const UnderlineInputBorder(
                                            borderSide: BorderSide(
                                                color: primaryColor,
                                                width: 2.0),
                                          ),
                                          hintText: 'address',
                                          enabled: controller.formOpacity == 1
                                              ? true
                                              : false,
                                          focusColor: primaryColor,
                                          suffixIcon: IconButton(
                                            onPressed: () async {
                                              controller.getAddress();
                                            },
                                            icon: const Icon(
                                              Icons.search,
                                              color: primaryColor,
                                            ),
                                          ),
                                        ),
                                        onSaved: (String? value) {
                                          controller.address = value ?? '';
                                          controller.refreshSignupButtonColor();
                                        },
                                        onChanged: (String? value) {
                                          controller.address = value ?? '';
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
                                    const SizedBox(height: 25),
                                    // add patient button
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width *
                                          0.8,
                                      height: 40,
                                      child: ElevatedButton(
                                        style: ButtonStyle(
                                          backgroundColor:
                                              controller.signUpButtonColor,
                                        ),
                                        onPressed: controller.formOpacity == 1.0
                                            ? () {
                                                controller.submitSignUpForm();
                                              }
                                            : null,
                                        child: Text('Add Patient',
                                            style: GoogleFonts.openSans(
                                                color: backgroundColor,
                                                fontSize: 18)),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          );
                        }),
                        const SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                Obx(() {
                  return Positioned(
                    child: controller.formOpacity == 0.5
                        ? const Center(
                            child: SpinKitCircle(
                              color: primaryColor,
                              size: 50,
                            ),
                          )
                        : const SizedBox(height: 0, width: 0),
                  );
                }),
                Obx(() {
                  return Positioned(
                    top: size.height / 4,
                    child: controller.formOpacity == 0.6
                        ? AlertDialog(
                            elevation: 20.0,
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
                            content: Text(controller.error),
                            actions: <Widget>[
                              TextButton(
                                  child: const Text(
                                    'Close',
                                    style: TextStyle(color: Colors.black),
                                  ),
                                  onPressed: () {
                                    controller.formOpacity = 1.0;
                                  }),
                            ],
                          )
                        : const SizedBox(height: 0, width: 0),
                  );
                }),
                Positioned(
                  child: Obx(() {
                    return controller.showImageDialog == false
                        ? const SizedBox.shrink()
                        : AlertDialog(
                            elevation: 10.0,
                            content: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.showImageDialog = false;
                                        controller.getImageFromCamera();
                                      },
                                      child: const Icon(
                                        Icons.add_a_photo,
                                        color: primaryColor,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        controller.showImageDialog = false;
                                        controller.getImageFromCamera();
                                      },
                                      child: const Text(
                                        'Camera',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                                Row(
                                  mainAxisAlignment: MainAxisAlignment.start,
                                  crossAxisAlignment: CrossAxisAlignment.center,
                                  children: [
                                    InkWell(
                                      onTap: () {
                                        controller.showImageDialog = false;
                                        controller.getImageFromGallery();
                                      },
                                      child: const Icon(
                                        Icons.add_photo_alternate_rounded,
                                        color: primaryColor,
                                      ),
                                    ),
                                    TextButton(
                                      onPressed: () {
                                        controller.showImageDialog = false;
                                        controller.getImageFromGallery();
                                      },
                                      child: const Text(
                                        'Gallery',
                                        style: TextStyle(
                                          color: Colors.black,
                                          fontWeight: FontWeight.bold,
                                          fontSize: 14,
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ],
                            ),
                            actions: <Widget>[
                              TextButton(
                                child: const Text(
                                  'Cancel',
                                  style: TextStyle(color: Colors.black),
                                ),
                                onPressed: () {
                                  controller.showImageDialog = false;
                                },
                              ),
                            ],
                          );
                  }),
                ),
                Column(),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
