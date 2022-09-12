import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/data/provider/provider.dart';
import 'package:card_swiper/card_swiper.dart';
import 'package:get/get.dart';

class PCurrentMedicationController extends GetxController {
  final RxInt _currentIndex = 0.obs;
  final _currentMedications = [].obs;
  final _isLoading = false.obs;

  final SwiperController swiperController = SwiperController();
  final AppState appState = Get.find<AppState>();
  final CurrentMedicationProvider currentMedicationProvider = Get.find<CurrentMedicationProvider>();

  get currentIndex => _currentIndex.value;
  get currentMedications => _currentMedications.value;
  get isLoading => _isLoading.value;

  set currentIndex(value) => _currentIndex.value = value;
  set currentMedications(value) => _currentMedications.value = value;
  set isLoading(value) => _isLoading.value = value;

  updateCurrentMedicationList()async{
    isLoading = true;
    currentMedications= await currentMedicationProvider.getCurrentMedication(accessToken: appState.accessToken);
    CurrentMedication currentMedication = CurrentMedication(id: 1, prescriptionId: 1, medicineId: 1, duration: 33, durationUnit: 'days', takingTime: 1, isBreakfast: true, isLunch: true, isDinner: true);
    List<CurrentMedication> current = [
      currentMedication,
      currentMedication,
      currentMedication,
      currentMedication,
      currentMedication,
      currentMedication,
      currentMedication,
      currentMedication,
    ];
    (currentMedications as List<CurrentMedication>)
      ..add(currentMedication)
      ..add(currentMedication)
      ..add(currentMedication);

    isLoading = false;
  }

  @override
  void onClose() {
    Get.delete<CurrentMedicationProvider>();
    super.onClose();
  }
}
