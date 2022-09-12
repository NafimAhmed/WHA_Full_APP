class CurrentTestReport{
  int id = 0;
  String name = '';


  CurrentTestReport({
    required this.id,
    required this.name
  });

  @override
  String toString() {
    return 'CurrentTestReport{id: $id, name: $name}';
  }
}