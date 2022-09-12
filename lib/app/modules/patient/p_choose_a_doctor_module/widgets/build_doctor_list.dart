import 'package:wha/app/data/model/model.dart';
import 'package:flutter/material.dart';
import 'package:wha/app/modules/patient/p_choose_a_doctor_module/widgets/widgets.dart';

class BuildDoctorList extends StatelessWidget {
  const BuildDoctorList({Key? key, required this.concernId, required this.doctors}) : super(key: key);
  final int concernId;
  final List<DoctorForAppointment> doctors;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return SizedBox(
      height: size.height - 130,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 100),
        child: ListView.builder(
          itemCount: doctors.length,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) {
            return BuildDoctor(concernId: concernId, doctor: doctors[index]);
          },
        ),
      ),
    );
  }
}
