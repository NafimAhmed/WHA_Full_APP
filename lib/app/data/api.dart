class Api{
  static const String baseAPI = 'https://worldhealthaid.org';
  static const String otpAPI = 'http://66.45.237.70/api.php';
  static const String smsAPI = 'http://66.45.237.70/api.php';
  static const String loginAPI = '$baseAPI/api/login';
  static const String joinAPI = '$baseAPI/api/join';
  static const String profileDataAPI = '$baseAPI/api/me';
  static const String hotlines = '$baseAPI/api/hotline';
  static const String signupPatient = '$baseAPI/api/signupPatient';
  static const String signupDoctor = '$baseAPI/api/signupDoctor';
  static const String signupPharmacy = '$baseAPI/api/signupPharmacy';
  static const String signupOrganization = '$baseAPI/api/signupOrganization';
  static const String allDoctor = '$baseAPI/api/doctor/list';
  static const String allPharmacy = '$baseAPI/api/pharmacy/list';
  static const String allConcern = '$baseAPI/api/specializationList';
  static const String doctorsBySpecialistId = '$baseAPI/api/doctorsBySpecialistId';
  static const String liveAppointments = '$baseAPI/api/liveAppointments';
  static const String deadAppointments = '$baseAPI/api/deadAppointments';
  static const String callingAppointment = '$baseAPI/api/callingAppointment';

  // patient
  static const String currentMedication = '$baseAPI/api/patientMedication';
  static const String currentPrescription = '$baseAPI/api/currentPrescriptions';
  static const String visitedDoctor = '$baseAPI/api/visitedDoctors';

  static const String currentVisitHistory = '$baseAPI/api/currentVisitHistory';
  static const String currentTestReport = '$baseAPI/api/currentTestReports';

  // doctor
  static const String getDoctorById = '$baseAPI/api/doctorById';
  // pharmacy
  static const String filterByPatientPhone = '$baseAPI/api/filterByPatientPhone';

  // appointment
  static const String submitAppointment = '$baseAPI/api/submitAppointment';
  static const String doctorAppointmentSlotList = '$baseAPI/api/doctorAppointmentSlotList';
  static const String updateAppointmentObject = '$baseAPI/api/updateAppointmentObject';

  // prescription
  static const String prescriptionList = '$baseAPI/api/prescriptionList';

  // vital sign
  static const String currentVitalSigns = '$baseAPI/api/currentVitals';
  static const String vitalSignQuestions = '$baseAPI/api/getVitals';
  static const String submitVitalSignAnswer = '$baseAPI/api/submitVitals';

  // complain
  static const String currentComplains = '$baseAPI/api/currentComplains';
  static const String complainQuestions = '$baseAPI/api/getComplains';
  static const String submitComplainAnswer = '$baseAPI/api/submitComplains';
}
