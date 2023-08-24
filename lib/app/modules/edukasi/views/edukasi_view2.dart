import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../data/edukasi_dcollection.dart';
import '../../utils/theme.dart';
import '../controllers/edukasi_controller.dart';
import 'detail_edukasi.dart';

class EdukasiView extends GetView<EdukasiController> {
  EdukasiView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: kBlackColor,
        centerTitle: true,
        title: Text(
          'EDUKASI',
          style: orangeRedTextstyle.copyWith(
            fontWeight: bold,
          ),
        ),
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: EdukasiListView(),
        ),
      ),
    );
  }
}

class EdukasiListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return ListView.builder(
      itemCount: EdukasiData.edukasiDataList.length,
      itemBuilder: (context, index) {
        EdukasiData edukasi = EdukasiData.edukasiDataList[index];
        return Padding(
          padding: const EdgeInsets.symmetric(vertical: 8),
          child: GestureDetector(
            onTap: () {
              goToDetailPage(edukasi);
            },
            child: Card(
              color: kWhiteColor,
              elevation: 4,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(16),
              ),
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(10.0),
                    child: Container(
                      width: width / 4.14,
                      height: width / 4.14,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(edukasi.photoEdukasi),
                          fit: BoxFit.cover,
                        ),
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(
                        right: 10,
                        bottom: 10,
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            edukasi.judulEdukasi,
                            style: blackTextStyle.copyWith(
                              fontSize: width / 23,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5),
                          Text(
                            edukasi.contentEdukasi,
                            style: blackTextStyle.copyWith(
                              fontSize: width / 23,
                            ),
                            maxLines: 3,
                            overflow: TextOverflow.ellipsis,
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
      },
    );
  }
}

void goToDetailPage(EdukasiData data) {
  Get.to(DetailPage(), arguments: data);
}
