class CurrentVitalSign{
  int id = 0;
  String name = '';
  String value = '';

  CurrentVitalSign({
    required this.id,
    required this.name,
    required this.value,
  });

  @override
  String toString() {
    return 'CurrentVitalSign{id: $id, name: $name, value: $value}';
  }
}