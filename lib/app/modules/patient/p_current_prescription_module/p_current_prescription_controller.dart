import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/data/provider/provider.dart';
import 'package:get/get.dart';

class PCurrentPrescriptionController extends GetxController{
  final _isLoading = false.obs;
  final _currentPrescriptions = [].obs;

  final AppState appState = Get.find<AppState>();
  final CurrentPrescriptionProvider prescriptionProvider = Get.find<CurrentPrescriptionProvider>();

  get isLoading => _isLoading.value;
  get currentPrescriptions => _currentPrescriptions.value;

  set isLoading(value) =>  _isLoading.value = value;
  set currentPrescriptions(value) => _currentPrescriptions.value = value;

  updateCurrentPrescriptions()async{
    isLoading = true;
    // currentPrescriptions = await prescriptionProvider.getCurrentPrescriptions(accessToken: appState.accessToken);
    isLoading = false;
    currentPrescriptions
      ..add(CurrentPrescription(id: 1, imageUrl: 'https://www.klippa.com/wp-content/uploads/2020/12/medical-prescription-ocr.png', pdfUrl: ''))
      ..add(CurrentPrescription(id: 2, imageUrl: 'https://www.klippa.com/wp-content/uploads/2020/12/medical-prescription-ocr.png', pdfUrl: ''))
      ..add(CurrentPrescription(id: 3, imageUrl: 'https://www.klippa.com/wp-content/uploads/2020/12/medical-prescription-ocr.png', pdfUrl: ''))
      ..add(CurrentPrescription(id: 4, imageUrl: 'https://www.researchgate.net/publication/345830022/figure/fig4/AS:957640029003789@1605330583881/Sample-prescription-used-as-input-to-the-GUI-developed-in-the-present-work.png', pdfUrl: ''))
      ..add(CurrentPrescription(id: 5, imageUrl: 'https://www.researchgate.net/publication/345830022/figure/fig4/AS:957640029003789@1605330583881/Sample-prescription-used-as-input-to-the-GUI-developed-in-the-present-work.png', pdfUrl: ''));
  }
}
