abstract class User {
  int id;
  int organizationId;
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

  User({
    required this.id,
    required this.organizationId,
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
    required this.image
  });

  Map<String, dynamic> toMap();
  @override
  String toString();
}