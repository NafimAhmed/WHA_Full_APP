class PatientForPrescription {
  int id;
  double uniqueId;
  String firstName;
  String lastName;
  String phone;
  String address;
  String gender;
  String dateOfBirth;

  PatientForPrescription(
      {required this.id,
      required this.uniqueId,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.address,
      required this.gender,
      required this.dateOfBirth});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'uniqueId': uniqueId,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'address': address,
      'gender': gender,
      'dateOfBirth': dateOfBirth
    };
    return map;
  }

  @override
  String toString() {
    return 'PatientForPrescription{id: $id, uniqueId: $uniqueId, firstName: $firstName, lastName: $lastName, phone: $phone, address: $address, gender: $gender, dateOfBirth: $dateOfBirth}';
  }
}
