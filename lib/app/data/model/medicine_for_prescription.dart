import 'package:wha/app/data/model/medicine.dart';

class MedicineForPrescription {
  int id;
  int prescriptionId;
  int medicineId;
  String durationQuantity;
  String durationUnit;
  String medicineTakeTime;
  int breakfast;
  int lunch;
  int dinner;
  Medicine medicine;

  MedicineForPrescription(
      {required this.id,
      required this.prescriptionId,
      required this.medicineId,
      required this.durationQuantity,
      required this.durationUnit,
      required this.medicineTakeTime,
      required this.breakfast,
      required this.lunch,
      required this.dinner,
      required this.medicine});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'prescriptionId': prescriptionId,
      'medicineId': medicineId,
      'durationQuantity': durationQuantity,
      'durationUnit': durationUnit,
      'medicineTakeTime': medicineTakeTime,
      'breakfast': breakfast,
      'lunch': lunch,
      'dinner': dinner,
      'medicine': medicine
    };
    return map;
  }

  @override
  String toString() {
    return 'MedicineForPrescription{id: $id, prescriptionId: $prescriptionId, medicineId: $medicineId, durationQuantity: $durationQuantity, durationUnit: $durationUnit, medicineTakeTime: $medicineTakeTime, breakfast: $breakfast, lunch: $lunch, dinner: $dinner, medicine: $medicine}';
  }
}
