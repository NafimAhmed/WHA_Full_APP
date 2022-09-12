import 'package:wha/app/data/model/user.dart';

class Patient extends User {
  int id;
  int organizationId;
  int uniqueId;
  int roleId;
  String firstName;
  String lastName;
  String phone;
  String email;
  String address;
  String profession;
  String country;
  String city;
  String district;
  String postcode;
  String gender;
  String image;

  Patient({
    required this.id,
    required this.organizationId,
    required this.uniqueId,
    required this.roleId,
    required this.firstName,
    required this.lastName,
    required this.phone,
    required this.email,
    required this.address,
    required this.profession,
    required this.country,
    required this.city,
    required this.district,
    required this.postcode,
    required this.gender,
    required this.image,
  }) : super(id: id,
      roleId: roleId,
      organizationId: organizationId,
      firstName: firstName,
      lastName: lastName,
      phone: phone,
      email: email,
      address: address,
      profession: profession,
      country: country,
      city: city,
      district: district,
      postcode: postcode,
      gender: gender,
      image: image);

  @override
  Map<String, dynamic> toMap() {
    var map = <String, dynamic>{
      'id': id,
      'organizationId': organizationId,
      'uniqueId': uniqueId,
      'roleId': roleId,
      'firstName': firstName,
      'lastName': lastName,
      'phone': phone,
      'email': email,
      'address': address,
      'profession': profession,
      'country': country,
      'city': city,
      'district': district,
      'postcode': postcode,
      'gender': gender,
      'image': image
    };
    return map;
  }

  static Patient fromMap(Map<String, dynamic> map){
    return Patient(id: map['id'] ?? 0,
        organizationId: map['organizationId'] ?? 0,
        uniqueId: map['uniqueId'] ?? 0,
        roleId: map['roleId'] ?? 3,
        firstName: map['firstName'] ?? '',
        lastName: map['lastName'] ?? '',
        phone: map['phone'] ?? '',
        email: map['email'] ?? '',
        address: map['address'] ?? '',
        profession: map['profession'] ?? '',
        country: map['country'] ?? '',
        city: map['city'] ?? '',
        district: map['district'] ?? '',
        postcode: map['postcode'] ?? '',
        gender: map['gender'] ?? '',
        image: map['image'] ?? '');
  }

  @override
  String toString() {
    return 'Patient{id: $id, organizationId: $organizationId, uniqueId: $uniqueId, roleId: $roleId, firstName: $firstName, lastName: $lastName, phone: $phone, email: $email, address: $address, profession: $profession, country: $country, city: $city, district: $district, postcode: $postcode, gender: $gender, image: $image}';
  }
}
