class PendataanData {
  String nomorKK;
  String nik;
  List<String> imageUrls;
  String namaPemilik;
  String rt;
  String rw;
  String jenisRumah;
  String id;
  String alamat;
  int luas;
  double latitude;
  double longitude;
  String tingkatKerusakan;
  String provinsi;
  String kabupaten;
  String kecamatan;
  String desa;

  PendataanData({
    required this.nomorKK,
    required this.nik,
    required this.imageUrls,
    required this.namaPemilik,
    required this.rt,
    required this.rw,
    required this.jenisRumah,
    required this.id,
    required this.alamat,
    required this.luas,
    required this.latitude,
    required this.longitude,
    required this.tingkatKerusakan,
    required this.provinsi,
    required this.kabupaten,
    required this.kecamatan,
    required this.desa,
  });

  factory PendataanData.fromMap(Map<String, dynamic> map) {
    return PendataanData(
      nomorKK: map['nomorKK'],
      nik: map['nik'],
      imageUrls: List<String>.from(map['imageUrls'] ?? []),
      namaPemilik: map['namaPemilik'] ?? '',
      rt: map['rt'] ?? '',
      rw: map['rw'] ?? '',
      jenisRumah: map['jenisRumah'] ?? '',
      id: map['id'] ?? '',
      alamat: map['alamat'] ?? '',
      provinsi: map['selectedProvinsi'] ?? '',
      kabupaten: map['selectedKabupaten'] ?? '',
      kecamatan: map['selectedKecamatan'] ?? '',
      desa: map['selectedDesa'] ?? '',
      luas: map['luas'] ?? 0,
      latitude: map['latitude'] ?? 0.0,
      longitude: map['longitude'] ?? 0.0,
      tingkatKerusakan: map['tingkatKerusakan'] ?? '',
    );
  }
}
