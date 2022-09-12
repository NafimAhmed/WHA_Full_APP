import 'package:wha/app/data/model/model.dart';
import 'package:wha/app/theme/app_colors.dart';
import 'package:flutter/material.dart';

class BuildBeforeMedication extends StatelessWidget {
  const BuildBeforeMedication({Key? key, required this.currentMedication, required this.takingTime}) : super(key: key);
  final String takingTime;
  final CurrentMedication currentMedication;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(5, 4, 5, 2),
      child: PhysicalModel(
        color: backgroundColor,
        elevation: 1.0,
        borderRadius: const BorderRadius.only(topLeft: Radius.circular(50), bottomLeft: Radius.circular(50)),
        child: SizedBox(
          height: 65,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const SizedBox(width: 5),
              SizedBox(
                height: 58,
                width: 58,
                child: PhysicalModel(
                  color: primaryColor,
                  borderRadius: BorderRadius.circular(50),
                  child: Padding(
                    padding: const EdgeInsets.all(8),
                    child: PhysicalModel(
                      color: backgroundColor,
                      borderRadius: BorderRadius.circular(50),
                      elevation: 10.0,
                      child: ClipOval(
                        child: Image.asset(
                          'assets/capsul.png',
                          fit: BoxFit.fitHeight,
                        ),
                      ),
                    ),
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Text(
                    'Medicine name',
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    currentMedication.takingTime == 1 ? 'before $takingTime': 'after $takingTime',
                    style: const TextStyle(
                      fontSize: 12,
                    ),
                  ),
                  Text(
                    '${currentMedication.duration} ${currentMedication.durationUnit == '' ? 'days' : currentMedication.durationUnit}',
                    style: const TextStyle(
                      fontSize: 11,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
