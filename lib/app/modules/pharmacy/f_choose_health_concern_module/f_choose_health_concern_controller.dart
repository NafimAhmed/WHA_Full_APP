import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/data/provider/provider.dart';
import 'package:get/get.dart';

class FChooseHealthConcernController extends GetxController{

  final RxList<Concern> _concerns = <Concern>[].obs;

  get concerns => _concerns.value;

  final AppState appState = Get.find<AppState>();
  final ConcernProvider concernProvider = ConcernProvider();

  set concerns(value) => _concerns.value = value;

  updateConcerns() async {
    concerns = appState.concerns;
    if ((concerns as List).isEmpty) {
      List<Concern> cns = await concernProvider.getAllConcern();
      _concerns.assignAll(cns);
    }
  }
}
