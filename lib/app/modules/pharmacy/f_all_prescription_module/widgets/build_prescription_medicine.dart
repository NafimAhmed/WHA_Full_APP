import 'package:wha/app/data/model/model.dart';
import 'package:flutter/material.dart';

class BuildPrescriptionMedicine extends StatelessWidget {
  const BuildPrescriptionMedicine(
      {Key? key, required this.index, required this.medicine})
      : super(key: key);
  final int index;
  final MedicineForPrescription medicine;

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.fromLTRB(0, 0, 0, 20),
      child: SizedBox(
        width: size.width,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.center,
                children: [
                  Text(
                    '${(index + 1)}. ',
                    style: const TextStyle(
                      fontSize: 23,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  Text(
                    '${medicine.medicine.dosage}: ',
                    style: const TextStyle(
                      fontSize: 22,
                    ),
                  ),
                  Text(
                    medicine.medicine.name + ' ',
                    style: const TextStyle(
                      fontSize: 16,
                    ),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                  Text(
                    medicine.medicine.strength,
                    style: const TextStyle(
                      fontSize: 10,
                    ),
                    softWrap: true,
                    textAlign: TextAlign.center,
                  ),
                ],
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    SizedBox(
                      width: size.width / 3,
                      child: const Divider(
                        thickness: 2.5,
                        color: Colors.black,
                      ),
                    ),
                    Text(
                        '${medicine.breakfast} + ${medicine.lunch} + ${medicine.dinner}  ${medicine.medicineTakeTime}',
                      style: const TextStyle(),
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      medicine.medicine.medicineText,
                      style: const TextStyle(),
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
                Column(
                  children: [
                    Text(
                      medicine.durationQuantity,
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                      ),
                      softWrap: true,
                    ),
                    Text(
                      medicine.durationUnit,
                      style: const TextStyle(
                        fontSize: 16,
                        fontWeight: FontWeight.normal,
                      ),
                      softWrap: true,
                      textAlign: TextAlign.center,
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
