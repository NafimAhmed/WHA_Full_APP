import 'dart:developer';

import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/data/provider/provider.dart';
import 'package:wha/app/data/service/service.dart';
import 'package:get/get.dart';

class PAllAppointmentsController extends GetxController {
  final AppState appState = Get.find<AppState>();
  final AppointmentProvider appointmentProvider =
      Get.find<AppointmentProvider>();
  final AppointmentService appointmentService = Get.find<AppointmentService>();

  final _isLoading = false.obs;
  final _isCancelling = false.obs;
  final _isMounted = true.obs;
  final RxList<Appointment> _liveAppointments = <Appointment>[].obs;
  final RxList<Appointment> _deadAppointments = <Appointment>[].obs;

  get isLoading => _isLoading.value;

  get isCancelling => _isCancelling.value;

  get isMounted => _isMounted.value;

  get liveAppointments => _liveAppointments.value;

  get deadAppointments => _deadAppointments.value;

  set isLoading(value) => _isLoading.value = value;

  set isCancelling(value) => _isCancelling.value = value;

  set isMounted(value) => _isMounted.value = value;

  set liveAppointments(value) => _liveAppointments.value = value;

  set deadAppointments(value) => _deadAppointments.value = value;

  cancelAppointment({required Appointment appointment}) async {
    isCancelling = true;
    liveAppointments = (liveAppointments as List<Appointment>)
        .where((element) => element.id != appointment.id)
        .toList();
    bool isCancelSucceed = await appointmentService.cancelAppointment(
        appointmentId: appointment.id);
    log('cancelling appointment feedback: $isCancelSucceed');
    isCancelling = false;
  }

  Future updateLiveAppointments() async {
    isLoading = true;
    List<Appointment> app = await appointmentProvider.getLiveAppointments();
    _liveAppointments.assignAll(app);
    isLoading = false;
  }

  Future updateLiveAppointmentsSilently() async {
    List<Appointment> app = await appointmentProvider.getLiveAppointments();
    _liveAppointments.assignAll(app);
  }

  Future updateDeadAppointments() async {
    List<Appointment> app = await appointmentProvider.getDeadAppointments();
    _deadAppointments.assignAll(app);
  }

  updateAppointmentRepeatedly() async {
    while (isMounted) {
      if (!isLoading && !isCancelling) {
        await updateLiveAppointmentsSilently();
        await Future.delayed(const Duration(seconds: 7), () {
          log('live appointment updated silently .... ');
        });
      }
      await Future.delayed(const Duration(seconds: 7), () {});
    }
  }

  @override
  void onClose() {
    isMounted = false;
    super.onClose();
  }
}
