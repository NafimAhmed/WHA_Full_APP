import 'dart:convert';
import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/data/provider/provider.dart';
import 'package:wha/app/data/service/service.dart';
import 'package:wha/app/routes/app_pages.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:wha/app/utils/strings.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'dart:math' as math;
import 'package:image_picker/image_picker.dart';

class FAddPatientDetailsController extends GetxController{
  int doctorId = Get.arguments as int? ?? 0;
  int concernId = int.parse(Get.parameters['concernId'].toString());
  int slotId = int.parse(Get.parameters['slotId'].toString());
  String phone = Get.parameters['phone'].toString();
  final int otp = int.parse(Get.parameters['otp'].toString());

  final TextEditingController addressValueController = TextEditingController();

  final _name = ''.obs;
  final _address = ''.obs;
  final _formOpacity = 1.0.obs;
  final _error = ''.obs;
  final _showImageDialog = false.obs;
  final _image = Image.asset('assets/person.jpg').obs;
  final _strImage = ''.obs;
  final _signUpButtonColor = MaterialStateProperty.all(Colors.grey).obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final AppState appState = Get.find<AppState>();
  final SignupPatientService signupService = Get.find<SignupPatientService>();
  final PatientProvider patientProvider = Get.find<PatientProvider>();
  get name => _name.value;

  get address => _address.value;

  get formOpacity => _formOpacity.value;

  get error => _error.value;

  get showImageDialog => _showImageDialog.value;

  get image => _image.value;

  get strImage => _strImage.value;

  get signUpButtonColor => _signUpButtonColor.value;

  set name(value) => _name.value = value;

  set address(value) => _address.value = value;

  set formOpacity(value) => _formOpacity.value = value;

  set error(value) => _error.value = value;

  set showImageDialog(value) => _showImageDialog.value = value;

  set image(value) => _image.value = value;

  set strImage(value) => _strImage.value = value;

  set signUpButtonColor(value) => _signUpButtonColor.value = value;

  final picker = ImagePicker();

  getImage() => showImageDialog = true;

  Future getImageFromCamera() async {
    Uint8List? imageFile;
    final XFile? pickedFile =
    await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imageFile = await pickedFile.readAsBytes();
      strImage = base64Encode(imageFile);

      if (kIsWeb) {
        image = Image.network(pickedFile.path);
      } else {
        image = Image.file(File(pickedFile.path));
      }
      Fluttertoast.showToast(
        msg: "Image Added",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        fontSize: 16.0,
      );
    }
  }

  Future getImageFromGallery() async {
    Uint8List? imageFile;
    final XFile? pickedFile =
    await picker.pickImage(source: ImageSource.gallery);
    if (pickedFile != null) {
      imageFile = await pickedFile.readAsBytes();
      strImage = base64Encode(imageFile);
      if (kIsWeb) {
        image = Image.network(pickedFile.path);
      } else {
        image = Image.file(File(pickedFile.path));
      }
      Fluttertoast.showToast(
        msg: "Image Added",
        toastLength: Toast.LENGTH_SHORT,
        gravity: ToastGravity.BOTTOM,
        timeInSecForIosWeb: 3,
        fontSize: 16.0,
      );
    }
  }

  void refreshSignupButtonColor() {
    if (name != '' &&
        address != '') {
      signUpButtonColor = MaterialStateProperty.all(primaryColor);
    } else {
      signUpButtonColor = MaterialStateProperty.all(Colors.grey);
    }
  }

  void submitSignUpForm() async {
    bool isValid = formKey.currentState!.validate();
    if (isValid) {
      log('signup data: name: $name address: $address password: otp: $otp phone: $phone');
      formOpacity = 0.5;
      int password = 100000;
      password += math.Random.secure().nextInt(1000000 - password);
      bool feedback = await signupService.registerPatient(
          name: name,
          image: strImage,
          address: address,
          phone: phone,
          otp: otp,
          password: password.toString());
      if (feedback) {
        PatientWithNamePhone? patientWithNamePhone = await patientProvider.getPatientWithNamePhone(phone: phone);
        if(patientWithNamePhone != null){
          image = Image.asset('assets/person.jpg');
          strImage = '';
          signUpButtonColor = MaterialStateProperty.all(Colors.grey);
          addressValueController.text = '';
          formKey.currentState!.reset();
          formOpacity = 1.0;
          Get.toNamed(Routes.F_APPOINTMENT_VITAL_SIGN, arguments: patientWithNamePhone, parameters: <String, String>{
            'doctorId': doctorId.toString(),
            'concernId': concernId.toString(),
            'slotId': slotId.toString(),
            'phone': phone,
            'otp': otp.toString(),
          });
        }else{
          error = 'Patient data error!\nPlease try again later.';
          formOpacity = 0.6;
        }
      } else {
        error = 'adding patient failed! \nPlease try again later.';
        formOpacity = 0.6;
      }
    }
  }

  getAddress() async {
    Prediction? p = await PlacesAutocomplete.show(
      context: Get.context!,
      strictbounds: false,
      radius: 100000,
      types: [],
      apiKey: kGoogleApiKey,
      mode: Mode.overlay,
      language: "en",
      components: [],
      onError: (PlacesAutocompleteResponse response) {
        log(response.toJson().toString());
      },
      logo: const SizedBox.shrink(),
    );
    GoogleMapsPlaces _places = GoogleMapsPlaces(apiKey: kGoogleApiKey);
    PlacesDetailsResponse detail =
    await _places.getDetailsByPlaceId(p!.placeId ?? '0');

    String city = '';
    String division = '';
    String district = '';
    String upazilla = '';

    for (var element in detail.result.addressComponents) {
      String areaName = element.types[0];
      String areaValue = element.longName;
      if (areaName == 'locality') {
        city = areaValue;
      } else if (areaName == 'sublocality_level_1') {
        upazilla = areaValue;
      } else if (areaName == 'administrative_area_level_2') {
        district = areaValue;
      } else if (areaName == 'administrative_area_level_1') {
        division = areaValue;
      }
      addressValueController.text = '$city, $upazilla, $district, $division';
      address =  '$city, $upazilla, $district, $division';
    }
  }
}
