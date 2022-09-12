import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/data/provider/provider.dart';
import 'package:get/get.dart';

class PHomeOurDoctorsController extends GetxController {
  final _isLoading = false.obs;
  final _doctors = [].obs;

  get isLoading => _isLoading.value;

  get doctors => _doctors.value;

  final AppState appState = Get.find<AppState>();
  final DoctorProvider doctorProvider = Get.find<DoctorProvider>();

  set isLoading(value) => _isLoading.value;

  set doctors(value) => _doctors.value = value;

  updateOurDoctors() async {
    isLoading = true;
    List<Doctor> dct = await doctorProvider.getAllDoctor();
    _doctors.assignAll(dct);
    isLoading = false;
  }
}
