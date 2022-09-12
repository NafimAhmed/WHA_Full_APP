class CurrentVisitHistory{
  int id = 0;
  String name = '';

  CurrentVisitHistory({
    required this.id,
    required this.name,
  });

  @override
  String toString() {
    return 'CurrentVisitHistory{id: $id, name: $name}';
  }
}