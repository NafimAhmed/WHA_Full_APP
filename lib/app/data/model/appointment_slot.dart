class AppointmentSlot {
  int id;
  DateTime startTime;
  DateTime endTime;

  AppointmentSlot(
      {required this.id, required this.startTime, required this.endTime});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'startTime': startTime,
      'endTime': endTime
    };
    return map;
  }

  @override
  String toString() {
    return 'AppointmentSlot{id: $id, startTime: $startTime, endTime: $endTime}';
  }
}
