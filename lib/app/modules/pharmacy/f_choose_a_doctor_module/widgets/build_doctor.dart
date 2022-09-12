import 'dart:developer';

import 'package:wha/app/data/api.dart';
import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/routes/app_pages.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class BuildDoctor extends StatelessWidget {
  const BuildDoctor({Key? key, required this.concernId, required this.doctor})
      : super(key: key);
  final int concernId;
  final DoctorForAppointment doctor;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 5, 10, 5),
      child: SizedBox(
        height: 100,
        child: InkWell(
          onTap: () {
            log('doctor confirmed: ${doctor.id}, concernId : $concernId');
            Get.toNamed(Routes.F_CHOOSE_TIME_SLOT, arguments: doctor.id, parameters: <String, String>{'concernId': '$concernId'});
          },
          child: PhysicalModel(
            color: backgroundColor,
            elevation: 1.0,
            child: Row(
              children: [
                const SizedBox(width: 5),
                Hero(
                  tag: '${doctor.id}',
                  child: ClipOval(
                    child: Image.network(
                      Api.baseAPI +'/'+ doctor.image,
                      fit: BoxFit.fill,
                      height: 70,
                      width: 70,
                      errorBuilder: (BuildContext context, Object object,
                          StackTrace? stackTrace) {
                        return Image.asset(
                          'assets/person.jpg',
                          height: 70,
                          width: 70,
                        );
                      },
                    ),
                  ),
                ),
                const SizedBox(width: 10),
                Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      doctor.firstName + ' ' + doctor.lastName,
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Text(
                      doctor.degrees,
                      style: const TextStyle(
                        fontSize: 11,
                      ),
                    ),
                    Text(
                      doctor.hospitalName,
                      style: const TextStyle(
                        fontSize: 12,
                      ),
                    ),
                    Row(
                      children: [
                        const Text(
                          'Starts from ',
                        ),
                        Text(
                          '${doctor.fee} Tk',
                          style: const TextStyle(
                            fontWeight: FontWeight.bold,
                          ),
                        )
                      ],
                    )
                  ],
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: const [
                    Icon(
                      Icons.star,
                      color: primaryColor,
                      size: 26,
                    ),
                    SizedBox(width: 2),
                    Text('4.3'),
                  ],
                ),
                const SizedBox(width: 10),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
