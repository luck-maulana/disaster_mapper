import 'package:flutter/material.dart';

import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../utils/theme.dart';
import '../controllers/pelajari_pendataan_controller.dart';

class PelajariPendataanView extends GetView<PelajariPendataanController> {
  const PelajariPendataanView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlackColor,
        title: Text(
          'PELAJARI PENDATAAN',
          style: orangeRedTextstyle.copyWith(
            fontWeight: bold,
          ),
        ),
        leading: IconButton(
          onPressed: () {
            Get.back();
          },
          icon: Icon(
            Icons.arrow_back,
          ),
        ),
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: kBlackColor,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
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
                        child: TextFormField(
                          enabled: false,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration.collapsed(
                            hintText: '3203281234567890',
                            hintStyle: greyTextStyle.copyWith(
                              fontSize: width / 25.875,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Di atas adalah nomor KK yang harus dimasukkan. Pastikan bahwa KK yang dimasukkan sudah diperbarui sesuai data yang terdaftar di Disdukcapil. Jika belum, silakan hubungi Disdukcapil terdekat.',
                        style: blackTextStyle.copyWith(
                          fontSize: 
                          
                          width / 29.5714,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: kBlackColor,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        child: TextFormField(
                          enabled: false,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration.collapsed(
                            hintText: '3203281234567890',
                            hintStyle: greyTextStyle.copyWith(
                              fontSize: width / 25.875,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Di atas adalah NIK yang harus dimasukkan. Pastikan bahwa NIK yang dimasukkan sudah diperbarui sesuai data yang terdaftar di Disdukcapil. Jika belum, silakan hubungi Disdukcapil terdekat.',
                        style: blackTextStyle.copyWith(
                          fontSize: width / 29.5714,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: kBlackColor,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                        child: TextFormField(
                          enabled: false,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Abdurahman Hakim',
                            hintStyle: greyTextStyle.copyWith(
                              fontSize: width / 25.875,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Di atas adalah nama pemilik rumah yang harus dimasukkan. Pastikan bahwa nama pemilik yang dimasukkan sudah sesuai dengan nik.',
                        style: blackTextStyle.copyWith(
                          fontSize: width / 29.5714,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: kBlackColor,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Provinsi',
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
                        child: TextFormField(
                          enabled: false,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration.collapsed(
                            hintText: 'JAWA BARAT',
                            hintStyle: greyTextStyle.copyWith(
                              fontSize: width / 25.875,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Di atas adalah Provinsi yang harus dimasukkan. Pastikan bahwa Provinsi yang dimasukkan sudah sesuai dengan lokasi pendataan. Agar dapat menampilkan data Kabupaten/Kota.',
                        style: blackTextStyle.copyWith(
                          fontSize: width / 29.5714,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: kBlackColor,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kabupaten/Kota',
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
                        child: TextFormField(
                          enabled: false,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration.collapsed(
                            hintText: 'KABUPATEN CIANJUR',
                            hintStyle: greyTextStyle.copyWith(
                              fontSize: width / 25.875,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Di atas adalah Kabupaten/Kota yang harus dimasukkan. Pastikan bahwa Kabupaten/Kota yang dimasukkan sudah sesuai dengan lokasi pendataan. Agar dapat menampilkan data Kecamatan.',
                        style: blackTextStyle.copyWith(
                          fontSize: width / 29.5714,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: kBlackColor,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Kecamatan',
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
                        child: TextFormField(
                          enabled: false,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration.collapsed(
                            hintText: 'WARUNGKONDANG',
                            hintStyle: greyTextStyle.copyWith(
                              fontSize: width / 25.875,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Di atas adalah Kecamatan yang harus dimasukkan. Pastikan bahwa kecamtan yang dimasukkan sudah sesuai dengan lokasi pendataan. Agar dapat menampilkan data Desa.',
                        style: blackTextStyle.copyWith(
                          fontSize: width / 29.5714,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: kBlackColor,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Desa',
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
                        child: TextFormField(
                          enabled: false,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration.collapsed(
                            hintText: 'SUKAWANGI',
                            hintStyle: greyTextStyle.copyWith(
                              fontSize: width / 25.875,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Di atas adalah Desa yang harus dimasukkan. Pastikan bahwa desa yang dimasukkan sudah sesuai dengan lokasi pendataan.',
                        style: blackTextStyle.copyWith(
                          fontSize: width / 29.5714,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: kBlackColor,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Alamat',
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
                        child: TextFormField(
                          enabled: false,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Kp. Warungjengkol',
                            hintStyle: greyTextStyle.copyWith(
                              fontSize: width / 25.875,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Di atas adalah alamat yang harus dimasukkan. Pastikan bahwa alamat yang dimasukkan sudah sesuai dengan lokasi pendataan.',
                        style: blackTextStyle.copyWith(
                          fontSize: width / 29.5714,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: kBlackColor,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
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
                                fontSize: 20,
                                fontWeight: bold,
                              ),
                            ),
                          ),
                        ],
                      ),
                      Row(
                        children: [
                          Expanded(
                            child: Container(
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
                                enabled: false,
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration.collapsed(
                                  hintText: '003',
                                  hintStyle: greyTextStyle.copyWith(
                                    fontSize: width / 25.875,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
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
                            child: Container(
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
                                enabled: false,
                                textCapitalization: TextCapitalization.words,
                                decoration: InputDecoration.collapsed(
                                  hintText: '003',
                                  hintStyle: greyTextStyle.copyWith(
                                    fontSize: width / 25.875,
                                    fontWeight: FontWeight.w600,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                      Text(
                        'Di atas adalah RT/RW yang harus dimasukkan. Pastikan bahwa RT/RW yang dimasukkan sudah sesuai dengan lokasi pendataan.',
                        style: blackTextStyle.copyWith(
                          fontSize: width / 29.5714,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: kBlackColor,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Jenis Rumah',
                        style: blackTextStyle.copyWith(
                          fontSize: width / 20.7,
                          fontWeight: bold,
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceAround,
                        children: [
                          Row(
                            children: [
                              Row(
                                children: [
                                  Container(
                                    width: 24,
                                    height: 24,
                                    decoration: BoxDecoration(
                                      border: Border.all(
                                        color: kBlackColor,
                                        width: 2,
                                      ),
                                      shape: BoxShape.circle,
                                    ),
                                    child: Center(
                                      child: Container(
                                        margin: EdgeInsets.only(
                                            top: 15, bottom: 15),
                                        width: 12,
                                        height: 12,
                                        decoration: BoxDecoration(
                                          border: Border.all(
                                            color: kBlackColor,
                                            width: 2,
                                          ),
                                          shape: BoxShape.circle,
                                          color: kBlackColor,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Permanen',
                                style: greyTextStyle.copyWith(
                                  fontSize: width / 25.875,
                                  fontWeight: semiBold,
                                ),
                              ),
                            ],
                          ),
                          SizedBox(width: 16),
                          Row(
                            children: [
                              Container(
                                width: 24,
                                height: 24,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(
                                    color: kBlackColor,
                                    width: 2,
                                  ),
                                ),
                                child: Center(),
                              ),
                              SizedBox(width: 8),
                              Text(
                                'Semi Permanen',
                                style: greyTextStyle.copyWith(
                                  fontSize: width / 25.875,
                                  fontWeight: semiBold,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                      Text(
                        'Di atas adalah jenis yang harus dipilih. Pastikan bahwa jenis rumah yang dimasukkan sudah sesuai dengan jenis rumah yang didata.',
                        style: blackTextStyle.copyWith(
                          fontSize: width / 29.5714,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: kBlackColor,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Luas',
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
                        child: TextFormField(
                          enabled: false,
                          textCapitalization: TextCapitalization.words,
                          decoration: InputDecoration.collapsed(
                            hintText: '300',
                            hintStyle: greyTextStyle.copyWith(
                              fontSize: width / 25.875,
                              fontWeight: FontWeight.w600,
                            ),
                          ),
                        ),
                      ),
                      Text(
                        'Di atas adalah luas rumah yang harus dimasukkan. Pastikan bahwa luas yang dimasukkan sudah sesuai dengan rumah yang didata.',
                        style: blackTextStyle.copyWith(
                          fontSize: width / 29.5714,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: kBlackColor,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Foto',
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
                        width: 100,
                        height: 100,
                        child: Image.asset('assets/1234.png'),
                        decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(10),
                        ),
                      ),
                      Text(
                        'Di atas adalah foto rumah yang harus dimasukkan. Pastikan bahwa foto yang dimasukkan sudah sesuai dengan keruakan yang ada dirumah.',
                        style: blackTextStyle.copyWith(
                          fontSize: width / 29.5714,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: kBlackColor,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Latitude & Longitude',
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
                        child: Column(
                          children: [
                            TextFormField(
                              enabled: false,
                              textCapitalization: TextCapitalization.words,
                              decoration: InputDecoration.collapsed(
                                hintText: '-6.80857705882, 107.147547647',
                                hintStyle: greyTextStyle.copyWith(
                                  fontSize: width / 25.875,
                                  fontWeight: FontWeight.w600,
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Container(
                        height: 300,
                        decoration: BoxDecoration(
                          color: kWhiteColor,
                          borderRadius: BorderRadius.circular(14),
                          border: Border.all(
                            color: kBlackColor,
                            width: 1,
                          ),
                        ),
                        child: GoogleMap(
                          initialCameraPosition: CameraPosition(
                            target: LatLng(-6.80857705882, 107.147547647),
                            zoom: 14.0,
                          ),
                          markers: {
                            Marker(
                              markerId: MarkerId('your_marker_id'),
                              position: LatLng(-6.80857705882, 107.147547647),
                              infoWindow: InfoWindow(
                                title: 'Lokasi Rumah',
                                snippet: 'Lokasi Rumah Terkini',
                              ),
                            ),
                          },
                        ),
                      ),
                      SizedBox(
                        height: 10,
                      ),
                      Text(
                        'Di atas adalah latitude & longitude (garis bujur & garis lintang) yang harus ada. Pastikan bahwa longitude & latitude yang dimasukkan sudah sesuai dengan lokasi rumah yang didata.',
                        style: blackTextStyle.copyWith(
                          fontSize: width / 29.5714,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Container(
                decoration: BoxDecoration(
                  color: kWhiteColor,
                  borderRadius: BorderRadius.circular(14),
                  border: Border.all(
                    color: kBlackColor,
                    width: 1,
                  ),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(24.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Tingkat Kerusakan',
                        style: blackTextStyle.copyWith(
                          fontSize: width / 20.7,
                          fontWeight: bold,
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.all(16.0),
                        child: Column(
                          children: [
                            Container(
                              height: 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: kBlackColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: EdgeInsets.only(left: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 22,
                                            width: 22,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kWhiteColor,
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
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              height: 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: kBlackColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 22,
                                            width: 22,
                                            decoration: BoxDecoration(
                                              shape: BoxShape.circle,
                                              color: kWhiteColor,
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
                            SizedBox(
                              height: 16,
                            ),
                            Container(
                              height: 55,
                              width: double.infinity,
                              decoration: BoxDecoration(
                                color: kBlackColor,
                                borderRadius: BorderRadius.circular(10),
                              ),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Expanded(
                                    child: Padding(
                                      padding: const EdgeInsets.only(left: 20),
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.start,
                                        children: [
                                          Container(
                                            height: 22,
                                            width: 22,
                                            decoration: BoxDecoration(
                                                shape: BoxShape.circle,
                                                color: kOrangeRed),
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
                          ],
                        ),
                      ),
                      Text(
                        'Di atas adalah tingkat kerusakan rumah yang harus dipilih. Pastikan bahwa tingkat kerusakan yang dimasukkan sudah sesuai dengan rumah yang didata.',
                        style: blackTextStyle.copyWith(
                          fontSize: width / 29.5714,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
