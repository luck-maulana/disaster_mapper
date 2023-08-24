import 'package:disaster_mapper/app/modules/edukasi/views/edukasi_view.dart';
import 'package:disaster_mapper/app/modules/utils/theme.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';
import '../../../controllers/auth_controller.dart';
import '../../../data/edukasi_collection.dart';
import '../controllers/home_controller.dart';
import 'detail_edukasi.dart';

class HomeView extends GetView<HomeController> {
  final authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(() {
        if (controller.userProfile.value != null &&
            controller.userProfile.value!.exists == true) {
          var userData =
              controller.userProfile.value!.data() as Map<String, dynamic>;
          return SafeArea(
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
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                CircleAvatar(
                                  radius: controller.width / 13.8,
                                  backgroundImage:
                                      NetworkImage(userData['photoURL'] ?? ''),
                                ),
                                SizedBox(width: 20),
                                Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      'Welcome,',
                                      style: blackTextStyle.copyWith(
                                        fontSize: controller.width / 29.5714,
                                      ),
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      '${userData['username']}',
                                      style: blackTextStyle.copyWith(
                                        fontSize: controller.width / 20.7,
                                        fontWeight: bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 8),
                                  ],
                                ),
                              ],
                            ),
                            IconButton(
                              onPressed: () {
                                authC.logout();
                              },
                              icon: Icon(
                                Icons.logout,
                                size: controller.width / 12.54,
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
                      fontSize: controller.width / 16.56,
                      fontWeight: bold,
                    ),
                  ),
                  SizedBox(
                    height: 15,
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
          );
        } else if (controller.userProfile.value != null &&
            controller.userProfile.value!.exists == false) {
          return Center(
            child: Text(
              'User does not exist',
              style: TextStyle(fontSize: 20),
            ),
          );
        } else {
          return Center(
            child: CircularProgressIndicator(),
          );
        }
      }),
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
                        style: whiteTextStyle.copyWith(
                          fontSize: witdh / 29.5714,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '35.453',
                    style: whiteTextStyle.copyWith(
                      fontSize: witdh / 17.25,
                    ),
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
                        style: whiteTextStyle.copyWith(
                          fontSize: witdh / 29.5714,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '14.093',
                    style: whiteTextStyle.copyWith(
                      fontSize: witdh / 17.25,
                    ),
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
                        style: whiteTextStyle.copyWith(
                          fontSize: witdh / 29.5714,
                        ),
                      ),
                    ],
                  ),
                  Text(
                    '15.356',
                    style: whiteTextStyle.copyWith(
                      fontSize: witdh / 17.25,
                    ),
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
    var witdh = MediaQuery.of(context).size.width;
    return Container(
      height: witdh / 3.7636,
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
                  size: witdh / 8.28,
                ),
                Text(
                  'Berdasarkan dari BPBD\nKab. Cianjur 31 Maret 2023',
                  style: whiteTextStyle.copyWith(
                    fontSize: witdh / 29.5714,
                  ),
                  textAlign: TextAlign.center,
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
                    style: whiteTextStyle.copyWith(
                      fontSize: witdh / 29.5714,
                    ),
                  ),
                  Text(
                    '64.901',
                    style: whiteTextStyle.copyWith(
                      fontSize: witdh / 8.625,
                      fontWeight: bold,
                    ),
                  )
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

void goToDetailPage(EdukasiData data) {
  Get.to(DetailPage(), arguments: data);
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
