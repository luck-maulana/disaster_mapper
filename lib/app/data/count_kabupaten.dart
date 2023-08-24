class CountKabupaten {
  late num ringan;
  late num sedang;
  late num berat;
  late num total;
  late String selectedKabupaten;

  CountKabupaten({
    required this.ringan,
    required this.sedang,
    required this.berat,
    required this.selectedKabupaten,
    required this.total,
  });

  Map<String, dynamic> toJson() {
    return {
      'ringan': ringan,
      'sedang': sedang,
      'berat': berat,
      'selectedKabupaten': selectedKabupaten,
      'total': total,
    };
  }

  factory CountKabupaten.fromMap(Map<String, dynamic> map) {
    return CountKabupaten(
      ringan: map['ringan'] ?? 0,
      sedang: map['sedang'] ?? 0,
      berat: map['berat'] ?? 0,
      total: map['total'] ?? 0,
      selectedKabupaten: map['selectedKabupaten'] ?? '',
    );
  }
}
