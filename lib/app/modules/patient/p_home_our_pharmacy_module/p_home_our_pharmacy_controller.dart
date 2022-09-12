import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/data/provider/provider.dart';
import 'package:get/get.dart';

class PHomeOurPharmacyController extends GetxController{
  final _isLoading = false.obs;
  final _pharmacies = [].obs;


  get isLoading => _isLoading.value;
  get pharmacies => _pharmacies.value;

  final AppState appState = Get.find<AppState>();
  final PharmacyProvider pharmacyProvider = Get.find<PharmacyProvider>();

  set isLoading(value) => _isLoading.value = value;
  set pharmacies(value) => _pharmacies.value = value;

  updatePharmacies()async{
    isLoading = true;
    List<Pharmacy> phs = await pharmacyProvider.getAllPharmacy(accessToken: appState.accessToken);
    _pharmacies.assignAll(phs);
    isLoading = false;
  }
}
