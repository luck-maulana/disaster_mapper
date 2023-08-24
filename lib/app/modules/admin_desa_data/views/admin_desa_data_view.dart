import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../../data/edukasi_dcollection.dart';
import '../../edukasi/views/edukasi_view.dart';
import '../../utils/theme.dart';
import '../controllers/admin_desa_data_controller.dart';

class AdminDesaDataView extends GetView<AdminDesaDataController> {
  final AuthController authController = Get.find<AuthController>();
  AdminDesaDataView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(24.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                child: Column(
                  children: [
                    Row(
                      children: [
                        Expanded(
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Selamat Datang,',
                                style: blackTextStyle.copyWith(
                                  fontSize: controller.width / 29.5714,
                                ),
                              ),
                              SizedBox(height: 8),
                              GetBuilder<AdminDesaDataController>(
                                builder: (controller) {
                                  if (controller.userData == null) {
                                    return CircularProgressIndicator();
                                  } else {
                                    return Text(
                                      '${controller.userData!.username}',
                                      style: blackTextStyle.copyWith(
                                        fontSize: controller.width / 20.7,
                                        fontWeight: bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    );
                                  }
                                },
                              ),
                              SizedBox(height: 20),
                            ],
                          ),
                        ),
                        IconButton(
                          onPressed: () {
                            authController.logout();
                          },
                          icon: Icon(
                            Icons.logout,
                            size: controller.width / 12.5454,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Text(
                'Data Rumah',
                style: blackTextStyle.copyWith(
                  fontSize: controller.width / 16.56,
                  fontWeight: bold,
                ),
              ),
              content(),
              SizedBox(
                height: 20,
              ),
              content2(),
              SizedBox(
                height: 20,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(
                    'Artikel',
                    style: blackTextStyle.copyWith(
                      fontSize: controller.width / 16.56,
                      fontWeight: semiBold,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      Get.to(EdukasiView());
                    },
                    child: Text(
                      'Lainnya',
                      style: greyTextStyle.copyWith(
                        fontSize: controller.width / 23,
                      ),
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 15,
              ),
              Expanded(
                child: EdukasiListView(),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class content extends StatelessWidget {
  const content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              height: width / 4.14,
              width: width / 4.14,
              decoration: BoxDecoration(
                color: kBlackColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.house_rounded,
                        color: kOrangeRed,
                      ),
                      Text(
                        'Ringan',
                        style:
                            whiteTextStyle.copyWith(fontSize: width / 29.5714),
                      ),
                    ],
                  ),
                  GetBuilder<AdminDesaDataController>(
                    builder: (controller) {
                      if (controller.countDesa == null) {
                        return CircularProgressIndicator();
                      } else {
                        return Text(
                          '${controller.countDesa!.ringan}',
                          style: whiteTextStyle.copyWith(fontSize: 24),
                          overflow: TextOverflow.ellipsis,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: width / 4.14,
              width: width / 4.14,
              decoration: BoxDecoration(
                color: kBlackColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.house_rounded,
                        color: kOrangeRed,
                      ),
                      Text(
                        'Sedang',
                        style:
                            whiteTextStyle.copyWith(fontSize: width / 29.5714),
                      ),
                    ],
                  ),
                  GetBuilder<AdminDesaDataController>(
                    builder: (controller) {
                      if (controller.countDesa == null) {
                        return CircularProgressIndicator();
                      } else {
                        return Text(
                          '${controller.countDesa!.sedang}',
                          style: whiteTextStyle.copyWith(fontSize: 24),
                          overflow: TextOverflow.ellipsis,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
            Container(
              margin: EdgeInsets.only(top: 10),
              height: width / 4.14,
              width: width / 4.14,
              decoration: BoxDecoration(
                color: kBlackColor,
                borderRadius: BorderRadius.circular(10),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(
                        Icons.house_rounded,
                        color: kOrangeRed,
                      ),
                      Text(
                        'Berat',
                        style:
                            whiteTextStyle.copyWith(fontSize: width / 29.5714),
                      ),
                    ],
                  ),
                  GetBuilder<AdminDesaDataController>(
                    builder: (controller) {
                      if (controller.countDesa == null) {
                        return CircularProgressIndicator();
                      } else {
                        return Text(
                          '${controller.countDesa!.berat}',
                          style: whiteTextStyle.copyWith(fontSize: 24),
                          overflow: TextOverflow.ellipsis,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ],
        ),
      ],
    );
  }
}

class content2 extends StatelessWidget {
  const content2({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      height: width / 3.76363,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
        color: kBlackColor,
      ),
      child: Row(
        children: [
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Icon(
                  Icons.house_rounded,
                  color: kOrangeRed,
                  size: width / 8.28,
                ),
                Text(
                  'Jumlah Rumah Rusak\nTerdampak Gempa',
                  style: whiteTextStyle.copyWith(
                    fontSize: width / 29.5714,
                  ),
                  textAlign: TextAlign.center,
                ),
                GetBuilder<AdminDesaDataController>(
                  builder: (controller) {
                    if (controller.countDesa == null) {
                      return CircularProgressIndicator();
                    } else {
                      return Text(
                        '${controller.countDesa!.selectedDesa}',
                        style:
                            whiteTextStyle.copyWith(fontSize: width / 29.5714),
                        overflow: TextOverflow.ellipsis,
                      );
                    }
                  },
                ),
              ],
            ),
          ),
          Expanded(
            child: Container(
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(10),
                color: kOrangeRed,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    'Total',
                    style: whiteTextStyle.copyWith(fontSize: width / 29.5714),
                  ),
                  GetBuilder<AdminDesaDataController>(
                    builder: (controller) {
                      if (controller.countDesa == null) {
                        return CircularProgressIndicator();
                      } else {
                        return Text(
                          '${controller.countDesa!.total}',
                          style: whiteTextStyle.copyWith(
                            fontSize: width / 8.625,
                            fontWeight: bold,
                          ),
                          overflow: TextOverflow.ellipsis,
                        );
                      }
                    },
                  ),
                ],
              ),
            ),
          ),
        ],
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
                              fontSize: width / 29.5714,
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
