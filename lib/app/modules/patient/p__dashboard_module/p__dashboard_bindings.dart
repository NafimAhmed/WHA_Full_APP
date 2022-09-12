import 'package:wha/app/data/provider/provider.dart';
import 'package:wha/app/data/service/service.dart';
import 'package:get/get.dart';
import 'package:wha/app/modules/patient/p__dashboard_module/p__dashboard_controller.dart';
import 'package:wha/app/modules/patient/p_current_appointments_module/p_current_appointments_controller.dart';
import 'package:wha/app/modules/patient/p_current_medication_module/p_current_medication_controller.dart';
import 'package:wha/app/modules/patient/p_current_prescription_module/p_current_prescription_controller.dart';
import 'package:wha/app/modules/patient/p_current_test_reports_module/p_current_test_reports_controller.dart';
import 'package:wha/app/modules/patient/p_current_vital_signs_module/p_current_vital_signs_controller.dart';
import 'package:wha/app/modules/patient/p_home_module/p_home_controller.dart';
import 'package:wha/app/modules/patient/p_home_our_doctors_module/p_home_our_doctors_controller.dart';
import 'package:wha/app/modules/patient/p_home_our_pharmacy_module/p_home_our_pharmacy_controller.dart';
import 'package:wha/app/modules/patient/p_home_our_services_module/p_home_our_services_controller.dart';
import 'package:wha/app/modules/patient/p_profile_module/p_profile_controller.dart';
import 'package:wha/app/modules/patient/p_settings_language_module/p_settings_language_controller.dart';
import 'package:wha/app/modules/patient/p_settings_module/p_settings_controller.dart';
import 'package:wha/app/modules/patient/p_settings_notifications_module/p_settings_notifications_controller.dart';
import 'package:wha/app/modules/patient/p_visit_history_module/p_visit_history_controller.dart';
import 'package:wha/app/modules/patient/p_visited_doctors_module/p_visited_doctors_controller.dart';

class PDashboardBinding implements Bindings {
  @override
  void dependencies() {
    Get.lazyPut(() => PDashboardController());
    // home
    Get.lazyPut(() => PHomeController());
    Get.lazyPut(() => PCurrentMedicationController());
    Get.lazyPut(() => PCurrentAppointmentsController());
    Get.lazyPut(() => PVisitedDoctorsController());
    Get.lazyPut(() => PCurrentPrescriptionController());
    Get.lazyPut(() => PHomeOurServicesController());
    Get.lazyPut(() => PHomeOurDoctorsController());
    Get.lazyPut(() => PHomeOurPharmacyController());

    Get.lazyPut(() => CurrentMedicationProvider());
    Get.lazyPut(() => CurrentAppointmentProvider());
    Get.lazyPut(() => VisitedDoctorsProvider());
    Get.lazyPut(() => CurrentPrescriptionProvider());
    Get.lazyPut(() => DoctorProvider());
    Get.lazyPut(() => PharmacyProvider());

    // profile
    Get.lazyPut(() => PProfileController());
    Get.lazyPut(() => PVisitHistoryController());
    Get.lazyPut(() => PCurrentTestReportsController());
    Get.lazyPut(() => PCurrentVitalSignsController());

    Get.lazyPut(() => CurrentVisitHistoryProvider());
    Get.lazyPut(() => CurrentTestReportProvider());
    Get.lazyPut(() => CurrentVitalSignProvider());

    // settings
    Get.lazyPut(() => PSettingsController());
    Get.lazyPut(() => PSettingsLanguageController());
    Get.lazyPut(() => PSettingsNotificationsController());

    // chat

    // general
    Get.lazyPut(() => HotlineService());
    Get.lazyPut(() => ConcernProvider());

    // vital sign
    Get.lazyPut(() => VitalSignQuestionProvider());
  }
}