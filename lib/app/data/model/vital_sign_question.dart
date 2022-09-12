enum Parameter { SINGLE_PARAMETER, DOUBLE_PARAMETER }

class VitalSignQuestion {
  int id;
  String question;
  Parameter parameter;
  String firstPlaceholder;
  String secondPlaceholder;

  VitalSignQuestion(
      {required this.id,
      required this.question,
      required this.parameter,
      required this.firstPlaceholder,
      required this.secondPlaceholder});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'question': question,
      'parameter': parameter,
      'firstPlaceholder': firstPlaceholder,
      'secondPlaceholder': secondPlaceholder
    };
    return map;
  }

  @override
  String toString() {
    return 'VitalSignQuestion{id: $id, question: $question, parameter: $parameter, firstPlaceholder: $firstPlaceholder, secondPlaceholder: $secondPlaceholder}';
  }
}
