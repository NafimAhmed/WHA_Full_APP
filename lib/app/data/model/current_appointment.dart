class CurrentAppointment{
  int id = 0;
  int doctorId = 0;
  DateTime time = DateTime.now();


  CurrentAppointment({
    required this.id,
    required this.doctorId,
    required this.time,
  });

  @override
  String toString() {
    return 'CurrentAppointment{id: $id, doctorId: $doctorId, time: $time}';
  }
}