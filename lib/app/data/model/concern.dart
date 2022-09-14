import 'package:wha/app/data/api.dart';

class Concern{
  int id = 0;
  String concern = '';
  String icon = '';

  Concern({
    required this.id,
    required this.concern,
    required this.icon,
  });

  Map<String, dynamic> toMap(){
    var map = <String, dynamic>{
      'id': id,
      'concern': concern,
      'icon': icon,
    };
    return map;
  }

  Concern.fromMap(Map<String, dynamic> map){
    id = map['id'] ?? 0;
    concern = map['concern'] ?? '';

    icon = map['icon'] ?? '';
  }

  @override
  String toString() {
    return 'Concern{id: $id, name: $concern, icon: $icon}';
  }
}