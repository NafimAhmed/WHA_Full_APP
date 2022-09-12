import 'package:wha/app/data/api.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:flutter/material.dart';

class BuildPrescriptionDoctorInfo extends StatelessWidget {
  const BuildPrescriptionDoctorInfo({Key? key, required this.prescription})
      : super(key: key);
  final Prescription prescription;

  @override
  Widget build(BuildContext context) {
    String specialist = 'General Physician';
    if(prescription.doctor.specialists.isNotEmpty){
      specialist = prescription.doctor.specialists.first.name;
    }
    String doctorName = prescription.doctor.firstName + ' ' + prescription.doctor.lastName;
    if(doctorName.length > 20){
      doctorName = prescription.doctor.firstName + '\n' + prescription.doctor.lastName;
    }
    return Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        ClipOval(
          child: Image(
            image: NetworkImage('${Api.baseAPI}/${prescription.doctor.image}'),
            errorBuilder: (context, error, stackTrace) {
              return const Image(
                image: AssetImage(
                  'assets/person.jpg',
                ),
                fit: BoxFit.fill,
                height: 60,
                width: 60,
              );
            },
            fit: BoxFit.fill,
            height: 70,
            width: 70,
          ),
        ),
        Text(
          doctorName,
          style: const TextStyle(

          ),
          softWrap: true,
          textAlign: TextAlign.center,
        ),
        Text(
          '($specialist)',
          style: const TextStyle(

          ),
          softWrap: true,
          textAlign: TextAlign.center,
        ),
      ],
    );
  }
}
