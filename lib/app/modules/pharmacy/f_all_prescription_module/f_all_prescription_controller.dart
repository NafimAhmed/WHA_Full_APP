import 'dart:developer';

import 'package:wha/app/data/provider/provider.dart';
import 'package:get/get.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:url_launcher/url_launcher.dart';

class FAllPrescriptionController extends GetxController{
  final PrescriptionProvider provider = Get.find<PrescriptionProvider>();

  final _isLoading = false.obs;
  final _showSavedMessage = false.obs;
  final _prescriptionPath = ''.obs;
  final RxList<Prescription> _prescriptions = <Prescription>[].obs;
  get isLoading => _isLoading.value;
  get showSavedMessage => _showSavedMessage.value;
  get prescriptionPath => _prescriptionPath.value;
  get prescriptions => _prescriptions.value;
  set isLoading(value) => _isLoading.value = value;
  set showSavedMessage(value) => _showSavedMessage.value = value;
  set prescriptionPath(value) => _prescriptionPath.value = value;
  set prescriptions(value) => _prescriptions.value = value;


  updatePrescriptions()async{
    isLoading = true;
    try{
      List<Prescription> _pres = await provider.getPrescriptions();
      _prescriptions.assignAll(_pres);
    }catch(_){log(_.toString());}
    isLoading = false;
  }
  refreshPrescriptions()async{
    try{
      List<Prescription> _pres = await provider.getPrescriptions();
      _prescriptions.assignAll(_pres);
    }catch(_){log(_.toString());}
  }
  showPrescriptionSavedMessage(String path)async{
    showSavedMessage = true;
    prescriptionPath = path;
  }
  openPrescription()async{
    if(prescriptionPath != ''){
      await launch(prescriptionPath);
    }
  }
}
