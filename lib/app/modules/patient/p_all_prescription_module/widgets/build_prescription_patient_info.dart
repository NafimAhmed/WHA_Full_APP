import 'package:wha/app/data/model/model.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class BuildPrescriptionPatientInfo extends StatelessWidget {
  const BuildPrescriptionPatientInfo({Key? key, required this.prescription})
      : super(key: key);
  final Prescription prescription;

  @override
  Widget build(BuildContext context) {
    String patientName = prescription.patient.firstName + ' ' + prescription.patient.lastName;
    if(patientName.length > 20){
      patientName = prescription.patient.firstName + '\n' + prescription.patient.lastName;
    }
    String sex = 'Unknown';
    String birthDate = 'Unknown';
    if(prescription.patient.gender == '1'){
      sex = 'Male';
    }else if(prescription.patient.gender == '2'){
      sex = 'Female';
    }else if(prescription.patient.gender == '3'){
      sex = 'Others';
    }else if(prescription.patient.gender == 'Male' || prescription.patient.gender == 'male'){
      sex = 'Male';
    }else if(prescription.patient.gender == 'Female' || prescription.patient.gender == 'female'){
      sex = 'Female';
    }else if(prescription.patient.gender == 'Others' || prescription.patient.gender == 'others'){
      sex = 'Others';
    }
    if(prescription.patient.dateOfBirth != ''){
      try{
        DateTime date = DateFormat('yyyy-MM-dd').parse(prescription.patient.dateOfBirth);
        DateTime present = DateTime.now();
        birthDate = '${(present.year - date.year)} Years';
      }catch(_){}
    }

    return Container(
      padding: const EdgeInsets.fromLTRB(5, 0, 5, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Name: $patientName',
                style: const TextStyle(
                  fontSize: 16,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
                overflow: TextOverflow.ellipsis,
              ),
              const SizedBox(height: 5),
              Text(
                'Sex: $sex',
                style: const TextStyle(
                  fontSize: 16,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
            ],
          ),
          Column(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Age: $birthDate',
                style: const TextStyle(
                  fontSize: 16,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 5),
              patientName.length > 20 ? const Text('') : const SizedBox.shrink(),
              Text(
                'Date: ${DateFormat('dd-MM-yyyy').format(prescription.createdAt)}',
                style: const TextStyle(
                  fontSize: 16,
                ),
                softWrap: true,
                textAlign: TextAlign.center,
              )
            ],
          ),
        ],
      ),
    );
  }
}
