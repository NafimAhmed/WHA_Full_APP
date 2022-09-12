import 'package:wha/app/data/model/specialist.dart';

class DoctorForPrescription {
  int id;
  String firstName;
  String lastName;
  String phone;
  String image;
  List<Specialist> specialists;

  DoctorForPrescription(
      {required this.id,
      required this.firstName,
      required this.lastName,
      required this.phone,
      required this.image,
      required this.specialists});

  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'image': image,
      'specialists': specialists
    };
    return map;
  }

  @override
  String toString() {
    return 'DoctorForPrescription{id: $id, firstName: $firstName, lastName: $lastName, phone: $phone, image: $image, specialists: $specialists}';
  }
}
