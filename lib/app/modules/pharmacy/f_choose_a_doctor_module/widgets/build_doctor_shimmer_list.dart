import 'package:wha/app/modules/pharmacy/f_choose_a_doctor_module/widgets/widgets.dart';
import 'package:flutter/material.dart';

class BuildDoctorShimmerList extends StatelessWidget {
  const BuildDoctorShimmerList({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return SizedBox(
      height: size.height - 130,
      child: Padding(
        padding: const EdgeInsets.fromLTRB(10, 0, 10, 100),
        child: ListView.builder(
          itemCount: 10,
          scrollDirection: Axis.vertical,
          physics: const BouncingScrollPhysics(),
          shrinkWrap: true,
          itemBuilder: (BuildContext context, int index) => const BuildDoctorShimmer(),
        ),
      ),
    );
  }
}
