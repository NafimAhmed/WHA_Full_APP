import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/data/provider/provider.dart';
import 'package:get/get.dart';

class FChooseADoctorController extends GetxController{
  int concernId = Get.arguments as int? ?? 0;
  final _isLoading = false.obs;
  final RxList<DoctorForAppointment> _doctors = <DoctorForAppointment>[].obs;

  get isLoading => _isLoading.value;
  get doctors => _doctors.value;

  final AppState appState = Get.find<AppState>();
  final DoctorProvider doctorProvider = DoctorProvider();

  set isLoading(value) => _isLoading.value = value;
  set doctors(value) => _doctors.value = value;

  updateDoctors()async{
    if((doctors as List<DoctorForAppointment>).isEmpty && isLoading != true && concernId != 0){
      isLoading = true;
      List<DoctorForAppointment> dct = await doctorProvider.getDoctorByConcernId(id: concernId);
      _doctors.assignAll(dct);
      isLoading = false;
    }
  }
}
