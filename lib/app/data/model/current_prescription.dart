class CurrentPrescription {
  int id = 0;
  String imageUrl = '';
  String pdfUrl = '';

  CurrentPrescription({
    required this.id,
    required this.imageUrl,
    required this.pdfUrl,
  });

  static CurrentPrescription fromJson(Map<String, dynamic> json) {
    return CurrentPrescription(
        id: json['id'] ?? 0,
        imageUrl: json['imageUrl'] ?? '',
        pdfUrl: json['pdfUrl'] ?? '');
  }

  Map<String, dynamic> toJson() {
    var map = <String, dynamic>{
      'id': id,
      'imageUrl': imageUrl,
      'pdfUrl': pdfUrl,
    };
    return map;
  }

  @override
  String toString() {
    return 'CurrentPrescription{id: $id, imageUrl: $imageUrl, pdfUrl: $pdfUrl}';
  }
}
