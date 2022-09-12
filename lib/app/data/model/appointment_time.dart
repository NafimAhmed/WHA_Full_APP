import 'package:wha/app/data/model/appointment_slot.dart';

class AppointmentTime {
  int id;
  DateTime date;
  DateTime startTime;
  DateTime endTime;
  int slotTimeInMinute;
  List<AppointmentSlot> slots = [];

  AppointmentTime(
      {required this.id,
      required this.date,
      required this.startTime,
      required this.endTime,
      required this.slotTimeInMinute});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'date': date,
      'startTime': startTime,
      'endTime': endTime,
      'slotTime': slotTimeInMinute,
      'slots': slots
    };
    return map;
  }

  @override
  String toString() {
    return 'AppointmentTime{id: $id, date: $date, startTime: $startTime, endTime: $endTime, slotTime: $slotTimeInMinute}';
  }
}
