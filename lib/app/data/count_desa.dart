class CountDesa {
  late num ringan;
  late num sedang;
  late num berat;
  late num total;
  late String selectedDesa;

  CountDesa({
    required this.ringan,
    required this.sedang,
    required this.berat,
    required this.selectedDesa,
    required this.total,
  });

  Map<String, dynamic> toJson() {
    return {
      'ringan': ringan,
      'sedang': sedang,
      'berat': berat,
      'selectedDesa': selectedDesa,
      'total': total,
    };
  }

  factory CountDesa.fromMap(Map<String, dynamic> map) {
    return CountDesa(
      ringan: map['ringan'] ?? 0,
      sedang: map['sedang'] ?? 0,
      berat: map['berat'] ?? 0,
      total: map['total'] ?? 0,
      selectedDesa: map['selectedDesa'] ?? '',
    );
  }
}
