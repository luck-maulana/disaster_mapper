import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/pendataan_controller.dart';

class PendataanPreview extends StatelessWidget {
  final PendataanController pendataanController =
      Get.find<PendataanController>();

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        AlertDialog(
          title: Text('Data Preview'),
          content: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                Text('Nomor KK: ${pendataanController.nomorKK.value}'),
                Text('NIK: ${pendataanController.nik.value}'),
                Text('Nama Pemilik: ${pendataanController.namaPemilik.value}'),
                Text('RT: ${pendataanController.rt.value}'),
                Text('RW: ${pendataanController.rw.value}'),
                Text('Jenis Rumah: ${pendataanController.jenisRumah.value}'),
                Text('Alamat: ${pendataanController.alamat.value}'),
                Text('Luas Rumah: ${pendataanController.luas.value} m²'),
                Text(
                    'Latitude: ${pendataanController.myLocation.value?.latitude ?? ""}'),
                Text(
                    'Longitude: ${pendataanController.myLocation.value?.longitude ?? ""}'),
                // Add additional fields as needed
              ],
            ),
          ),
          actions: [
            TextButton(
              onPressed: () {
                Get.back();
                Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
              },
              child: Text('Cancel'),
            ),
            ElevatedButton(
              onPressed: () {
                pendataanController.saveData();
                Navigator.of(Get.overlayContext!, rootNavigator: true).pop();
              },
              child: Text('Save'),
            ),
          ],
        ),
      ],
    );
  }
}
