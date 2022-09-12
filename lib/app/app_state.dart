import 'package:wha/app/data/model/concern.dart';
import 'package:wha/app/data/model/hotline.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/data/model/patient.dart';
import 'package:wha/app/data/model/user.dart';
import 'package:get/get.dart';
import 'package:get/get_rx/src/rx_types/rx_types.dart';

class AppState extends GetxController {
  final _accessToken = ''.obs;
  final _user = (Patient(
      id: 0,
      organizationId: 0,
      uniqueId: 0,
      roleId: 0,
      firstName: '',
      lastName: '',
      phone: '',
      email: '',
      address: '',
      profession: '',
      country: '',
      city: '',
      district: '',
      postcode: '',
      gender: '',
      image: '') as User).obs;
  final RxList<Hotline> _hotlines = <Hotline>[].obs;
  final RxList<Concern> _concerns = <Concern>[].obs;
  // final RxList<Appointment> _appointments = <Appointment>[].obs;
  final RxList<VitalSignQuestion> _vitalSignQuestions = <VitalSignQuestion>[].obs;


  get user => _user.value;
  get accessToken => _accessToken.value;
  get hotlines => _hotlines.value;
  get concerns => _concerns.value;
  // get appointments => _appointments.value;
  get vitalSignQuestions => _vitalSignQuestions.value;

  set accessToken(value) => _accessToken.value = value;
  set user(value) => _user.value = value;
  set hotlines(value) => _hotlines.value = value;
  set concerns(value) => _concerns.value = value;
  // set appointments(value) => _appointments.value = value;
  set vitalSignQuestions(value) => _vitalSignQuestions.value = value;
}
