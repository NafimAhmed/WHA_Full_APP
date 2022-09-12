import 'package:wha/app/modules/pharmacy/f_search_a_patient_module/widgets/widgets.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:country_code_picker/country_code_picker.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/pharmacy/f_search_a_patient_module/f_search_a_patient_controller.dart';

class FSearchAPatientPage extends GetView<FSearchAPatientController> {
  const FSearchAPatientPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Scaffold(
      backgroundColor: Colors.black,
      resizeToAvoidBottomInset: false,
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
                const BuildTopBar(),
                Obx(() {
                  if (controller.opacity == 0.6) {
                    return SizedBox(
                      height: 300,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          SpinKitCircle(
                            color: primaryColor,
                            size: 70,
                          ),
                          SizedBox(height: 10),
                          Text('searching...\nplease wait'),
                        ],
                      )),
                    );
                  } else {
                    return SizedBox(
                      height: 300,
                      child: Center(
                          child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: const [
                          Icon(
                            Icons.search,
                            color: primaryColor,
                            size: 70,
                          ),
                          SizedBox(height: 10),
                          Text('Search patient'),
                        ],
                      )),
                    );
                  }
                }),
                Obx(() {
                  return Opacity(
                    opacity: double.parse(controller.opacity.toString()),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        const Text(
                          "Please select a country code and\nEnter patient's phone number",
                          style: TextStyle(
                            fontSize: 15,
                          ),
                          softWrap: true,
                          textAlign: TextAlign.center,
                        ),
                        const SizedBox(height: 35),
                        // input row
                        Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // country code picker
                            SizedBox(
                              width: 115,
                              child: CountryCodePicker(
                                onChanged: (CountryCode countryCode) {
                                  controller.countryCode =
                                      countryCode.toString();
                                },
                                initialSelection: 'BD',
                                favorite: const [
                                  '+880',
                                  '+91',
                                  'United Kingdom'
                                ],
                                showCountryOnly: true,
                                showOnlyCountryWhenClosed: false,
                                alignLeft: false,
                                padding: const EdgeInsets.all(0.0),
                                enabled:
                                    controller.opacity == 1.0 ? true : false,
                                showFlagDialog: true,
                                showFlag: true,
                                flagWidth: 35,
                                showDropDownButton: false,
                                closeIcon: const Icon(
                                  Icons.close,
                                  color: primaryColor,
                                ),
                              ),
                            ),
                            const SizedBox(width: 5),
                            // phone number input field
                            SizedBox(
                              width: (size.width - 120) * 0.9,
                              child: Form(
                                key: controller.formKey,
                                child: TextFormField(
                                  cursorColor: primaryColor,
                                  inputFormatters: [
                                    FilteringTextInputFormatter.digitsOnly
                                  ],
                                  keyboardType: TextInputType.phone,
                                  decoration: const InputDecoration(
                                    border: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: primaryColor, width: 2.0),
                                    ),
                                    enabledBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: primaryColor, width: 1.0),
                                    ),
                                    focusedBorder: UnderlineInputBorder(
                                      borderSide: BorderSide(
                                          color: primaryColor, width: 2.0),
                                    ),
                                    hintText: 'phone',
                                    enabled: true,
                                    focusColor: primaryColor,
                                  ),
                                  enabled:
                                      controller.opacity == 1.0 ? true : false,
                                  onSaved: (String? value) {
                                    controller.phone = value ?? '';
                                  },
                                  onChanged: (String? value) {
                                    controller.phone = value ?? '';
                                    controller.validate();
                                  },
                                  validator: (value) {
                                    if (value == null || value.isEmpty) {
                                      return 'phone is required';
                                    }
                                    return null;
                                  },
                                ),
                              ),
                            ),
                          ],
                        ),
                        const SizedBox(height: 30),
                        // search button
                        SizedBox(
                          height: 45,
                          width: (size.width - 120) * 0.9 + 120,
                          child: ElevatedButton(
                            onPressed: controller.opacity == 1.0
                                ? () {
                                    controller.submit();
                                  }
                                : null,
                            style: ButtonStyle(
                              elevation: MaterialStateProperty.all(0.3),
                              backgroundColor:
                                  MaterialStateProperty.all(primaryColor),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: const [
                                Icon(
                                  Icons.search,
                                  color: backgroundColor,
                                ),
                                Text(
                                  'Search',
                                  style: TextStyle(
                                      fontSize: 15, color: backgroundColor),
                                  softWrap: true,
                                  textAlign: TextAlign.center,
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                  );
                }),
                Obx(() {
                  return controller.opacity == 0.8
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
                                  controller.opacity = 1.0;
                                }),
                          ],
                        )
                      : const SizedBox.shrink();
                }),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
