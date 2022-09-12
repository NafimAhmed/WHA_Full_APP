import 'dart:developer';
import 'dart:io';
import 'dart:typed_data';

import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/model/concern.dart';
import 'package:wha/app/data/service/signup.organization.service.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:flutter_google_places/flutter_google_places.dart';
import 'package:google_maps_webservice/places.dart';
import 'package:image_picker/image_picker.dart';

class OSignUpController extends GetxController{
  final int otp = 0;
  final String phone = Get.parameters['phone'] ?? '';
  final picker = ImagePicker();
  final String kGoogleApiKey = 'AIzaSyCDqEUD0Z_QAYPkrK7yPFsAlA3ChXZ1dQg';
  final TextEditingController addressValueController = TextEditingController();

  final _name = ''.obs;
  final _address = ''.obs;
  final _email = ''.obs;
  final _password = ''.obs;
  final _confirmPassword = ''.obs;
  final _isPasswordObscureText = true.obs;
  final _isConfirmPasswordObscureText = true.obs;
  final _formOpacity = 1.0.obs;
  final _error = ''.obs;
  final _showImageDialog = false.obs;
  final _image = Image.asset('assets/person.jpg').obs;
  final _signUpButtonColor = MaterialStateProperty.all(Colors.grey).obs;

  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  final SignupOrganizationService signupService = Get.find<SignupOrganizationService>();

  get name => _name.value;

  get address => _address.value;

  get email => _email.value;

  get password => _password.value;

  get confirmPassword => _confirmPassword.value;

  get isPasswordObscureText => _isPasswordObscureText.value;

  get isConfirmPasswordObscureText => _isConfirmPasswordObscureText.value;

  get formOpacity => _formOpacity.value;

  get error => _error.value;

  get showImageDialog => _showImageDialog.value;

  get image => _image.value;

  get signUpButtonColor => _signUpButtonColor.value;

  set name(value) => _name.value = value;

  set address(value) => _address.value = value;

  set email(value) => _email.value = value;

  set password(value) => _password.value = value;

  set confirmPassword(value) => _confirmPassword.value = value;

  set isPasswordObscureText(value) => _isPasswordObscureText.value = value;

  set isConfirmPasswordObscureText(value) =>
      _isConfirmPasswordObscureText.value = value;

  set formOpacity(value) => _formOpacity.value = value;

  set error(value) => _error.value = value;

  set showImageDialog(value) => _showImageDialog.value = value;

  set image(value) => _image.value = value;

  set signUpButtonColor(value) => _signUpButtonColor.value = value;

  getImage() => showImageDialog = true;

  Future getImageFromCamera() async {
    Uint8List? imageFile;
    final XFile? pickedFile =
    await picker.pickImage(source: ImageSource.camera);
    if (pickedFile != null) {
      imageFile = await pickedFile.readAsBytes();
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
    if (name != '' && password != '' && confirmPassword != '') {
      signUpButtonColor = MaterialStateProperty.all(primaryColor);
    } else {
      signUpButtonColor = MaterialStateProperty.all(Colors.grey);
    }
  }

  void submitSignUpForm() async {
    bool isValid = formKey.currentState!.validate();
    if (isValid) {
      log('signup data: name: $name password: $password confirmPassword: $confirmPassword otp: $otp phone: $phone');
      formOpacity = 0.5;
      Future.delayed(const Duration(seconds: 3), () async {
        formOpacity = 1.0;
        // bool feedback = await signupService.signupPatient(name: name, phone: phone, password: password, otp: otp);
        bool feedback = false;
        if (feedback) {
          // redirect to dashboard
        } else {
          error = 'Something went wrong.';
          formOpacity = 0.6;
        }
      });
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
    }
  }

}
