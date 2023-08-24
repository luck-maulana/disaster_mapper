import 'package:disaster_mapper/app/data/edit_pendataan.dart';
import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

import '../../../data/data_collection.dart';
import '../../utils/theme.dart';

class DetailPendataan extends StatefulWidget {
  final PendataanData pendataanData;

  DetailPendataan({required this.pendataanData});

  @override
  State<DetailPendataan> createState() => _DetailPendataanState();
}

class _DetailPendataanState extends State<DetailPendataan> {
  late Marker _draggableMarker;

  @override
  void initState() {
    super.initState();

    final LatLng _center =
        LatLng(widget.pendataanData.latitude, widget.pendataanData.longitude);

    _draggableMarker = Marker(
      markerId: MarkerId('draggable_marker'),
      position: _center,
      draggable: true,
      onDragEnd: _onMarkerDragEnd,
    );
  }

  void _onMarkerDragEnd(LatLng newPosition) {
    setState(() {
      _draggableMarker = _draggableMarker.copyWith(positionParam: newPosition);
    });
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    final LatLng _center =
        LatLng(widget.pendataanData.latitude, widget.pendataanData.longitude);

    final double _zoom = 15;
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlackColor,
        centerTitle: true,
        title: Text(
          'DATA RUMAH',
          style: orangeRedTextstyle,
        ),
        actions: [
          IconButton(
            onPressed: () {
              _editPendataanData(context);
            },
            icon: Icon(Icons.edit),
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Padding(
            padding: EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Data Pribadi',
                  style: blackTextStyle.copyWith(
                    fontSize: width / 20.7,
                    fontWeight: bold,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: kBlackColor,
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Nomor KK: ',
                              style: blackTextStyle.copyWith(
                                fontSize: width / 25.875,
                                fontWeight: bold,
                              ),
                            ),
                            TextSpan(
                              text: '${widget.pendataanData.nomorKK}',
                              style: blackTextStyle.copyWith(
                                  fontSize: width / 25.875),
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'NIK: ',
                              style: blackTextStyle.copyWith(
                                fontSize: width / 25.875,
                                fontWeight: bold,
                              ),
                            ),
                            TextSpan(
                              text: '${widget.pendataanData.nik}',
                              style: blackTextStyle.copyWith(
                                  fontSize: width / 25.875),
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Nama Pemilik Rumah: ',
                              style: blackTextStyle.copyWith(
                                fontSize: width / 25.875,
                                fontWeight: bold,
                              ),
                            ),
                            TextSpan(
                              text: '${widget.pendataanData.namaPemilik}',
                              style: blackTextStyle.copyWith(
                                  fontSize: width / 25.875),
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Alamat: ',
                              style: blackTextStyle.copyWith(
                                fontSize: width / 25.875,
                                fontWeight: bold,
                              ),
                            ),
                            TextSpan(
                              text:
                                  '${widget.pendataanData.alamat} RT/RW ${widget.pendataanData.rt}/${widget.pendataanData.rw} ${widget.pendataanData.selectedDesa} ${widget.pendataanData.selectedKecamatan} ${widget.pendataanData.selectedKabupaten} ${widget.pendataanData.selectedProvinsi}',
                              style: blackTextStyle.copyWith(
                                  fontSize: width / 25.875),
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Jenis Rumah: ',
                              style: blackTextStyle.copyWith(
                                fontSize: width / 25.875,
                                fontWeight: bold,
                              ),
                            ),
                            TextSpan(
                              text: '${widget.pendataanData.jenisRumah}',
                              style: blackTextStyle.copyWith(
                                  fontSize: width / 25.875),
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Luas: ',
                              style: blackTextStyle.copyWith(
                                fontSize: width / 25.875,
                                fontWeight: bold,
                              ),
                            ),
                            TextSpan(
                              text: '${widget.pendataanData.luas}',
                              style: blackTextStyle.copyWith(
                                  fontSize: width / 25.875),
                            ),
                          ],
                        ),
                      ),
                      Text.rich(
                        TextSpan(
                          children: [
                            TextSpan(
                              text: 'Tingkat Kerusakan: ',
                              style: blackTextStyle.copyWith(
                                fontSize: width / 25.875,
                                fontWeight: bold,
                              ),
                            ),
                            TextSpan(
                              text: '${widget.pendataanData.tingkatKerusakan}',
                              style: blackTextStyle.copyWith(
                                  fontSize: width / 25.875),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  'Foto Rumah',
                  style: blackTextStyle.copyWith(
                    fontSize: width / 20.7,
                    fontWeight: bold,
                  ),
                ),
                Container(
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 15),
                  padding: EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.circular(14),
                    border: Border.all(
                      color: kBlackColor,
                      width: 1,
                    ),
                    boxShadow: [
                      BoxShadow(
                        color: Colors.grey.withOpacity(0.3),
                        spreadRadius: 2,
                        blurRadius: 5,
                        offset: Offset(0, 3),
                      ),
                    ],
                  ),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      SizedBox(height: 8.0),
                      Wrap(
                        spacing: 8.0,
                        runSpacing: 8.0,
                        children:
                            widget.pendataanData.imageUrls.map((imageUrls) {
                          return InkWell(
                            onTap: () {
                              showDialog(
                                context: context,
                                builder: (_) => Dialog(
                                  child: Image.network(
                                    imageUrls,
                                    fit: BoxFit.cover,
                                  ),
                                ),
                              );
                            },
                            child: Container(
                              width: 100,
                              height: 100,
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(8),
                                border: Border.all(
                                  color: kBlackColor,
                                  width: 1,
                                ),
                                boxShadow: [
                                  BoxShadow(
                                    color: Colors.grey.withOpacity(0.3),
                                    spreadRadius: 2,
                                    blurRadius: 5,
                                    offset: Offset(0, 3),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(8),
                                child: Image.network(
                                  imageUrls,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ),
                          );
                        }).toList(),
                      ),
                    ],
                  ),
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
                      target: _center,
                      zoom: _zoom,
                    ),
                    markers: {
                      Marker(
                        markerId: MarkerId('your_marker_id'),
                        position: _center,
                        infoWindow: InfoWindow(
                          title: 'Lokasi Rumah',
                          snippet: 'Lokasi Rumah Terkini',
                        ),
                      ),
                      _draggableMarker,
                    },
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _editPendataanData(BuildContext context) async {
    final updatedData = await Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) =>
            EditPendataanScreen(pendataanData: widget.pendataanData),
      ),
    );

    if (updatedData != null) {}
  }
}
