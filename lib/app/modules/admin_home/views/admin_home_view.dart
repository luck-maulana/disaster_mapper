import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../../data/edukasi_collection.dart';
import '../../admin_data/views/admin_add_dataAdmin.dart';
import '../../home/views/home_view.dart';
import '../../utils/theme.dart';
import '../controllers/admin_home_controller.dart';

class AdminHomeView extends GetView<AdminHomeController> {
  final AuthController authController = Get.find<AuthController>();
  AdminHomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
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
                                    fontSize: width / 29.5714),
                              ),
                              SizedBox(height: 8),
                              GetBuilder<AdminHomeController>(
                                builder: (controller) {
                                  if (controller.userData == null) {
                                    return CircularProgressIndicator();
                                  } else {
                                    return Text(
                                      '${controller.userData!.username}',
                                      style: blackTextStyle.copyWith(
                                        fontSize: width / 20.7,
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
                        IconButton(
                          onPressed: () {
                            authController.logout();
                          },
                          icon: Icon(
                            Icons.logout,
                            size: width / 12.5454,
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SizedBox(
                height: 20,
              ),
              Text(
                'Data Rumah',
                style: blackTextStyle.copyWith(
                  fontSize: width / 16.56,
                  fontWeight: bold,
                ),
              ),
              content(),
              SizedBox(
                height: 15,
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
                      fontSize: width / 18.8181,
                      fontWeight: semiBold,
                    ),
                  ),
                ],
              ),
              SizedBox(
                height: 20,
              ),
              Expanded(
                child: EdukasiListView(),
              ),
            ],
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: kOrangeRed,
        onPressed: () {
          Get.to(
            () => AddAdminDesaView(),
          );
        },
        child: Icon(Icons.admin_panel_settings_outlined),
      ),
    );
  }
}

class EdukasiListView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    var witdh = MediaQuery.of(context).size.width;
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
                      width: witdh / 4.14,
                      height: witdh / 4.14,
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
                              fontSize: witdh / 23,
                              fontWeight: FontWeight.bold,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          SizedBox(height: 5),
                          Text(
                            edukasi.contentEdukasi,
                            style: blackTextStyle.copyWith(
                              fontSize: witdh / 29.5714,
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

class content extends StatelessWidget {
  const content({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    var witdh = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Container(
              margin: EdgeInsets.only(top: 10),
              height: witdh / 4.14,
              width: witdh / 4.14,
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
                        style: whiteTextStyle.copyWith(fontSize:   witdh / 29.5714),
                      ),
                    ],
                  ),
                  GetBuilder<AdminHomeController>(
                    builder: (controller) {
                      if (controller.countKabupaten == null) {
                        return CircularProgressIndicator();
                      } else {
                        return Text(
                          '${controller.countKabupaten!.ringan}',
                          style: whiteTextStyle.copyWith(fontSize:    witdh / 17.25),
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
              height: witdh / 4.14,
              width: witdh / 4.14,
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
                        style: whiteTextStyle.copyWith(fontSize:   witdh / 29.5714),
                      ),
                    ],
                  ),
                  GetBuilder<AdminHomeController>(
                    builder: (controller) {
                      if (controller.countKabupaten == null) {
                        return CircularProgressIndicator();
                      } else {
                        return Text(
                          '${controller.countKabupaten!.sedang}',
                          style: whiteTextStyle.copyWith(fontSize:    witdh / 17.25),
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
              height: witdh / 4.14,
              width: witdh / 4.14,
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
                        style: whiteTextStyle.copyWith(fontSize: witdh / 29.5714),
                      ),
                    ],
                  ),
                  GetBuilder<AdminHomeController>(
                    builder: (controller) {
                      if (controller.countKabupaten == null) {
                        return CircularProgressIndicator();
                      } else {
                        return Text(
                          '${controller.countKabupaten!.berat}',
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
                GetBuilder<AdminHomeController>(
                  builder: (controller) {
                    if (controller.countKabupaten == null) {
                      return CircularProgressIndicator();
                    } else {
                      return Text(
                        '${controller.countKabupaten!.selectedKabupaten}',
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
                  GetBuilder<AdminHomeController>(
                    builder: (controller) {
                      if (controller.countKabupaten == null) {
                        return CircularProgressIndicator();
                      } else {
                        return Text(
                          '${controller.countKabupaten!.total}',
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
