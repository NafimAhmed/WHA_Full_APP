import 'package:wha/app/app_state.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:get/get.dart';

class FHomeController extends GetxController{
  final Pharmacy pharmacy = Get.find<AppState>().user as Pharmacy;
}
