import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../data/edukasi_dcollection.dart';
import '../../utils/theme.dart';

class DetailPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final edukasiData = Get.arguments as EdukasiData;

    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      appBar: AppBar(
        title: Text(
          'ARTIKEL',
          style: orangeRedTextstyle.copyWith(
            fontWeight: bold,
          ),
        ),
        centerTitle: true,
        backgroundColor: kBlackColor,
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              Text(
                edukasiData.judulEdukasi,
                style: blackTextStyle.copyWith(
                  fontSize: width / 18.8181,
                  fontWeight: FontWeight.w600,
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(10.0),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(10),
                  child: Image.asset(
                    edukasiData.photoEdukasi,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              Text(
                edukasiData.contentEdukasi,
                textAlign: TextAlign.justify,
                style: blackTextStyle.copyWith(
                  fontWeight: semiBold,
                  fontSize: width / 29.5714,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
