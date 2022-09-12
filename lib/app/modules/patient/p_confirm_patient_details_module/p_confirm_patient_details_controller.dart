import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/data/service/service.dart';
import 'package:wha/app/modules/patient/p_current_appointments_module/p_current_appointments_controller.dart';
import 'package:wha/app/routes/app_pages.dart';
import 'package:get/get.dart';

class PConfirmPatientDetailsController extends GetxController {
  final doctorId = Get.arguments ?? 0;
  final concernId = int.parse(Get.parameters['concernId'] ?? '0');
  final slotId = int.parse(Get.parameters['slotId'] ?? '0');

  final _isLoading = false.obs;
  final _isOtherPatient = false.obs;

  final DateTime appointmentTime = DateTime.now();
  final String purposeOfVisit = 'Consultation';
  final AppState appState = Get.find<AppState>();
  final Patient patient = Get.find<AppState>().user as Patient;
  final AppointmentService appointmentService = Get.find<AppointmentService>();
  final PCurrentAppointmentsController pCurrentAppointmentsController = Get.find<PCurrentAppointmentsController>();

  get isLoading => _isLoading.value;

  get isOtherPatient => _isOtherPatient.value;

  set isLoading(value) => _isLoading.value = value;

  set isOtherPatient(value) => _isOtherPatient.value = value;

  submitAppointment() async {
    isLoading = true;
    bool isSucceed = await appointmentService.submitAppointment(
        patientId: patient.id,
        concernId: concernId,
        doctorId: doctorId,
        pharmacyId: 0,
        slotId: slotId
    );
    isLoading = false;
    pCurrentAppointmentsController.updateCurrentAppointments();
    Get.toNamed(Routes.P_APPOINTMENT_SUBMIT_FEEDBACK, arguments: isSucceed);
  }
}
