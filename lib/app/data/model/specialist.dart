class Specialist {
  int id;
  String name;

  Specialist({required this.id, required this.name});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{'id': id, 'name': name};
    return map;
  }

  @override
  String toString() {
    return 'Specialist{id: $id, name: $name}';
  }
}
