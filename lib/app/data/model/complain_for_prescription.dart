class ComplainForPrescription {
  int id;
  String name;

  ComplainForPrescription({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{'id': id, 'name': name};
    return map;
  }

  @override
  String toString() {
    return 'ComplainForPrescription{id: $id, name: $name}';
  }
}
