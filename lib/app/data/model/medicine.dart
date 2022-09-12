class Medicine {
  int id;
  String name;
  String generic;
  String company;
  String strength;
  String dosage;
  String medicineText;

  Medicine(
      {required this.id,
      required this.name,
      required this.generic,
      required this.company,
      required this.strength,
      required this.dosage,
      required this.medicineText});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'name': name,
      'generic': generic,
      'company': company,
      'strength': strength,
      'dosage': dosage,
      'medicineText': medicineText
    };
    return map;
  }

  @override
  String toString() {
    return 'Medicine{id: $id, name: $name, generic: $generic, company: $company, strength: $strength, dosage: $dosage, medicineText: $medicineText}';
  }
}
