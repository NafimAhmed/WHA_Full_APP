class TestForPrescription {
  int id;
  String name;

  TestForPrescription({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{'id': id, 'name': name};
    return map;
  }

  @override
  String toString() {
    return 'TestForPrescription{id: $id, name: $name}';
  }
}
