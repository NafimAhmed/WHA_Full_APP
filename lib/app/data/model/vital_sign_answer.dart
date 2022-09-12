class VitalSignAnswer {
  int id;
  int patientId;
  String firstAnswer;
  String secondAnswer;

  VitalSignAnswer(
      {required this.id,
      required this.patientId,
      required this.firstAnswer,
      required this.secondAnswer});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'patientId': patientId,
      'firstAnswer': firstAnswer,
      'secondAnswer': secondAnswer
    };
    return map;
  }

  @override
  String toString() {
    return 'VitalSignAnswer{id: $id, patientId: $patientId, firstAnswer: $firstAnswer, secondAnswer: $secondAnswer}';
  }
}
