import 'package:disaster_mapper/app/modules/bottom_admin_desa/controllers/bottom_admin_desa_controller.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../bottom_user/controllers/bottom_user_controller.dart';
import '../../utils/theme.dart';
import '../controllers/pendataan_controller.dart';

class PendataanView extends StatelessWidget {
  final PendataanController pendataanController =
      Get.put(PendataanController());
  final controller = Get.put(PendataanController());
  final BottomAdminDesaController bottomC =
      Get.put(BottomAdminDesaController());
  final BottomUserController bottomUser = Get.put(BottomUserController());

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final RxBool isDialogVisible = false.obs;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlackColor,
        centerTitle: true,
        title: Text(
          'PENDATAAN',
          style: orangeRedTextstyle.copyWith(),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(Icons.arrow_back),
        ),
      ),
      body: Obx(
        () => Stack(
          children: [
            SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.all(24.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Text(
                      'No. Kartu Keluarga',
                      style: blackTextStyle.copyWith(
                        fontSize: width / 20.7,
                        fontWeight: bold,
                      ),
                    ),
                    NoKK(pendataanController: pendataanController),
                    SizedBox(height: 16.0),
                    Text(
                      'No. Induk Kependudukan',
                      style: blackTextStyle.copyWith(
                        fontSize: width / 20.7,
                        fontWeight: bold,
                      ),
                    ),
                    NIK(pendataanController: pendataanController),
                    SizedBox(height: 16.0),
                    Text(
                      'Nama Pemilik',
                      style: blackTextStyle.copyWith(
                        fontSize: width / 20.7,
                        fontWeight: bold,
                      ),
                    ),
                    NamaPemilik(pendataanController: pendataanController),
                    SizedBox(height: 16.0),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Provinsi',
                          style: blackTextStyle.copyWith(
                            fontSize: width / 20.7,
                            fontWeight: bold,
                          ),
                        ),
                        Provinsi(controller: controller),
                        const SizedBox(height: 16.0),
                        Text(
                          'Kabupaten/Kota',
                          style: blackTextStyle.copyWith(
                            fontSize: width / 20.7,
                            fontWeight: bold,
                          ),
                        ),
                        KabupatenKota(controller: controller),
                        const SizedBox(height: 16.0),
                        Text(
                          'Kecamatan',
                          style: blackTextStyle.copyWith(
                            fontSize: width / 20.7,
                            fontWeight: bold,
                          ),
                        ),
                        Kecamatan(controller: controller),
                        SizedBox(height: 16.0),
                        Text(
                          'Desa',
                          style: blackTextStyle.copyWith(
                            fontSize: width / 20.7,
                            fontWeight: bold,
                          ),
                        ),
                        Desa(controller: controller),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Alamat',
                      style: blackTextStyle.copyWith(
                        fontSize: width / 20.7,
                        fontWeight: bold,
                      ),
                    ),
                    Alamat(pendataanController: pendataanController),
                    SizedBox(height: 16.0),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            'RT',
                            style: blackTextStyle.copyWith(
                              fontSize: width / 20.7,
                              fontWeight: bold,
                            ),
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          '/',
                          style: blackTextStyle.copyWith(
                            fontSize: width / 20.7,
                            fontWeight: bold,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: Text(
                            'RW',
                            style: blackTextStyle.copyWith(
                              fontSize: width / 20.7,
                              fontWeight: bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Expanded(
                          child: RT(pendataanController: pendataanController),
                        ),
                        SizedBox(width: 8.0),
                        Text(
                          '/',
                          style: blackTextStyle.copyWith(
                            fontSize: width / 20.7,
                            fontWeight: bold,
                          ),
                        ),
                        SizedBox(width: 8.0),
                        Expanded(
                          child: RW(pendataanController: pendataanController),
                        ),
                      ],
                    ),
                    SizedBox(height: 16.0),
                    Text(
                      'Jenis Rumah',
                      style: blackTextStyle.copyWith(
                        fontSize: width / 20.7,
                        fontWeight: bold,
                      ),
                    ),
                    SizedBox(height: 16.0),
                    JenisRumah(pendataanController: pendataanController),
                    SizedBox(height: 16.0),
                    Text(
                      'Luas Rumah',
                      style: blackTextStyle.copyWith(
                        fontSize: width / 20.7,
                        fontWeight: bold,
                      ),
                    ),
                    LuasRumah(pendataanController: pendataanController),
                    SizedBox(height: 16.0),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kOrangeRed,
                      ),
                      onPressed: () =>
                          pendataanController.showImageSourceDialog(),
                      child: Text(
                        'Foto',
                        style: whiteTextStyle.copyWith(
                          fontSize: width / 25.875,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                    Foto(pendataanController: pendataanController),
                    SizedBox(height: 16.0),
                    Text(
                      'Latitude & Longitude',
                      style: blackTextStyle.copyWith(
                        fontSize: width / 20.7,
                        fontWeight: bold,
                      ),
                    ),
                    LatLong(controller: controller),
                    SizedBox(
                      height: width / 1.38,
                      child: GoogleMap(
                        initialCameraPosition: CameraPosition(
                          target: controller.myLocation.value ??
                              const LatLng(-6.820762, 107.142960),
                          zoom: 18,
                        ),
                        markers: controller.markers,
                        myLocationEnabled: true,
                        myLocationButtonEnabled: true,
                        gestureRecognizers: <Factory<
                            OneSequenceGestureRecognizer>>{
                          Factory<OneSequenceGestureRecognizer>(
                            () => EagerGestureRecognizer(),
                          ),
                        },
                        onMapCreated: (GoogleMapController controller) {},
                        onTap: (LatLng newPosition) {
                          controller.markers.clear();
                          controller.markers.add(
                            Marker(
                              markerId: const MarkerId('Custom Position'),
                              position: newPosition,
                              draggable: true,
                              onDragEnd: (LatLng newPosition) {
                                controller.myLocation.value = newPosition;
                              },
                            ),
                          );
                        },
                        onCameraMove: (CameraPosition newPosition) {
                          controller.myLocation.value = newPosition.target;
                          controller.markers.clear();
                          controller.markers.add(
                            Marker(
                              markerId: const MarkerId('Custom Position'),
                              position: controller.myLocation.value!,
                              draggable: true,
                              onDragEnd: (LatLng newPosition) {
                                controller.myLocation.value = newPosition;
                              },
                            ),
                          );
                        },
                      ),
                    ),
                    SizedBox(height: 16.0),
                    Column(
                      children: [
                        GestureDetector(
                          onTap: () {
                            Get.dialog(
                              AlertDialog(
                                title: Text('Kerusakan Ringan'),
                                titleTextStyle: blackTextStyle.copyWith(
                                    fontSize: width / 20.7, fontWeight: bold),
                                contentTextStyle: blackTextStyle.copyWith(
                                  fontSize: width / 25.875,
                                ),
                                content: Text(
                                    '''1. Bangunan masih berdiri dengan retak-retak pada dinding plesteran, 
2. Penutup atap/genteng lepas atau ada yang runtuh, 
3. Sebagian penutup langit-langit rusak,
4. Instalasi listrik rusak sebagian, 
5. Pintu jendela rusak sebagian, 
6. Pondasi, kolom, dan balok tidak rusak secara fisik 
7. Kondisi kerusakan kurang dari 30%'''),
                              ),
                            );
                            isDialogVisible.value = true;
                            Future.delayed(Duration(seconds: 5), () {
                              isDialogVisible.value = false;
                            });
                          },
                          child: Container(
                            height: width / 7.52727,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: kBlackColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            pendataanController
                                                .setTingkatKerusakan('ringan');
                                          },
                                          child: Container(
                                            height: 22,
                                            width: 22,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: pendataanController
                                                          .tingkatKerusakan
                                                          .value ==
                                                      'ringan'
                                                  ? kOrangeRed
                                                  : kWhiteColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Ringan',
                                    style: whiteTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.dialog(
                              AlertDialog(
                                title: Text('Kerusakan Sedang'),
                                titleTextStyle: blackTextStyle.copyWith(
                                    fontSize: width / 20.7, fontWeight: bold),
                                contentTextStyle: blackTextStyle.copyWith(
                                  fontSize: width / 25.875,
                                ),
                                content: Text(
                                    '''1. Bangunan masih berdiri, namun sebagian kecil komponen rusak, 
2. Struktur dan komponen arsitektural rusak,
3. Sebagian rangka atap patah atau runtuh, 
4. Balok dan kolom sebagian kecil patah, 
5. Sebagian dinding rusak,
6. Sebagian penutup/rangka langit-langit lepas, 
7. Sebagian instalasi rusak atau terputus, 
8. Pintu/jendela rusak sebagian, 
9. Tulangan pada struktur masih utuh, 
10. Instalasi plumbing ada yang rusak, 
11. secara fisik kerusakan berkisar antara 30% hingga 70%.'''),
                              ),
                            );
                            isDialogVisible.value = true;
                            Future.delayed(Duration(seconds: 5), () {
                              isDialogVisible.value = false;
                            });
                          },
                          child: Container(
                            height: width / 7.52727,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: kBlackColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            pendataanController
                                                .setTingkatKerusakan('sedang');
                                          },
                                          child: Container(
                                            height: 22,
                                            width: 22,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: pendataanController
                                                          .tingkatKerusakan
                                                          .value ==
                                                      'sedang'
                                                  ? kOrangeRed
                                                  : kWhiteColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Sedang',
                                    style: whiteTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        SizedBox(
                          height: 16,
                        ),
                        GestureDetector(
                          onTap: () {
                            Get.dialog(
                              AlertDialog(
                                title: Text('Kerusakan Berat'),
                                titleTextStyle: blackTextStyle.copyWith(
                                    fontSize: width / 20.7, fontWeight: bold),
                                contentTextStyle: blackTextStyle.copyWith(
                                  fontSize: width / 25.875,
                                ),
                                content: Text(
                                  '''1. Bangunan roboh, 
2. atap runtuh, 
3. sebagian besar kolom, 
4. balok, dan dinding rusak lebih dari 50%, 
5. sebagian dinding dan langit-langit roboh, 
6. instalasi listrik rusak total, 
7. pintu/jendela rusak total, 
8.instalasi plumbing rusak, 
9. secara fisik kondisi kerusakan lebih dari 70%.''',
                                ),
                              ),
                            );
                            isDialogVisible.value = true;
                            Future.delayed(Duration(seconds: 5), () {
                              isDialogVisible.value = false;
                            });
                          },
                          child: Container(
                            height: width / 7.52727,
                            width: double.infinity,
                            decoration: BoxDecoration(
                              color: kBlackColor,
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                              children: [
                                Expanded(
                                  child: Padding(
                                    padding: const EdgeInsets.only(left: 20),
                                    child: Row(
                                      mainAxisAlignment:
                                          MainAxisAlignment.start,
                                      children: [
                                        GestureDetector(
                                          onTap: () {
                                            pendataanController
                                                .setTingkatKerusakan('berat');
                                          },
                                          child: Container(
                                            height: 22,
                                            width: 22,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: pendataanController
                                                          .tingkatKerusakan
                                                          .value ==
                                                      'berat'
                                                  ? kOrangeRed
                                                  : kWhiteColor,
                                            ),
                                          ),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                                Expanded(
                                  child: Text(
                                    'Berat',
                                    style: whiteTextStyle,
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(
                      height: 16,
                    ),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kOrangeRed,
                      ),
                      onPressed: pendataanController.saveData,
                      child: Text('Simpan'),
                    ),
                  ],
                ),
              ),
            ),
            if (pendataanController.isLoading.value ||
                pendataanController.isSaving.value)
              Container(
                color: Colors.black54,
                child: Center(
                  child: CircularProgressIndicator(),
                ),
              ),
          ],
        ),
      ),
    );
  }
}

class Foto extends StatelessWidget {
  const Foto({
    super.key,
    required this.pendataanController,
  });

  final PendataanController pendataanController;

  @override
  Widget build(BuildContext context) {
    return Obx(
      () => Wrap(
        spacing: 8.0,
        runSpacing: 8.0,
        children: pendataanController.selectedImages.map((image) {
          if (image != null) {
            return Stack(
              children: [
                InkWell(
                  onTap: () {
                    showDialog(
                      context: context,
                      builder: (_) => Dialog(
                        child: Image.file(image),
                      ),
                    );
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    child: Image.file(
                      image,
                      fit: BoxFit.cover,
                    ),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                    ),
                  ),
                ),
                Positioned(
                  top: 2.0,
                  right: 2.0,
                  child: IconButton(
                    icon: Icon(
                      Icons.delete,
                      color: kOrangeRed,
                    ),
                    onPressed: () {
                      pendataanController.removeImage(image);
                    },
                  ),
                ),
              ],
            );
          } else {
            return Container();
          }
        }).toList(),
      ),
    );
  }
}

class LatLong extends StatelessWidget {
  const LatLong({
    super.key,
    required this.controller,
  });

  final PendataanController controller;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
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
        '${controller.myLocation.value?.latitude ?? "Fetching..."} ${controller.myLocation.value?.longitude ?? "Fetching..."}',
        style: blackTextStyle.copyWith(
          fontSize: width / 29.5714,
        ),
      ),
    );
  }
}

class LuasRumah extends StatelessWidget {
  const LuasRumah({
    super.key,
    required this.pendataanController,
  });

  final PendataanController pendataanController;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
        top: 15,
        bottom: 15,
      ),
      padding: EdgeInsets.only(
        left: 16,
        right: 16,
      ),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: kBlackColor,
          width: 1,
        ),
      ),
      child: TextFormField(
        decoration: InputDecoration(
          hintText: 'Luas',
          hintStyle: greyTextStyle.copyWith(
            fontSize: width / 25.875,
            fontWeight: FontWeight.w600,
          ),
          suffixText: 'm²',
          border: InputBorder.none,
          suffixStyle: greyTextStyle.copyWith(
            fontSize: width / 25.875,
            fontWeight: FontWeight.w600,
          ),
        ),
        keyboardType: TextInputType.number,
        onChanged: (value) => pendataanController.setLuas(int.parse(value)),
      ),
    );
  }
}

class JenisRumah extends StatelessWidget {
  const JenisRumah({
    super.key,
    required this.pendataanController,
  });

  final PendataanController pendataanController;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Obx(
      () => Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  pendataanController.setJenisRumah('permanen');
                },
                child: Row(
                  children: [
                    Container(
                      width: 24,
                      height: 24,
                      decoration: BoxDecoration(
                        border: Border.all(color: kOrangeRed, width: 2),
                        shape: BoxShape.circle,
                        color:
                            pendataanController.jenisRumah.value == 'permanen'
                                ? kOrangeRed
                                : Colors.transparent,
                      ),
                      child: Center(
                        child: pendataanController.jenisRumah.value ==
                                'permanen'
                            ? Container(
                                width: 12,
                                height: 12,
                                decoration: BoxDecoration(
                                  border:
                                      Border.all(color: kOrangeRed, width: 2),
                                  shape: BoxShape.circle,
                                  color: kOrangeRed,
                                ),
                              )
                            : Container(),
                      ),
                    ),
                  ],
                ),
              ),
              SizedBox(width: 8),
              Text(
                'Permanen',
                style: blackTextStyle.copyWith(
                  fontSize: width / 25.875,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
          SizedBox(width: 16),
          Row(
            children: [
              GestureDetector(
                onTap: () {
                  pendataanController.setJenisRumah('semi permanen');
                },
                child: Container(
                  width: 24,
                  height: 24,
                  decoration: BoxDecoration(
                    shape: BoxShape.circle,
                    border: Border.all(color: kOrangeRed, width: 2),
                    color:
                        pendataanController.jenisRumah.value == 'semi permanen'
                            ? kOrangeRed
                            : Colors.transparent,
                  ),
                  child: Center(
                    child: pendataanController.jenisRumah.value ==
                            'semi permanen'
                        ? Container(
                            width: 12,
                            height: 12,
                            decoration: BoxDecoration(
                              border: Border.all(color: kOrangeRed, width: 2),
                              shape: BoxShape.circle,
                              color: kOrangeRed,
                            ),
                          )
                        : Container(),
                  ),
                ),
              ),
              SizedBox(width: 8),
              Text(
                'Semi Permanen',
                style: blackTextStyle.copyWith(
                  fontSize: width / 25.875,
                  fontWeight: semiBold,
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}

class RW extends StatelessWidget {
  const RW({
    super.key,
    required this.pendataanController,
  });

  final PendataanController pendataanController;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
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
      child: TextFormField(
        decoration: InputDecoration.collapsed(
          hintText: '000',
          hintStyle: greyTextStyle.copyWith(
            fontSize: width / 25.875,
            fontWeight: FontWeight.w600,
          ),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(3),
        ],
        onChanged: (value) => pendataanController.setRW(value),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class RT extends StatelessWidget {
  const RT({
    super.key,
    required this.pendataanController,
  });

  final PendataanController pendataanController;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
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
      child: TextFormField(
        decoration: InputDecoration.collapsed(
          hintText: '000',
          hintStyle: greyTextStyle.copyWith(
            fontSize: width / 25.875,
            fontWeight: FontWeight.w600,
          ),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(3),
        ],
        onChanged: (value) => pendataanController.setRT(value),
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class Alamat extends StatelessWidget {
  const Alamat({
    super.key,
    required this.pendataanController,
  });

  final PendataanController pendataanController;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
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
      child: TextFormField(
        autocorrect: false,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration.collapsed(
          hintText: 'Alamat',
          hintStyle: greyTextStyle.copyWith(
            fontSize: width / 25.875,
            fontWeight: FontWeight.w600,
          ),
        ),
        onChanged: (value) => pendataanController.setAlamat(value),
      ),
    );
  }
}

class Desa extends StatelessWidget {
  const Desa({
    super.key,
    required this.controller,
  });

  final PendataanController controller;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Obx(
      () => Container(
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
        child: DropdownButton<String>(
          hint: Text('Desa'),
          isDense: true,
          isExpanded: true,
          value: controller.selectedDesa.value.isNotEmpty
              ? controller.selectedDesa.value
              : null,
          onChanged: (String? newValue) {
            controller.selectedDesa.value = newValue ?? '';
          },
          items: controller.desaList.map((item) {
            return DropdownMenuItem<String>(
              value: item['id'],
              child: Text(item['name']),
            );
          }).toList(),
          underline: SizedBox(),
        ),
      ),
    );
  }
}

class Kecamatan extends StatelessWidget {
  const Kecamatan({
    super.key,
    required this.controller,
  });

  final PendataanController controller;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Obx(
      () => Container(
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
        child: DropdownButton<String>(
          hint: Text('Kecamatan'),
          isDense: true,
          isExpanded: true,
          value: controller.selectedKecamatan.value.isNotEmpty
              ? controller.selectedKecamatan.value
              : null,
          onChanged: (String? newValue) {
            controller.selectedKecamatan.value = newValue ?? '';
            controller.selectedDesa.value = '';
            controller.fetchDataDesa(newValue!);
          },
          items: controller.kecamatanList.map((item) {
            return DropdownMenuItem<String>(
              value: item['id'],
              child: Text(item['name']),
            );
          }).toList(),
          underline: SizedBox(),
        ),
      ),
    );
  }
}

class KabupatenKota extends StatelessWidget {
  const KabupatenKota({
    super.key,
    required this.controller,
  });

  final PendataanController controller;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Obx(
      () => Container(
        margin: EdgeInsets.only(
          top: 16,
          bottom: 16,
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
        child: DropdownButton<String>(
          hint: Text('Kabupaten/Kota'),
          isDense: true,
          isExpanded: true,
          value: controller.selectedKabupaten.value.isNotEmpty
              ? controller.selectedKabupaten.value
              : null,
          onChanged: (String? newValue) {
            controller.selectedKabupaten.value = newValue ?? '';
            controller.selectedKecamatan.value = '';
            controller.selectedDesa.value = '';
            controller.fetchDataKecamatan(newValue!);
          },
          items: controller.kabupatenList.map((item) {
            return DropdownMenuItem<String>(
              value: item['id'],
              child: Text(item['name']),
            );
          }).toList(),
          underline: SizedBox(),
        ),
      ),
    );
  }
}

class Provinsi extends StatelessWidget {
  const Provinsi({
    super.key,
    required this.controller,
  });

  final PendataanController controller;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Obx(
      () => Container(
        margin: EdgeInsets.only(
          top: 16,
          bottom: 16,
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
        child: DropdownButton<String>(
          hint: Text(
            'Provinsi',
          ),
          isExpanded: true,
          isDense: true,
          value: controller.selectedProvinsi.value.isNotEmpty
              ? controller.selectedProvinsi.value
              : null,
          onChanged: (String? newValue) {
            controller.selectedProvinsi.value = newValue ?? '';
            controller.selectedKabupaten.value = '';
            controller.selectedKecamatan.value = '';
            controller.selectedDesa.value = '';
            controller.fetchDataKabupaten(newValue!);
          },
          items: controller.provinsiList.map((item) {
            return DropdownMenuItem<String>(
              value: item['id'],
              child: Text(item['name']),
            );
          }).toList(),
          underline: SizedBox(),
        ),
      ),
    );
  }
}

class NamaPemilik extends StatelessWidget {
  const NamaPemilik({
    super.key,
    required this.pendataanController,
  });

  final PendataanController pendataanController;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
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
      child: TextFormField(
        autocorrect: false,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration.collapsed(
          hintText: 'Nama Pemilik',
          hintStyle: greyTextStyle.copyWith(
            fontSize: width / 25.875,
            fontWeight: FontWeight.w600,
          ),
        ),
        onChanged: (value) => pendataanController.setNamaPemilik(value),
      ),
    );
  }
}

class NIK extends StatelessWidget {
  const NIK({
    super.key,
    required this.pendataanController,
  });

  final PendataanController pendataanController;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
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
      child: TextFormField(
        decoration: InputDecoration.collapsed(
          hintText: 'NIK',
          hintStyle: greyTextStyle.copyWith(
            fontSize: width / 25.875,
            fontWeight: semiBold,
          ),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(16),
        ],
        keyboardType: TextInputType.number,
        onChanged: (value) => pendataanController.setNIK(value),
      ),
    );
  }
}

class NoKK extends StatelessWidget {
  const NoKK({
    super.key,
    required this.pendataanController,
  });

  final PendataanController pendataanController;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
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
      child: TextFormField(
        decoration: InputDecoration.collapsed(
          hintText: 'No. Kartu Keluarga',
          hintStyle: greyTextStyle.copyWith(
            fontSize: width / 25.875,
            fontWeight: semiBold,
          ),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(16),
        ],
        keyboardType: TextInputType.number,
        onChanged: (value) => pendataanController.setNomorKK(value),
      ),
    );
  }
}
