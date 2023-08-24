import 'dart:async';
import 'dart:convert';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import '../../../controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';
import '../../utils/theme.dart';
import '../models/pendataan_model.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'package:image_picker/image_picker.dart';
import 'package:firebase_storage/firebase_storage.dart' as firebase_storage;
import 'package:google_maps_flutter/google_maps_flutter.dart';

class PendataanController extends GetxController {
  AuthController authController = Get.find();

  final CollectionReference pendataanCollection =
      FirebaseFirestore.instance.collection('pendataan');

  final CollectionReference dataKabupatenCollection =
      FirebaseFirestore.instance.collection('data_kabupaten');

  final CollectionReference dataKecamatanCollection =
      FirebaseFirestore.instance.collection('data_kecamatan');

  final CollectionReference desaDataCollection =
      FirebaseFirestore.instance.collection('data_desa');
  double get width => Get.width;
  RxString nomorKK = ''.obs;
  RxString nik = ''.obs;
  RxString namaPemilik = ''.obs;
  RxString rt = ''.obs;
  RxString rw = ''.obs;

  RxList<dynamic> provinsiList = <dynamic>[].obs;
  RxList<dynamic> kabupatenList = <dynamic>[].obs;
  RxList<dynamic> kecamatanList = <dynamic>[].obs;
  RxList<dynamic> desaList = <dynamic>[].obs;
  RxString selectedProvinsi = ''.obs;
  RxString selectedKabupaten = ''.obs;
  RxString selectedKecamatan = ''.obs;
  RxString selectedDesa = ''.obs;
  RxString jenisRumah = ''.obs;
  RxString alamat = ''.obs;
  RxInt luas = 0.obs;
  RxBool isLoading = false.obs;
  RxBool isSaving = false.obs;

  RxString tingkatKerusakan = ''.obs;

  RxList<File?> selectedImages = <File?>[].obs;
  RxString imageUrl = ''.obs;

  RxBool isMarkerSet = false.obs;
  Rx<LatLng?> selectedMarkerLocation = Rx<LatLng?>(null);
  RxDouble tempLongitude = RxDouble(0.0);
  RxDouble tempLatitude = RxDouble(0.0);

  final Rx<LatLng?> myLocation = Rx<LatLng?>(null);
  final Set<Marker> markers = <Marker>{};

  int _sequentialNumber = 1;
  DateTime _lastDate = DateTime.now();

  RxList<Pendataan> _pendataanList = <Pendataan>[].obs;

  List<Pendataan> get pendataanList => _pendataanList;

  String getSelectedProvinsiName() {
    final selectedProvinsiId = selectedProvinsi.value;
    final selectedProvinsiItem = provinsiList.firstWhere(
        (item) => item['id'] == selectedProvinsiId,
        orElse: () => null);
    return selectedProvinsiItem != null ? selectedProvinsiItem['name'] : '';
  }

  String getSelectedKabupatenName() {
    final selectedKabupatenId = selectedKabupaten.value;
    final selectedKabupatenItem = kabupatenList.firstWhere(
        (item) => item['id'] == selectedKabupatenId,
        orElse: () => null);
    return selectedKabupatenItem != null ? selectedKabupatenItem['name'] : '';
  }

  String getSelectedKecamatanName() {
    final selectedKecamatanId = selectedKecamatan.value;
    final selectedKecamatanItem = kecamatanList.firstWhere(
        (item) => item['id'] == selectedKecamatanId,
        orElse: () => null);
    return selectedKecamatanItem != null ? selectedKecamatanItem['name'] : '';
  }

  String getSelectedDesaName() {
    final selectedDesaId = selectedDesa.value;
    final selectedDesaItem = desaList
        .firstWhere((item) => item['id'] == selectedDesaId, orElse: () => null);
    return selectedDesaItem != null ? selectedDesaItem['name'] : '';
  }

  void setTingkatKerusakan(String value) {
    tingkatKerusakan.value = value;
  }

  Future<void> selectImages() async {
    final List<XFile>? pickedFiles = await ImagePicker().pickMultiImage(
      imageQuality: 80,
    );
    if (pickedFiles != null) {
      for (final pickedFile in pickedFiles) {
        final File? image = File(pickedFile.path);
        if (image != null) {
          selectedImages.add(image);
        }
      }
    }
  }

  void selectImageFromCamera() async {
    final XFile? pickedFile = await ImagePicker().pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );
    if (pickedFile != null) {
      final File? image = File(pickedFile.path);
      if (image != null) {
        selectedImages.add(image);
      }
    }
  }

  void showImageSourceDialog() {
    showDialog(
      context: Get.overlayContext!,
      builder: (_) => AlertDialog(
        title: Text('Pilih Sumber Gambar'),
        content: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            ListTile(
              leading: Icon(Icons.camera_alt),
              title: Text('Ambil Foto dari Kamera'),
              onTap: () {
                Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
                selectImageFromCamera();
              },
            ),
            ListTile(
              leading: Icon(Icons.photo),
              title: Text('Pilih Foto dari Galeri'),
              onTap: () {
                Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
                selectImages();
              },
            ),
          ],
        ),
      ),
    );
  }

  void removeImage(File image) {
    selectedImages.remove(image);
  }

  void setNomorKK(String value) {
    nomorKK.value = value;
  }

  void setNIK(String value) {
    nik.value = value;
  }

  void setNamaPemilik(String value) {
    namaPemilik.value = value;
  }

  void setRT(String value) {
    rt.value = value;
  }

  void setRW(String value) {
    rw.value = value;
  }

  void setJenisRumah(String value) {
    jenisRumah.value = value;
  }

  void setAlamat(String value) {
    alamat.value = value;
  }

  void setLuas(int value) {
    luas.value = value;
  }

  Future<void> updatedataKabupaten(
      String kabupaten, String tingkatKerusakan) async {
    try {
      final docRef = dataKabupatenCollection.doc(kabupaten);
      final docSnapshot = await docRef.get();

      if (!docSnapshot.exists) {
        final initialCounts = {
          'ringan': 0,
          'sedang': 0,
          'berat': 0,
          'total': 0,
        };
        await docRef.set(initialCounts);
      }

      final docData = await docRef.get();
      final int ringanCount = docData['ringan'] ?? 0;
      final int sedangCount = docData['sedang'] ?? 0;
      final int beratCount = docData['berat'] ?? 0;
      final int total = 1 + ringanCount + sedangCount + beratCount;
      await docRef.update({'total': total});

      final kerusakanField = tingkatKerusakan.toLowerCase();
      await docRef.update({kerusakanField: FieldValue.increment(1)});

      final String documentId = docRef.id;
      await docRef.update({'selectedKabupaten': documentId});
    } catch (error) {
      print('Error updating kerusakan count: $error');
    }
  }

  Future<void> fetchDataByKabupaten(String kabupaten) async {
    try {
      final querySnapshot = await pendataanCollection
          .where('selectedKabupaten', isEqualTo: kabupaten)
          .get();

      querySnapshot.docs.forEach((doc) {
        print('Nomor KK: ${doc['nomorKK']}');
        print('NIK: ${doc['nik']}');
        print('Selected Provinsi: ${doc['selectedProvinsi']}');
      });
    } catch (error) {
      print('Error fetching data for kabupaten: $error');
    }
  }

  Future<void> updatedataKecamatan(
      String kecamatan, String tingkatKerusakan) async {
    try {
      final docRef = dataKecamatanCollection.doc(kecamatan);
      final docSnapshot = await docRef.get();

      if (!docSnapshot.exists) {
        final initialCounts = {
          'ringan': 0,
          'sedang': 0,
          'berat': 0,
          'total': 0,
        };
        await docRef.set(initialCounts);
      }

      final docData = await docRef.get();
      final int ringanCount = docData['ringan'] ?? 0;
      final int sedangCount = docData['sedang'] ?? 0;
      final int beratCount = docData['berat'] ?? 0;
      final int total = 1 + ringanCount + sedangCount + beratCount;
      await docRef.update({'total': total});

      final kerusakanField = tingkatKerusakan.toLowerCase();
      await docRef.update({kerusakanField: FieldValue.increment(1)});

      final String documentId = docRef.id;
      await docRef.update({'selectedKecamatan': documentId});
    } catch (error) {
      print('Error updating kecamatan data: $error');
    }
  }

  Future<void> fetchDataByKecamatan(String kecamatan) async {
    try {
      final querySnapshot = await pendataanCollection
          .where('selectedKecamatan', isEqualTo: kecamatan)
          .get();

      querySnapshot.docs.forEach((doc) {
        print('Nomor KK: ${doc['nomorKK']}');
        print('NIK: ${doc['nik']}');
        print('Selected Provinsi: ${doc['selectedProvinsi']}');
      });
    } catch (error) {
      print('Error fetching data for kecamatan: $error');
    }
  }

  Future<void> updatedataDesa(String desa, String tingkatKerusakan) async {
    try {
      final docRef = desaDataCollection.doc(desa);
      final docSnapshot = await docRef.get();

      if (!docSnapshot.exists) {
        final initialCounts = {
          'ringan': 0,
          'sedang': 0,
          'berat': 0,
          'total': 0,
        };
        await docRef.set(initialCounts);
      }

      final docData = await docRef.get();
      final int ringanCount = docData['ringan'] ?? 0;
      final int sedangCount = docData['sedang'] ?? 0;
      final int beratCount = docData['berat'] ?? 0;
      final int total = 1 + ringanCount + sedangCount + beratCount;
      await docRef.update({'total': total});

      final kerusakanField = tingkatKerusakan.toLowerCase();
      await docRef.update({kerusakanField: FieldValue.increment(1)});
      final String documentId = docRef.id;
      await docRef.update({'selectedDesa': documentId});
    } catch (error) {
      print('Error updating desa data: $error');
    }
  }

  Future<void> fetchDataByDesa(String desa) async {
    try {
      final querySnapshot = await pendataanCollection
          .where('selectedDesa', isEqualTo: desa)
          .get();
      querySnapshot.docs.forEach((doc) {
        print('Nomor KK: ${doc['nomorKK']}');
        print('NIK: ${doc['nik']}');
        print('Selected Provinsi: ${doc['selectedProvinsi']}');
      });
    } catch (error) {
      print('Error fetching data for desa: $error');
    }
  }

  Future<void> saveData() async {
    if (nomorKK.value.isEmpty ||
        nomorKK.value.length != 16 ||
        nik.value.isEmpty ||
        nik.value.length != 16 ||
        namaPemilik.value.isEmpty ||
        rt.value.isEmpty ||
        rw.value.isEmpty ||
        selectedProvinsi.value.isEmpty ||
        selectedKabupaten.value.isEmpty ||
        selectedKecamatan.value.isEmpty ||
        selectedDesa.value.isEmpty ||
        jenisRumah.value.isEmpty ||
        alamat.value.isEmpty ||
        luas.value == 0 ||
        selectedImages.isEmpty) {
      if (nomorKK.value.length != 16 || nik.value.length != 16) {
        Get.snackbar(
          "Terjadi Kesalahan",
          "Nomor KK dan NIK harus memiliki 16 karakter.",
          colorText: Colors.white,
          backgroundColor: kRedColor,
          duration: Duration(seconds: 3),
          snackPosition: SnackPosition.TOP,
          margin: EdgeInsets.all(16.0),
        );
        return;
      }

      Get.snackbar(
        "Terjadi Kesalahan",
        "Semua Masukan Harus Terisi. Tidak Boleh Terlewat",
        colorText: Colors.white,
        backgroundColor: kRedColor,
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.all(16.0),
      );
      return;
    }

    Get.dialog(
      Scaffold(
        appBar: AppBar(
          backgroundColor: kBlackColor,
          centerTitle: true,
          title: Text(
            'PREVIEW DATA',
            style: orangeRedTextstyle.copyWith(
              fontWeight: bold,
            ),
          ),
          leading: IconButton(
            onPressed: () {
              Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
              Get.focusScope!.unfocus();
            },
            icon: Icon(Icons.arrow_back),
          ),
          automaticallyImplyLeading: false,
        ),
        backgroundColor: Colors.white,
        body: Column(
          children: [
            Expanded(
              child: SingleChildScrollView(
                child: Container(
                  width: Get.mediaQuery.size.width,
                  child: Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      children: [
                        Text(
                          'No. Kartu Keluarga',
                          style: blackTextStyle.copyWith(
                            fontSize: width / 20.7,
                            fontWeight: bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                          ),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: kBlackColor,
                              width: 1,
                            ),
                          ),
                          child: Text('${nomorKK.value}'),
                        ),
                        Text(
                          'No. Induk Kependudukan',
                          style: blackTextStyle.copyWith(
                            fontSize: width / 20.7,
                            fontWeight: bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                          ),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: kBlackColor,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            '${nik.value}',
                            style: blackTextStyle.copyWith(
                                fontSize: width / 25.875),
                          ),
                        ),
                        Text(
                          'Nama Pemilik',
                          style: blackTextStyle.copyWith(
                            fontSize: width / 20.7,
                            fontWeight: bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                          ),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: kBlackColor,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            '${namaPemilik.value}',
                            style: blackTextStyle.copyWith(
                                fontSize: width / 25.875),
                          ),
                        ),
                        Text(
                          'Alamat Lengkap',
                          style: blackTextStyle.copyWith(
                            fontSize: width / 20.7,
                            fontWeight: bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                          ),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: kBlackColor,
                              width: 1,
                            ),
                          ),
                          child: Obx(
                            () => Text(
                              '${alamat.value} RT ${rt.value} RW ${rw.value} DESA ${getSelectedDesaName()} KEC. ${getSelectedKecamatanName()} ${getSelectedKabupatenName()} PROV. ${getSelectedProvinsiName()}',
                              style: blackTextStyle.copyWith(
                                  fontSize: width / 25.875),
                            ),
                          ),
                        ),
                        Text(
                          'Jenis Rumah',
                          style: blackTextStyle.copyWith(
                            fontSize: width / 20.7,
                            fontWeight: bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                          ),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: kBlackColor,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            '${jenisRumah.value}',
                            style: blackTextStyle.copyWith(
                                fontSize: width / 25.875),
                          ),
                        ),
                        Text(
                          'Luas Rumah',
                          style: blackTextStyle.copyWith(
                            fontSize: width / 20.7,
                            fontWeight: bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                          ),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: kBlackColor,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            '${luas.value}',
                            style: blackTextStyle.copyWith(
                                fontSize: width / 25.875),
                          ),
                        ),
                        Text(
                          'Tingkat Kerusakan',
                          style: blackTextStyle.copyWith(
                            fontSize: width / 20.7,
                            fontWeight: bold,
                          ),
                        ),
                        Container(
                          margin: EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                          ),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: kBlackColor,
                              width: 1,
                            ),
                          ),
                          child: Text(
                            '${tingkatKerusakan.value}',
                            style: blackTextStyle.copyWith(
                                fontSize: width / 25.875),
                          ),
                        ),
                        Text(
                          'Foto Rumah',
                          style: blackTextStyle.copyWith(
                            fontSize: width / 20.7,
                            fontWeight: bold,
                          ),
                        ),
                        SizedBox(height: 10),
                        GridView.count(
                          crossAxisCount: 3,
                          shrinkWrap: true,
                          physics: NeverScrollableScrollPhysics(),
                          children:
                              List.generate(selectedImages.length, (index) {
                            return Image.file(selectedImages[index]!,
                                fit: BoxFit.cover);
                          }),
                        ),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            child: Text('Simpan'),
                            style: ElevatedButton.styleFrom(
                                backgroundColor: kOrangeRed),
                            onPressed: () {
                              Navigator.of(Get.overlayContext!,
                                      rootNavigator: true)
                                  .pop();
                              Get.focusScope!.unfocus();
                              saveDataFirebase();
                            },
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<void> saveDataFirebase() async {
    try {
      isSaving.value = true;
      isLoading.value = true;
      final List<firebase_storage.UploadTask> uploadTasks = [];
      final List<String> uploadedImageUrls = [];

      for (final image in selectedImages.value) {
        if (image != null) {
          final imageName =
              'pendataan/${DateTime.now().millisecondsSinceEpoch}.jpg';
          final firebaseStorageRef =
              firebase_storage.FirebaseStorage.instance.ref().child(imageName);
          final uploadTask = firebaseStorageRef.putFile(image);
          uploadTasks.add(uploadTask);

          final snapshot = await uploadTask;
          final imageUrl = await snapshot.ref.getDownloadURL();
          uploadedImageUrls.add(imageUrl);
        }
      }

      await Future.wait(uploadTasks);
      String? uid = authController.auth.currentUser?.uid ?? '';
      final newPendataan = Pendataan(
        nomorKK: nomorKK.value,
        nik: nik.value,
        namaPemilik: namaPemilik.value,
        rt: rt.value,
        rw: rw.value,
        jenisRumah: jenisRumah.value,
        alamat: alamat.value,
        luas: luas.value,
        imageUrls: uploadedImageUrls,
        latitude: isMarkerSet.value
            ? selectedMarkerLocation.value!.latitude
            : myLocation.value?.latitude ?? 0.0,
        longitude: isMarkerSet.value
            ? selectedMarkerLocation.value!.longitude
            : myLocation.value?.longitude ?? 0.0,
        tingkatKerusakan: tingkatKerusakan.value,
        uid: uid,
      );

      final documentReference =
          await pendataanCollection.add(newPendataan.toMap());

      final newDocumentId = documentReference.id;

      await documentReference.update({'id': newDocumentId});

      final selectedProvinsiName = provinsiList
          .firstWhere((item) => item['id'] == selectedProvinsi.value)['name'];
      final selectedKabupatenName = kabupatenList
          .firstWhere((item) => item['id'] == selectedKabupaten.value)['name'];
      final selectedKecamatanName = kecamatanList
          .firstWhere((item) => item['id'] == selectedKecamatan.value)['name'];
      final selectedDesaName = desaList
          .firstWhere((item) => item['id'] == selectedDesa.value)['name'];

      await documentReference.update({
        'selectedProvinsi': selectedProvinsiName,
        'selectedKabupaten': selectedKabupatenName,
        'selectedKecamatan': selectedKecamatanName,
        'selectedDesa': selectedDesaName,
        'rt': rt.value,
        'rw': rw.value,
        'jenisRumah': jenisRumah.value,
        'alamat': alamat.value,
        'luas': luas.value,
        'latitude': newPendataan.latitude,
        'longitude': newPendataan.longitude,
      });

      final kabupaten = getSelectedKabupatenName();
      if (kabupaten.isNotEmpty) {
        await updatedataKabupaten(kabupaten, tingkatKerusakan.value);
      }

      final kecamatan = getSelectedKecamatanName();
      if (kecamatan.isNotEmpty) {
        await updatedataKecamatan(kecamatan, tingkatKerusakan.value);
      }

      final desa = getSelectedDesaName();
      if (desa.isNotEmpty) {
        await updatedataDesa(desa, tingkatKerusakan.value);
      }

      clearFields();
      Get.snackbar('Sukses', 'Data Berhasil Disimpan');
      Get.offAllNamed(Routes.BOTTOM_USER);
    } catch (error) {
      Get.snackbar('Terjadi Kesalahan', 'Gagal Menyimpan Data');
    } finally {
      isSaving.value = false;
      isLoading.value = false;
    }
  }

  void clearFields() {
    nomorKK.value = '';
    nik.value = '';
    namaPemilik.value = '';
    rw.value = '';
    rt.value = '';
  }

  @override
  void onInit() {
    super.onInit();
    _lastDate = DateTime.now();
    _sequentialNumber = 1;
    fetchDataProvinsi();
    getCurrentLocation();
  }

  Future<void> fetchDataProvinsi() async {
    var url = Uri.https(
        'luck-maulana.github.io', '/api-wilayah-indonesia/api/provinces.json');

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var jawaBaratData =
            data.firstWhere((province) => province['id'] == '32');
        provinsiList.value = [jawaBaratData];
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchDataKabupaten(String provinceId) async {
    var url = Uri.https('luck-maulana.github.io',
        '/api-wilayah-indonesia/api/regencies/$provinceId.json');

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        var cianjurData = data.firstWhere((regency) => regency['id'] == '3203');
        kabupatenList.value = [cianjurData];
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchDataKecamatan(String regencyId) async {
    var url = Uri.https('luck-maulana.github.io',
        '/api-wilayah-indonesia/api/districts/$regencyId.json');

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        kecamatanList.value = data;
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> fetchDataDesa(String districtId) async {
    var url = Uri.https('luck-maulana.github.io',
        '/api-wilayah-indonesia/api/villages/$districtId.json');

    try {
      var response = await http.get(url);
      if (response.statusCode == 200) {
        var data = json.decode(response.body);
        desaList.value = data;
      }
    } catch (e) {
      print('Error: $e');
    }
  }

  Future<void> getCurrentLocation() async {
    var locationPermission = await Geolocator.checkPermission();
    if (locationPermission == LocationPermission.denied) {
      locationPermission = await Geolocator.requestPermission();
      if (locationPermission != LocationPermission.whileInUse &&
          locationPermission != LocationPermission.always) {
        return;
      }
    }

    var currentLocation = await Geolocator.getCurrentPosition(
      desiredAccuracy: LocationAccuracy.lowest,
    );

    myLocation.value =
        LatLng(currentLocation.latitude, currentLocation.longitude);
    markers.add(
      Marker(
        markerId: const MarkerId('My Position'),
        position: myLocation.value!,
        draggable: true,
        onDragEnd: (LatLng newPosition) {
          myLocation.value = newPosition;
          isMarkerSet.value = true;
          selectedMarkerLocation.value = newPosition;
        },
      ),
    );

    print('Lat : ${currentLocation.latitude}');
    print('Lon : ${currentLocation.longitude}');
  }

  void setMarkerPosition(LatLng newPosition) {
    if (isMarkerSet.value) {
      selectedMarkerLocation.value = newPosition;
    } else {
      markers.clear();
      markers.add(
        Marker(
          markerId: const MarkerId('Custom Position'),
          position: newPosition,
          draggable: true,
          onDragEnd: (LatLng newPosition) {
            myLocation.value = newPosition;
            isMarkerSet.value = true;
            selectedMarkerLocation.value = newPosition;
          },
        ),
      );
      isMarkerSet.value = true;
    }
  }

  void moveMarker() {
    if (isMarkerSet.value) {
      markers.clear();
      markers.add(
        Marker(
          markerId: const MarkerId('Custom Position'),
          position: selectedMarkerLocation.value!,
          draggable: true,
          onDragEnd: (LatLng newPosition) {
            selectedMarkerLocation.value = newPosition;
          },
        ),
      );
      isMarkerSet.value = false;
    }
  }

  void editMarker() {
    if (isMarkerSet.value) {
      isMarkerSet.value = true;
      Get.snackbar('Edit Marker', 'Pindahkan Marker');
    } else {
      Get.snackbar(
          'Terjadi Kesalahan', 'Mohon Dipilih Marker Lokasi Terlebih Dahulu');
    }
  }

  Future<void> fetchDataSorted() async {
    try {
      final querySnapshot = await pendataanCollection
          .orderBy('nomorKK')
          .orderBy('nik')
          .orderBy('selectedProvinsi')
          .orderBy('selectedKabupaten')
          .orderBy('selectedKecamatan')
          .orderBy('selectedDesa')
          .orderBy('rt')
          .orderBy('rw')
          .orderBy('jenisRumah')
          .orderBy('luasRumah')
          .get();

      querySnapshot.docs.forEach((doc) {
        print('Nomor KK: ${doc['nomorKK']}');
        print('NIK: ${doc['nik']}');
        print('Selected Provinsi: ${doc['selectedProvinsi']}');
      });
    } catch (error) {
      print('Error: $error');
    }
  }
}
