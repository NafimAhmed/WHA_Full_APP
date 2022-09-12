import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/data/provider/provider.dart';
import 'package:get/get.dart';

class PCurrentAppointmentsController extends GetxController{
  final _isLoading = false.obs;
  final _currentAppointments = [].obs;

  final AppState appState = Get.find<AppState>();
  final CurrentAppointmentProvider appointmentProvider = Get.find<CurrentAppointmentProvider>();

  get isLoading => _isLoading.value;
  get currentAppointments => _currentAppointments.value;

  set isLoading(value) => _isLoading.value = value;
  set currentAppointments(value) => _currentAppointments.value = value;

  updateCurrentAppointments()async{
    isLoading = true;
    // currentAppointments = await appointmentProvider.getCurrentAppointments(accessToken: appState.accessToken);
    currentAppointments
      ..add(CurrentAppointment(id: 0, doctorId: 1, time: DateTime.now()))
      ..add(CurrentAppointment(id: 1, doctorId: 2, time: DateTime.now()))
      ..add(CurrentAppointment(id: 2, doctorId: 3, time: DateTime.now()))
      ..add(CurrentAppointment(id: 3, doctorId: 4, time: DateTime.now()));
    isLoading = false;
  }
}
