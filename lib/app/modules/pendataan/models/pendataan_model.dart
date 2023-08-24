class Pendataan {
  String nomorKK;
  String nik;
  String namaPemilik;
  String rt;
  String rw;
  String jenisRumah;
  //String id;
  String alamat;
  int luas;
  List<String> imageUrls;
  double latitude;
  double longitude;
  String tingkatKerusakan;
  String uid;

  Pendataan({
    required this.nomorKK,
    required this.nik,
    required this.namaPemilik,
    required this.rt,
    required this.rw,
    required this.jenisRumah,
    // required this.id,
    required this.alamat,
    required this.luas,
    required this.imageUrls,
    required this.latitude,
    required this.longitude,
    required this.tingkatKerusakan,
    required this.uid,
  });

  factory Pendataan.fromMap(Map<String, dynamic> map) {
    return Pendataan(
      nomorKK: map['nomorKK'],
      nik: map['nik'],
      namaPemilik: map['namaPemilik'],
      rt: map['rt'],
      rw: map['rw'],
      jenisRumah: map['jenisRumah'],
      // id: map['id'],
      alamat: map['alamat'],
      luas: map['luas'],
      imageUrls: List<String>.from(map['imageUrls'] ?? []),
      latitude: map['latitude']?.toDouble() ?? 0.0,
      longitude: map['longitude']?.toDouble() ?? 0.0,
      tingkatKerusakan: map['tingkatKerusakan'],
      uid: map['uid'],
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'nomorKK': nomorKK,
      'nik': nik,
      'namaPemilik': namaPemilik,
      'rt': rt,
      'rw': rw,
      'jenisRumah': jenisRumah,
      //'id': id,
      'alamat': alamat,
      'luas': luas,
      'imageUrls': imageUrls,
      'latitude': latitude,
      'longitude': longitude,
      'tingkatKerusakan': tingkatKerusakan,
      'uid': uid,
    };
  }
}
