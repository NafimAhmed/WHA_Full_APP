class Hotline{
  int id = 0;
  int organizationId = 0;
  String phoneNumber = '';

  Hotline({required this.id, required this.organizationId, required this.phoneNumber});

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      'id': id,
      'organizationId': organizationId,
      'phoneNumber': phoneNumber
    };
    return map;
  }

  Hotline.fromMap(Map<String, dynamic> map){
    id = map['id'] ?? 0;
    organizationId = map['organization_id'];
    phoneNumber = map['phone'] ?? '';
  }

  @override
  String toString() {
    return 'Hotline{id: $id, organizationId: $organizationId, phoneNumber: $phoneNumber}';
  }
}