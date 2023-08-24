import 'package:bottom_nav_bar/bottom_nav_bar.dart';
import 'package:disaster_mapper/app/modules/admin_desa_home/controllers/admin_desa_home_controller.dart';
import 'package:disaster_mapper/app/modules/information_pendataan/controllers/information_pendataan_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../admin_desa_data/controllers/admin_desa_data_controller.dart';
import '../../utils/theme.dart';
import '../controllers/bottom_admin_desa_controller.dart';

class BottomAdminDesaView extends GetView<BottomAdminDesaController> {
  const BottomAdminDesaView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(AdminDesaDataController());
    Get.put(AdminDesaHomeController());
    Get.put(InformationPendataanController());
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: controller.pages,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavBar(
          backgroundColor: kWhiteColor,
          curve: Curves.linear,
          itemCornerRadius: 10,
          containerPadding: const EdgeInsets.all(2),
          showElevation: true,
          selectedIndex: controller.currentIndex.value,
          onItemSelected: (index) => controller.currentIndex.value = index,
          items: [
            BottomNavBarItem(
              icon: Icon(Icons.home),
              title: 'Home',
              activeColor: kWhiteColor,
              inactiveColor: kOrangeRed,
              activeBackgroundColor: kOrangeRed,
            ),
            BottomNavBarItem(
              icon: Icon(Icons.assignment),
              title: 'Pendataan',
              activeColor: kWhiteColor,
              inactiveColor: kOrangeRed,
              activeBackgroundColor: kOrangeRed,
            ),
            BottomNavBarItem(
              icon: Icon(Icons.history_sharp),
              title: 'Histori',
              activeColor: kWhiteColor,
              inactiveColor: kOrangeRed,
              activeBackgroundColor: kOrangeRed,
            ),
          ],
        ),
      ),
    );
  }
}
