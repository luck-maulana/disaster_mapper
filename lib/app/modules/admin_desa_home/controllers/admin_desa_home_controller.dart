import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:excel/excel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';
import 'package:path/path.dart' as path;

import '../../../data/data_collection.dart';

class AdminDesaHomeController extends GetxController {
  RxList<PendataanData> pendataanList = RxList<PendataanData>();
  final TextEditingController searchController = TextEditingController();

  final RxList<PendataanData> searchResults = RxList<PendataanData>();

  void updateSearchResults(List<PendataanData> searchData) {
    searchResults.assignAll(searchData);
  }

  void clearSearchResults() {
    searchResults.clear();
  }

  Future<void> fetchPendataanByDesa(String selectedDesa) async {
    try {
      // Perform a query to filter pendataan by selectedDesa
      QuerySnapshot<Map<String, dynamic>> querySnapshot =
          await FirebaseFirestore.instance
              .collection('pendataan')
              .where('selectedDesa', isEqualTo: selectedDesa)
              .get();

      List<PendataanData> pendataanDataList = querySnapshot.docs
          .map((doc) => PendataanData.fromMap(doc.data()))
          .toList();

      pendataanList.assignAll(pendataanDataList);
    } catch (e) {
      print('Error fetching pendataan data: $e');
    }
  }

  void exportToExcel(BuildContext context, List<PendataanData> data) async {
    // Create an Excel workbook and sheet
    var excel = Excel.createExcel();
    var sheet = excel['Pendataan Data'];

    // Define column headers
    sheet.appendRow([
      'Nomor KK',
      'NIK',
      'Nama Pemilik',
      'RT',
      'RW',
      'Jenis Rumah',
      'Alamat',
      'Luas',
      'Latitude',
      'Longitude',
      'Tingkat Kerusakan',
      'Provinsi',
      'Kabupaten',
      'Kecamatan',
      'Desa',
    ]);

    for (var pendataanData in data) {
      sheet.appendRow([
        pendataanData.nomorKK,
        pendataanData.nik,
        pendataanData.namaPemilik,
        pendataanData.rt,
        pendataanData.rw,
        pendataanData.jenisRumah,
        pendataanData.alamat,
        pendataanData.luas,
        pendataanData.latitude,
        pendataanData.longitude,
        pendataanData.tingkatKerusakan,
        pendataanData.selectedProvinsi,
        pendataanData.selectedKabupaten,
        pendataanData.selectedKecamatan,
        pendataanData.selectedDesa,
      ]);
    }

    var excelData = excel.save(fileName: 'pendataan_data.xlsx');
    if (excelData != null) {
      var directory = await getExternalStorageDirectory();
      var filePath = path.join(directory!.path, 'pendataan_data.xlsx');
      File(filePath).writeAsBytesSync(excelData);

      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text(
              'Data exported to Excel file and saved in the downloads folder'),
          duration: Duration(seconds: 3),
        ),
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Failed to export data to Excel file'),
          duration: Duration(seconds: 3),
        ),
      );
    }
  }
}
