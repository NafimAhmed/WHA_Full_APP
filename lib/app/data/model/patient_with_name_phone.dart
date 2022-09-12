class PatientWithNamePhone {
  int id;
  String firstName;
  String lastName;
  String phone;

  PatientWithNamePhone(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phone});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone
    };
    return map;
  }

  @override
  String toString() {
    return 'PatientWithNamePhone{id: $id, firstName: $firstName, lastName: $lastName, phone: $phone}';
  }
}
