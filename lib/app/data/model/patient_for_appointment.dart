class PatientForAppointment{
  int id = 0;
  String firstName = '';
  String lastName = '';
  String image = '';

  PatientForAppointment({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.image,
  });


  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      'id': id,
      'firstName': firstName,
      'lastName': lastName,
      'image': image,
    };
    return map;
  }

  PatientForAppointment.fromMap(Map<String, dynamic> map){
    id = map['id'];
    firstName = map['first_name'];
    lastName = map['last_name'];
    image = map['image'];
  }

  @override
  String toString() {
    return 'PatientForAppointment{id: $id, firstName: $firstName, lastName: $lastName, image: $image}';
  }
}
