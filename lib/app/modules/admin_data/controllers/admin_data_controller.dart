import 'dart:convert';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../../data/admin_desa.dart';
import '../../../data/data_collection.dart';
import 'package:http/http.dart' as http;

import '../../../routes/app_pages.dart';

class AdminDataController extends GetxController {
  AuthController authController = Get.find();

  final CollectionReference usersCollection =
      FirebaseFirestore.instance.collection('users');

  final CollectionReference<Map<String, dynamic>> pendataanCollection =
      FirebaseFirestore.instance.collection('pendataan');

  var obscureText = true.obs;

  RxList<PendataanData> pendataanList = <PendataanData>[].obs;

  final TextEditingController usernameController = TextEditingController();
  final TextEditingController emailController = TextEditingController();
  final TextEditingController passwordController = TextEditingController();

  final TextEditingController selectedDesaController = TextEditingController();

  final RxList<PendataanData> searchResults = RxList<PendataanData>();

  void updateSearchResults(List<PendataanData> searchData) {
    searchResults.assignAll(searchData);
  }

  void clearSearchResults() {
    searchResults.clear();
  }

  final TextEditingController searchController = TextEditingController();

  RxBool isLoading = true.obs;

  RxString username = ''.obs;
  RxString email = ''.obs;
  RxString password = ''.obs;
  RxString role = ''.obs;
  RxString photoURL = ''.obs;
  RxString selectedDesa = ''.obs;
  RxString selectedKecamatan = ''.obs;
  RxString selectedKabupaten = ''.obs;
  RxString selectedProvinsi = ''.obs;

  RxList<dynamic> provinsiList = <dynamic>[].obs;
  RxList<dynamic> kabupatenList = <dynamic>[].obs;
  RxList<dynamic> kecamatanList = <dynamic>[].obs;
  RxList<dynamic> desaList = <dynamic>[].obs;

  void fetchPendataanData2() async {
    try {
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await pendataanCollection.get();
      if (querySnapshot.docs.isNotEmpty) {
        pendataanList.value = querySnapshot.docs
            .map((doc) => PendataanData.fromMap(doc.data()))
            .toList();
      }
    } catch (e) {
      print("Error fetching pendataan data: $e");
    }
  }

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

  @override
  void onInit() {
    super.onInit();
    fetchPendataanData();
    fetchPendataanData2();
    fetchDataProvinsi();
  }

  Future<void> fetchPendataanData() async {
    try {
      final querySnapshot =
          await FirebaseFirestore.instance.collection('pendataan').get();

      final List<PendataanData> tempData = [];
      querySnapshot.docs.forEach((doc) {
        tempData.add(PendataanData.fromMap(doc.data()));
      });

      pendataanList.assignAll(tempData);
    } catch (error) {
      print('Error fetching pendataan data: $error');
    } finally {
      isLoading.value = false;
    }
  }

  Future<void> saveData() async {
    if (username.value.isEmpty ||
        email.value.isEmpty ||
        password.value.isEmpty ||
        selectedProvinsi.value.isEmpty ||
        selectedKabupaten.value.isEmpty ||
        selectedKecamatan.value.isEmpty ||
        selectedDesa.value.isEmpty) {
      Get.snackbar(
          'Error', 'Please complete all fields before saving the data');
      return;
    }
    try {
      final List<String> uploadedImageUrls = [];

      String? uid = authController.auth.currentUser?.uid ?? '';
      final newPendataan = AdminDesa(
        username: username.value,
        email: email.value,
        password: password.value,
        role: role.value,
        uid: uid,
        createdAt: DateTime.timestamp(),
        selectedKabupaten: selectedKabupaten.value,
      );

      final documentReference = await usersCollection.add(newPendataan.toMap());

      final selectedDesaName = desaList
          .firstWhere((item) => item['id'] == selectedDesa.value)['name'];
      final selectedKabupatenName = kabupatenList
          .firstWhere((item) => item['id'] == selectedKabupaten.value)['name'];

      await documentReference.update({
        'username': username.value,
        'email': email.value,
        'password': password.value,
        'role': 'admindesa',
        'selectedDesa': selectedDesaName,
        'selectedKabupaten': selectedKabupatenName,
        'uid': uid,
        'photoUrl': '',
      });

      // clearFields();
      Get.snackbar('Success', 'Data saved successfully');
      Get.offAllNamed(Routes.ADMIN_HOME);
    } catch (error) {
      Get.snackbar('Error', 'Failed to save data');
    } finally {
      // isSaving.value = false;
      isLoading.value = false;
    }
  }
}
