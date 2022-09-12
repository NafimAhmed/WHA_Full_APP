class DoctorForAppointment{
  int id = 0;
  String firstName = '';
  String lastName = '';
  String hospitalName = '';
  String image = '';
  String degrees = '';
  int fee = 0;
  int vat = 0;

  DoctorForAppointment({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.hospitalName,
    required this.image,
    required this.degrees,
    required this.fee,
    required this.vat
  });


  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'hospitalName': hospitalName,
      'image': image,
      'degrees': degrees,
      'fee': fee,
      'vat': vat
    };
    return map;
  }

  DoctorForAppointment.fromMap(Map<String, dynamic> map){
    id = map['id'];
    firstName = map['first_name'];
    lastName = map['last_name'];
    hospitalName = map['hospital_name'];
    image = map['image'];
    degrees = map['degrees'];
    fee = map['fee'];
    vat = map['vat'];
  }

  @override
  String toString() {
    return 'DoctorForAppointment{id: $id, firstName: $firstName, lastName: $lastName, hospitalName: $hospitalName, image: $image, degrees: $degrees, fee: $fee, vat: $vat}';
  }
}
