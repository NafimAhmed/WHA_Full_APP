import 'dart:developer';

import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/data/provider/provider.dart';
import 'package:get/get.dart';

class FChooseTimeSlotController extends GetxController{
  final doctorId = Get.arguments ?? 0;
  final concernId = int.parse(Get.parameters['concernId'] ?? '0');
  final AppointmentTimeSlotProvider timeSlotProvider =
  Get.find<AppointmentTimeSlotProvider>();

  final _isLoading = false.obs;
  final _selectedAppointmentTimeIndex = 0.obs;
  final RxList<AppointmentTime> _appointmentTimes = <AppointmentTime>[].obs;

  get isLoading => _isLoading.value;

  get selectedAppointmentTimeIndex => _selectedAppointmentTimeIndex.value;

  set isLoading(value) => _isLoading.value = value;

  set selectedAppointmentTimeIndex(value) =>
      _selectedAppointmentTimeIndex.value;

  get appointmentTimes => _appointmentTimes.value;

  set appointmentTimes(value) => _appointmentTimes.value = value;

  updateTimeSlot() async {
    if (doctorId as int != 0) {
      if ((appointmentTimes as List<AppointmentTime>).isEmpty &&
          (isLoading as bool != true)) {
        isLoading = true;
        List<AppointmentTime> apts =
        await timeSlotProvider.getTimeSlot(doctorId: doctorId);
        _appointmentTimes.assignAll(apts);
        log('appointment time slot updated: ${appointmentTimes.toString()}');
        isLoading = false;
      }
    }
  }

  updateSelectedAppointmentTimeIndex(int index) {
    _selectedAppointmentTimeIndex.value = index;
  }
}
