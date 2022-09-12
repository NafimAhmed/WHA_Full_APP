import 'dart:typed_data';
import 'package:get/get.dart';

import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/modules/pharmacy/f_all_prescription_module/f_all_prescription_controller.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:image_gallery_saver/image_gallery_saver.dart';
import 'package:screenshot/screenshot.dart';

class BuildPrescriptionSaveButton extends StatelessWidget {
  BuildPrescriptionSaveButton({Key? key, required this.controller, required this.prescription})
      : super(key: key);
  final Prescription prescription;
  final ScreenshotController controller;
  final FAllPrescriptionController prescriptionController = Get.find<FAllPrescriptionController>();

  @override
  Widget build(BuildContext context) {
    String nextFollowup = prescription.nextFollowUpQuantity == '' ? '' :   '* next followup in ${prescription.nextFollowUpQuantity} ${prescription.nextFollowUpUnit} *';
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Row(
          children: [
            Padding(
              padding: const EdgeInsets.only(left: 15),
              child: Text(
                nextFollowup,
                style: TextStyle(
                  color: Colors.red.shade900
                ),
              ),
            ),
          ],
        ),
        Row(
          children: [
            const Text('Save'),
            const SizedBox(width: 10),
            Padding(
              padding: const EdgeInsets.fromLTRB(0, 0, 15, 10),
              child: PhysicalModel(
                color: primaryColor,
                elevation: 5.0,
                borderRadius: BorderRadius.circular(50),
                child: IconButton(
                  onPressed: ()async{
                    Uint8List? savedImage = await controller.capture(delay: const Duration(milliseconds: 2));
                    if(savedImage != null){
                      final saveResult = await ImageGallerySaver.saveImage(
                        savedImage,
                        name: getRandomImageName(),
                      );
                      Map<String, dynamic> mapResult = Map.from(saveResult);
                      if(mapResult['isSuccess'] == true){
                        Fluttertoast.showToast(msg: 'Prescription Saved', toastLength: Toast.LENGTH_SHORT);
                        prescriptionController.showPrescriptionSavedMessage(mapResult['filePath']);
                      }
                    }
                  },
                  tooltip: 'Save',
                  icon: const Icon(
                    Icons.download,
                    color: backgroundColor,
                    size: 30,
                  ),
                ),
              ),
            ),
          ],
        ),
      ],
    );
  }
  String getRandomImageName(){
    DateTime presentTime = DateTime.now();
    String fileName = 'Prescription_${presentTime.year.toString()}${presentTime.month.toString()}${presentTime.day.toString()}${presentTime.hour.toString()}${presentTime.minute.toString()}${presentTime.second.toString()}';
    return fileName;
  }
}
