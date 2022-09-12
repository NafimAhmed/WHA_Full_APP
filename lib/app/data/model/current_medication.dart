class CurrentMedication {
  int id = 0;
  int prescriptionId = 0;
  int medicineId = 0;
  int duration = 0;
  String durationUnit = '';
  int takingTime = 0;
  bool isBreakfast = false;
  bool isLunch = false;
  bool isDinner = false;

  CurrentMedication(
      {required this.id,
      required this.prescriptionId,
      required this.medicineId,
      required this.duration,
      required this.durationUnit,
      required this.takingTime,
      required this.isBreakfast,
      required this.isLunch,
      required this.isDinner});

  CurrentMedication.fromMap(Map<String, dynamic> map) {
    id = map['id'] ?? 0;
    prescriptionId = map['prescription_id'];
    medicineId = map['medicine_id'];
    duration = map['duration'];
    durationUnit = map['duration_unit'];
    takingTime = map['taking_time'];
    isBreakfast = map['is_breakfast'];
    isLunch = map['is_lunch'];
    isDinner = map['is_dinner'];
  }

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'prescriptionId': prescriptionId,
      'medicineId': medicineId,
      'duration': duration,
      'durationUnit': durationUnit,
      'takingTime': takingTime,
      'isBreakfast': isBreakfast,
      'isLunch': isLunch,
      'isDinner': isDinner
    };
    return map;
  }

  @override
  String toString() {
    return 'CurrentMedication{id: $id, prescriptionId: $prescriptionId, medicineId: $medicineId, duration: $duration, durationUnit: $durationUnit, takingTime: $takingTime, isBreakfast: $isBreakfast, isLunch: $isLunch, isDinner: $isDinner}';
  }
}
