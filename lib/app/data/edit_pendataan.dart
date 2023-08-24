import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../modules/utils/theme.dart';
import '../routes/app_pages.dart';
import 'data_collection.dart';

class EditPendataanScreen extends StatefulWidget {
  final PendataanData pendataanData;

  EditPendataanScreen({required this.pendataanData});

  @override
  _EditPendataanScreenState createState() => _EditPendataanScreenState();
}

class _EditPendataanScreenState extends State<EditPendataanScreen> {
  TextEditingController nomorKKController = TextEditingController();
  TextEditingController nikController = TextEditingController();
  TextEditingController namaPemilikController = TextEditingController();

  TextEditingController rtController = TextEditingController();
  TextEditingController rwController = TextEditingController();
  TextEditingController alamatController = TextEditingController();
  late GoogleMapController _mapController;
  StreamController<LatLng> _markerStreamController = StreamController<LatLng>();

  late LatLng _cameraPosition;

  RxString status = ''.obs;

  late LatLng _markerPosition;

  @override
  void initState() {
    super.initState();
    _cameraPosition =
        LatLng(widget.pendataanData.latitude, widget.pendataanData.longitude);
    _markerPosition =
        LatLng(widget.pendataanData.latitude, widget.pendataanData.longitude);
    nomorKKController.text = widget.pendataanData.nomorKK;
    nikController.text = widget.pendataanData.nik;
    namaPemilikController.text = widget.pendataanData.namaPemilik;
    rtController.text = widget.pendataanData.rt;
    rwController.text = widget.pendataanData.rw;
    alamatController.text = widget.pendataanData.alamat;
  }

  @override
  void dispose() {
    namaPemilikController.dispose();
    nikController.dispose();
    nomorKKController.dispose();
    alamatController.dispose();
    rtController.dispose();
    rwController.dispose();
    status.value = widget.pendataanData.status;
    super.dispose();
  }

  Future<void> _saveChanges() async {
    try {
      await FirebaseFirestore.instance
          .collection('pendataan')
          .doc(widget.pendataanData.id)
          .update({
        'namaPemilik': namaPemilikController.text,
        'nomorKK': nomorKKController.text,
        'NIK': nikController.text,
        'alamat': alamatController.text,
        'rt': rtController.text,
        'rw': rwController.text,
        'latitude': _cameraPosition.latitude,
        'longitude': _cameraPosition.longitude,
      });
      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
        content: Text('Data Berhasil Di Perbaharui'),
      ));
      Get.offAllNamed(Routes.BOTTOM_ADMIN_DESA);
    } catch (e) {
      print('Error updating pendataan data: $e');
    }
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    final LatLng _center =
        LatLng(widget.pendataanData.latitude, widget.pendataanData.longitude);

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'EDIT PENDATAAN',
          style: orangeRedTextstyle,
        ),
        centerTitle: true,
        backgroundColor: kBlackColor,
        actions: [
          IconButton(
            onPressed: _saveChanges,
            icon: Icon(Icons.save),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                'Nama Pemilik',
                style: blackTextStyle.copyWith(
                  fontSize: width / 20.7,
                  fontWeight: bold,
                ),
              ),
              NamaPemilik(namaPemilikController: namaPemilikController),
              Text(
                'No. Kartu Keluarga',
                style: blackTextStyle.copyWith(
                  fontSize: width / 20.7,
                  fontWeight: bold,
                ),
              ),
              nomorKK(nomorKKController: nomorKKController),
              Text(
                'No. Induk Kependudukan',
                style: blackTextStyle.copyWith(
                  fontSize: width / 20.7,
                  fontWeight: bold,
                ),
              ),
              NIK(nikController: nikController),
              Text(
                'Alamat',
                style: blackTextStyle.copyWith(
                  fontSize: width / 20.7,
                  fontWeight: bold,
                ),
              ),
              Alamat(alamatController: alamatController),
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
                    child: RT(rtController: rtController),
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
                    child: RW(rwController: rwController),
                  ),
                ],
              ),
              Text(
                'Images',
                style: blackTextStyle.copyWith(
                  fontSize: width / 20.7,
                  fontWeight: bold,
                ),
              ),
              SizedBox(height: 8.0),
              Wrap(
                spacing: 8.0,
                runSpacing: 8.0,
                children: widget.pendataanData.imageUrls.map((imageUrls) {
                  return InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (_) => Dialog(
                          child: Image.network(imageUrls),
                        ),
                      );
                    },
                    child: SizedBox(
                      width: width / 4.14,
                      height: width / 4.14,
                      child: Image.network(
                        imageUrls,
                        fit: BoxFit.cover,
                      ),
                    ),
                  );
                }).toList(),
              ),
              Text(
                'Lokasi',
                style: blackTextStyle.copyWith(
                  fontSize: width / 20.7,
                  fontWeight: bold,
                ),
              ),
              SizedBox(
                height: 10,
              ),
              Container(
                height: width / 1.38,
                child: GoogleMap(
                  initialCameraPosition: CameraPosition(
                    target: _cameraPosition,
                    zoom: 15,
                  ),
                  onMapCreated: (controller) {
                    _mapController = controller;
                  },
                  onCameraMove: (CameraPosition newPosition) {
                    setState(() {
                      _cameraPosition = newPosition.target;
                    });
                  },
                  markers: {
                    Marker(
                      markerId: MarkerId('your_marker_id'),
                      position: _cameraPosition,
                      draggable: true,
                      onDragEnd: (LatLng newPosition) {
                        setState(() {
                          _cameraPosition = newPosition;
                        });
                      },
                      infoWindow: InfoWindow(
                        title: 'Lokasi Rumah',
                        snippet: 'Lokasi Rumah Terkini',
                      ),
                    ),
                  },
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class NIK extends StatelessWidget {
  const NIK({
    super.key,
    required this.nikController,
  });

  final TextEditingController nikController;

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
        controller: nikController,
        decoration: InputDecoration.collapsed(
          hintText: 'No. Kartu Keluarga',
          hintStyle: greyTextStyle.copyWith(
            fontSize: width / 25.875,
            fontWeight: FontWeight.w600,
          ),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(16),
        ],
      ),
    );
  }
}

class nomorKK extends StatelessWidget {
  const nomorKK({
    super.key,
    required this.nomorKKController,
  });

  final TextEditingController nomorKKController;

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
        controller: nomorKKController,
        decoration: InputDecoration.collapsed(
          hintText: 'No. Kartu Keluarga',
          hintStyle: greyTextStyle.copyWith(
            fontSize: width / 25.875,
            fontWeight: FontWeight.w600,
          ),
        ),
        inputFormatters: [
          LengthLimitingTextInputFormatter(16),
        ],
      ),
    );
  }
}

class RW extends StatelessWidget {
  const RW({
    super.key,
    required this.rwController,
  });

  final TextEditingController rwController;

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
        controller: rwController,
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
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class RT extends StatelessWidget {
  const RT({
    super.key,
    required this.rtController,
  });

  final TextEditingController rtController;

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
        controller: rtController,
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
        keyboardType: TextInputType.number,
      ),
    );
  }
}

class NamaPemilik extends StatelessWidget {
  const NamaPemilik({
    super.key,
    required this.namaPemilikController,
  });

  final TextEditingController namaPemilikController;

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
        controller: namaPemilikController,
        decoration: InputDecoration.collapsed(
          hintText: 'Nama Pemilik',
          hintStyle: greyTextStyle.copyWith(
            fontSize: width / 25.875,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}

class Alamat extends StatelessWidget {
  const Alamat({
    super.key,
    required this.alamatController,
  });

  final TextEditingController alamatController;

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
        controller: alamatController,
        decoration: InputDecoration.collapsed(
          hintText: 'Alamat',
          hintStyle: greyTextStyle.copyWith(
            fontSize: width / 25.875,
            fontWeight: FontWeight.w600,
          ),
        ),
      ),
    );
  }
}
