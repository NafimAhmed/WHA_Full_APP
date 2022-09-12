import 'package:get/get.dart';
import 'package:wha/app/modules/common/intro_module/intro_bindings.dart';
import 'package:wha/app/modules/common/intro_module/intro_page.dart';
import 'package:wha/app/modules/common/splash_module/splash_bindings.dart';
import 'package:wha/app/modules/common/splash_module/splash_page.dart';
import 'package:wha/app/modules/nurse/n_sign_up_module/n_sign_up_bindings.dart';
import 'package:wha/app/modules/nurse/n_sign_up_module/n_sign_up_page.dart';
import 'package:wha/app/modules/organization/o_chat_module/o_chat_bindings.dart';
import 'package:wha/app/modules/organization/o_chat_module/o_chat_page.dart';
import 'package:wha/app/modules/organization/o_dashboard_module/o_dashboard_bindings.dart';
import 'package:wha/app/modules/organization/o_dashboard_module/o_dashboard_page.dart';
import 'package:wha/app/modules/organization/o_home_module/o_home_bindings.dart';
import 'package:wha/app/modules/organization/o_home_module/o_home_page.dart';
import 'package:wha/app/modules/organization/o_profile_module/o_profile_bindings.dart';
import 'package:wha/app/modules/organization/o_profile_module/o_profile_page.dart';
import 'package:wha/app/modules/organization/o_settings_module/o_settings_bindings.dart';
import 'package:wha/app/modules/organization/o_settings_module/o_settings_page.dart';
import 'package:wha/app/modules/organization/o_sign_up_module/o_sign_up_bindings.dart';
import 'package:wha/app/modules/organization/o_sign_up_module/o_sign_up_page.dart';
import 'package:wha/app/modules/patient/p__dashboard_module/p__dashboard_bindings.dart';
import 'package:wha/app/modules/patient/p__dashboard_module/p__dashboard_page.dart';
import 'package:wha/app/modules/patient/p_all_appointments_module/p_all_appointments_bindings.dart';
import 'package:wha/app/modules/patient/p_all_appointments_module/p_all_appointments_page.dart';
import 'package:wha/app/modules/patient/p_all_prescription_module/p_all_prescription_bindings.dart';
import 'package:wha/app/modules/patient/p_all_prescription_module/p_all_prescription_page.dart';
import 'package:wha/app/modules/patient/p_appointment_submit_feedback_module/p_appointment_submit_feedback_bindings.dart';
import 'package:wha/app/modules/patient/p_appointment_submit_feedback_module/p_appointment_submit_feedback_page.dart';
import 'package:wha/app/modules/patient/p_appointment_vital_sign_module/p_appointment_vital_sign_bindings.dart';
import 'package:wha/app/modules/patient/p_appointment_vital_sign_module/p_appointment_vital_sign_page.dart';
import 'package:wha/app/modules/patient/p_chat_module/p_chat_bindings.dart';
import 'package:wha/app/modules/patient/p_chat_module/p_chat_page.dart';
import 'package:wha/app/modules/patient/p_choose_a_doctor_module/p_choose_a_doctor_bindings.dart';
import 'package:wha/app/modules/patient/p_choose_a_doctor_module/p_choose_a_doctor_page.dart';
import 'package:wha/app/modules/patient/p_choose_health_concern_module/p_choose_health_concern_bindings.dart';
import 'package:wha/app/modules/patient/p_choose_health_concern_module/p_choose_health_concern_page.dart';
import 'package:wha/app/modules/patient/p_choose_time_slot_module/p_choose_time_slot_bindings.dart';
import 'package:wha/app/modules/patient/p_choose_time_slot_module/p_choose_time_slot_page.dart';
import 'package:wha/app/modules/patient/p_confirm_patient_details_module/p_confirm_patient_details_bindings.dart';
import 'package:wha/app/modules/patient/p_confirm_patient_details_module/p_confirm_patient_details_page.dart';
import 'package:wha/app/modules/patient/p_current_appointments_module/p_current_appointments_bindings.dart';
import 'package:wha/app/modules/patient/p_current_appointments_module/p_current_appointments_page.dart';
import 'package:wha/app/modules/patient/p_current_medication_module/p_current_medication_bindings.dart';
import 'package:wha/app/modules/patient/p_current_medication_module/p_current_medication_page.dart';
import 'package:wha/app/modules/patient/p_current_prescription_module/p_current_prescription_bindings.dart';
import 'package:wha/app/modules/patient/p_current_prescription_module/p_current_prescription_page.dart';
import 'package:wha/app/modules/patient/p_current_test_reports_module/p_current_test_reports_bindings.dart';
import 'package:wha/app/modules/patient/p_current_test_reports_module/p_current_test_reports_page.dart';
import 'package:wha/app/modules/patient/p_current_vital_signs_module/p_current_vital_signs_bindings.dart';
import 'package:wha/app/modules/patient/p_current_vital_signs_module/p_current_vital_signs_page.dart';
import 'package:wha/app/modules/patient/p_home_module/p_home_bindings.dart';
import 'package:wha/app/modules/patient/p_home_module/p_home_page.dart';
import 'package:wha/app/modules/patient/p_home_our_doctors_module/p_home_our_doctors_bindings.dart';
import 'package:wha/app/modules/patient/p_home_our_doctors_module/p_home_our_doctors_page.dart';
import 'package:wha/app/modules/patient/p_home_our_pharmacy_module/p_home_our_pharmacy_bindings.dart';
import 'package:wha/app/modules/patient/p_home_our_pharmacy_module/p_home_our_pharmacy_page.dart';
import 'package:wha/app/modules/patient/p_home_our_services_module/p_home_our_services_bindings.dart';
import 'package:wha/app/modules/patient/p_home_our_services_module/p_home_our_services_page.dart';
import 'package:wha/app/modules/patient/p_profile_module/p_profile_bindings.dart';
import 'package:wha/app/modules/patient/p_profile_module/p_profile_page.dart';
import 'package:wha/app/modules/patient/p_settings_language_module/p_settings_language_bindings.dart';
import 'package:wha/app/modules/patient/p_settings_language_module/p_settings_language_page.dart';
import 'package:wha/app/modules/patient/p_settings_module/p_settings_bindings.dart';
import 'package:wha/app/modules/patient/p_settings_module/p_settings_page.dart';
import 'package:wha/app/modules/patient/p_settings_notifications_module/p_settings_notifications_bindings.dart';
import 'package:wha/app/modules/patient/p_settings_notifications_module/p_settings_notifications_page.dart';
import 'package:wha/app/modules/patient/p_sign_up_module/p_sign_up_bindings.dart';
import 'package:wha/app/modules/patient/p_sign_up_module/p_sign_up_page.dart';
import 'package:wha/app/modules/patient/p_visit_history_module/p_visit_history_bindings.dart';
import 'package:wha/app/modules/patient/p_visit_history_module/p_visit_history_page.dart';
import 'package:wha/app/modules/patient/p_visited_doctors_module/p_visited_doctors_bindings.dart';
import 'package:wha/app/modules/patient/p_visited_doctors_module/p_visited_doctors_page.dart';
import 'package:wha/app/modules/pharmacy/f_add_patient_details_module/f_add_patient_details_bindings.dart';
import 'package:wha/app/modules/pharmacy/f_add_patient_details_module/f_add_patient_details_page.dart';
import 'package:wha/app/modules/pharmacy/f_all_appointments_module/f_all_appointments_bindings.dart';
import 'package:wha/app/modules/pharmacy/f_all_appointments_module/f_all_appointments_page.dart';
import 'package:wha/app/modules/pharmacy/f_all_prescription_module/f_all_prescription_bindings.dart';
import 'package:wha/app/modules/pharmacy/f_all_prescription_module/f_all_prescription_page.dart';
import 'package:wha/app/modules/pharmacy/f_appointment_submit_feedback_module/f_appointment_submit_feedback_bindings.dart';
import 'package:wha/app/modules/pharmacy/f_appointment_submit_feedback_module/f_appointment_submit_feedback_page.dart';
import 'package:wha/app/modules/pharmacy/f_appointment_vital_sign_module/f_appointment_vital_sign_bindings.dart';
import 'package:wha/app/modules/pharmacy/f_appointment_vital_sign_module/f_appointment_vital_sign_page.dart';
import 'package:wha/app/modules/pharmacy/f_chat_module/f_chat_bindings.dart';
import 'package:wha/app/modules/pharmacy/f_chat_module/f_chat_page.dart';
import 'package:wha/app/modules/pharmacy/f_choose_a_doctor_module/f_choose_a_doctor_bindings.dart';
import 'package:wha/app/modules/pharmacy/f_choose_a_doctor_module/f_choose_a_doctor_page.dart';
import 'package:wha/app/modules/pharmacy/f_choose_health_concern_module/f_choose_health_concern_bindings.dart';
import 'package:wha/app/modules/pharmacy/f_choose_health_concern_module/f_choose_health_concern_page.dart';
import 'package:wha/app/modules/pharmacy/f_choose_time_slot_module/f_choose_time_slot_bindings.dart';
import 'package:wha/app/modules/pharmacy/f_choose_time_slot_module/f_choose_time_slot_page.dart';
import 'package:wha/app/modules/pharmacy/f_confirm_patient_details_module/f_confirm_patient_details_bindings.dart';
import 'package:wha/app/modules/pharmacy/f_confirm_patient_details_module/f_confirm_patient_details_page.dart';
import 'package:wha/app/modules/pharmacy/f_dashboard_module/f_dashboard_bindings.dart';
import 'package:wha/app/modules/pharmacy/f_dashboard_module/f_dashboard_page.dart';
import 'package:wha/app/modules/pharmacy/f_home_module/f_home_bindings.dart';
import 'package:wha/app/modules/pharmacy/f_home_module/f_home_page.dart';
import 'package:wha/app/modules/pharmacy/f_profile_module/f_profile_bindings.dart';
import 'package:wha/app/modules/pharmacy/f_profile_module/f_profile_page.dart';
import 'package:wha/app/modules/pharmacy/f_search_a_patient_empty_feedback_module/f_search_a_patient_empty_feedback_bindings.dart';
import 'package:wha/app/modules/pharmacy/f_search_a_patient_empty_feedback_module/f_search_a_patient_empty_feedback_page.dart';
import 'package:wha/app/modules/pharmacy/f_search_a_patient_module/f_search_a_patient_bindings.dart';
import 'package:wha/app/modules/pharmacy/f_search_a_patient_module/f_search_a_patient_page.dart';
import 'package:wha/app/modules/pharmacy/f_settings_module/f_settings_bindings.dart';
import 'package:wha/app/modules/pharmacy/f_settings_module/f_settings_page.dart';
import 'package:wha/app/modules/pharmacy/f_sign_up_module/f_sign_up_bindings.dart';
import 'package:wha/app/modules/pharmacy/f_sign_up_module/f_sign_up_page.dart';
import 'package:wha/app/modules/pharmacy/f_verify_patient_otp_module/f_verify_patient_otp_bindings.dart';
import 'package:wha/app/modules/pharmacy/f_verify_patient_otp_module/f_verify_patient_otp_page.dart';
import 'package:wha/app/modules/user_management/confirm_phone_module/confirm_phone_bindings.dart';
import 'package:wha/app/modules/user_management/confirm_phone_module/confirm_phone_page.dart';
import 'package:wha/app/modules/user_management/forgot_password_module/forgot_password_bindings.dart';
import 'package:wha/app/modules/user_management/forgot_password_module/forgot_password_page.dart';
import 'package:wha/app/modules/user_management/login_module/login_bindings.dart';
import 'package:wha/app/modules/user_management/login_module/login_page.dart';
import 'package:wha/app/modules/user_management/signup_select_role_module/signup_select_role_bindings.dart';
import 'package:wha/app/modules/user_management/signup_select_role_module/signup_select_role_page.dart';
import 'package:wha/app/modules/user_management/verify_otp_module/verify_otp_bindings.dart';
import 'package:wha/app/modules/user_management/verify_otp_module/verify_otp_page.dart';
part './app_routes.dart';

abstract class AppPages {
  static final pages = [
    GetPage(
      name: Routes.SPLASH,
      page: () => const SplashPage(),
      binding: SplashBinding(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 100),
    ),
    GetPage(
      name: Routes.INTRO,
      page: () => const IntroPage(),
      binding: IntroBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.P_DASHBOARD,
      page: () => PDashboardPage(),
      binding: PDashboardBinding(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.P_HOME,
      page: () => PHomePage(),
      binding: PHomeBinding(),
    ),
    GetPage(
      name: Routes.P_CURRENT_MEDICATION,
      page: () => const PCurrentMedicationPage(),
      binding: PCurrentMedicationBinding(),
    ),
    GetPage(
      name: Routes.P_CURRENT_APPOINTMENTS,
      page: () => const PCurrentAppointmentsPage(),
      binding: PCurrentAppointmentsBinding(),
    ),
    GetPage(
      name: Routes.P_VISITED_DOCTORS,
      page: () => const PVisitedDoctorsPage(),
      binding: PVisitedDoctorsBinding(),
    ),
    GetPage(
      name: Routes.P_CURRENT_PRESCRIPTION,
      page: () => const PCurrentPrescriptionPage(),
      binding: PCurrentPrescriptionBinding(),
    ),
    GetPage(
      name: Routes.P_SETTINGS,
      page: () =>  PSettingsPage(),
      binding: PSettingsBinding(),
    ),
    GetPage(
      name: Routes.P_SETTINGS_LANGUAGE,
      page: () => PSettingsLanguagePage(),
      binding: PSettingsLanguageBinding(),
    ),
    GetPage(
      name: Routes.P_SETTINGS_NOTIFICATIONS,
      page: () => const PSettingsNotificationsPage(),
      binding: PSettingsNotificationsBinding(),
    ),
    GetPage(
      name: Routes.P_PROFILE,
      page: () => PProfilePage(),
      binding: PProfileBinding(),
    ),
    GetPage(
      name: Routes.P_VISIT_HISTORY,
      page: () => const PVisitHistoryPage(),
      binding: PVisitHistoryBinding(),
    ),
    GetPage(
      name: Routes.P_HOME_OUR_DOCTORS,
      page: () => const PHomeOurDoctorsPage(),
      binding: PHomeOurDoctorsBinding(),
    ),
    GetPage(
      name: Routes.P_HOME_OUR_PHARMACY,
      page: () => PHomeOurPharmacyPage(),
      binding: PHomeOurPharmacyBinding(),
    ),
    GetPage(
      name: Routes.P_HOME_OUR_SERVICES,
      page: () => const PHomeOurServicesPage(),
      binding: PHomeOurServicesBinding(),
    ),
    GetPage(
      name: Routes.P_CURRENT_TEST_REPORTS,
      page: () => const PCurrentTestReportsPage(),
      binding: PCurrentTestReportsBinding(),
    ),
    GetPage(
      name: Routes.P_CURRENT_VITAL_SIGNS,
      page: () => const PCurrentVitalSignsPage(),
      binding: PCurrentVitalSignsBinding(),
    ),
    GetPage(
      name: Routes.P_CHOOSE_HEALTH_CONCERN,
      page: () => const PChooseHealthConcernPage(),
      binding: PChooseHealthConcernBinding(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.P_CHOOSE_A_DOCTOR,
      page: () => const PChooseADoctorPage(),
      binding: PChooseADoctorBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.P_CHOOSE_TIME_SLOT,
      page: () => const PChooseTimeSlotPage(),
      binding: PChooseTimeSlotBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.P_CONFIRM_PATIENT_DETAILS,
      page: () => const PConfirmPatientDetailsPage(),
      binding: PConfirmPatientDetailsBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.P_APPOINTMENT_SUBMIT_FEEDBACK,
      page: () => const PAppointmentSubmitFeedbackPage(),
      binding: PAppointmentSubmitFeedbackBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.P_SIGN_UP,
      page: () =>  PSignUpPage(),
      binding: PSignUpBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.VERIFY_OTP,
      page: () => const VerifyOtpPage(),
      binding: VerifyOtpBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.F_SIGN_UP,
      page: () => const FSignUpPage(),
      binding: FSignUpBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.O_SIGN_UP,
      page: () => const OSignUpPage(),
      binding: OSignUpBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.F_DASHBOARD,
      page: () => const FDashboardPage(),
      binding: FDashboardBinding(),
    ),
    GetPage(
      name: Routes.O_DASHBOARD,
      page: () => const ODashboardPage(),
      binding: ODashboardBinding(),
    ),
    GetPage(
      name: Routes.F_HOME,
      page: () => const FHomePage(),
      binding: FHomeBinding(),
    ),
    GetPage(
      name: Routes.F_SETTINGS,
      page: () => const FSettingsPage(),
      binding: FSettingsBinding(),
    ),
    GetPage(
      name: Routes.F_PROFILE,
      page: () => FProfilePage(),
      binding: FProfileBinding(),
    ),
    GetPage(
      name: Routes.F_CHAT,
      page: () => const FChatPage(),
      binding: FChatBinding(),
    ),
    GetPage(
      name: Routes.P_CHAT,
      page: () => const PChatPage(),
      binding: PChatBinding(),
    ),
    GetPage(
      name: Routes.O_HOME,
      page: () => const OHomePage(),
      binding: OHomeBinding(),
    ),
    GetPage(
      name: Routes.O_CHAT,
      page: () => const OChatPage(),
      binding: OChatBinding(),
    ),
    GetPage(
      name: Routes.O_PROFILE,
      page: () => const OProfilePage(),
      binding: OProfileBinding(),
    ),
    GetPage(
      name: Routes.O_SETTINGS,
      page: () => const OSettingsPage(),
      binding: OSettingsBinding(),
    ),
    GetPage(
      name: Routes.P_ALL_APPOINTMENTS,
      page: () => const PAllAppointmentsPage(),
      binding: PAllAppointmentsBinding(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.F_CHOOSE_HEALTH_CONCERN,
      page: () => const FChooseHealthConcernPage(),
      binding: FChooseHealthConcernBinding(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.F_CHOOSE_A_DOCTOR,
      page: () => const FChooseADoctorPage(),
      binding: FChooseADoctorBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.F_CHOOSE_TIME_SLOT,
      page: () => const FChooseTimeSlotPage(),
      binding: FChooseTimeSlotBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.F_SEARCH_A_PATIENT,
      page: () => const FSearchAPatientPage(),
      binding: FSearchAPatientBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.F_SEARCH_A_PATIENT_EMPTY_FEEDBACK,
      page: () => const FSearchAPatientEmptyFeedbackPage(),
      binding: FSearchAPatientEmptyFeedbackBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.F_CONFIRM_PATIENT_DETAILS,
      page: () => const FConfirmPatientDetailsPage(),
      binding: FConfirmPatientDetailsBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.F_VERIFY_PATIENT_OTP,
      page: () => const FVerifyPatientOtpPage(),
      binding: FVerifyPatientOtpBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.F_ADD_PATIENT_DETAILS,
      page: () => const FAddPatientDetailsPage(),
      binding: FAddPatientDetailsBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.F_APPOINTMENT_SUBMIT_FEEDBACK,
      page: () => const FAppointmentSubmitFeedbackPage(),
      binding: FAppointmentSubmitFeedbackBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.F_ALL_APPOINTMENTS,
      page: () => const FAllAppointmentsPage(),
      binding: FAllAppointmentsBinding(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.P_ALL_PRESCRIPTION,
      page: () => const PAllPrescriptionPage(),
      binding: PAllPrescriptionBinding(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.P_APPOINTMENT_VITAL_SIGN,
      page: () => const PAppointmentVitalSignPage(),
      binding: PAppointmentVitalSignBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.F_APPOINTMENT_VITAL_SIGN,
      page: () => const FAppointmentVitalSignPage(),
      binding: FAppointmentVitalSignBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.F_ALL_PRESCRIPTION,
      page: () => const FAllPrescriptionPage(),
      binding: FAllPrescriptionBinding(),
      transition: Transition.zoom,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.LOGIN,
      page: () =>  LoginPage(),
      binding: LoginBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.FORGOT_PASSWORD,
      page: () => const ForgotPasswordPage(),
      binding: ForgotPasswordBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.CONFIRM_PHONE,
      page: () =>  ConfirmPhonePage(),
      binding: ConfirmPhoneBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.SIGNUP_SELECT_ROLE,
      page: () => const SignupSelectRolePage(),
      binding: SignupSelectRoleBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
    GetPage(
      name: Routes.N_SIGN_UP,
      page: () => const NSignUpPage(),
      binding: NSignUpBinding(),
      transition: Transition.rightToLeft,
      transitionDuration: const Duration(milliseconds: 300),
    ),
  ];
}
