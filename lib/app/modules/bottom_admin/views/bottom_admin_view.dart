import 'package:bottom_nav_bar/bottom_nav_bar.dart';
import 'package:disaster_mapper/app/modules/admin_data/controllers/admin_data_controller.dart';
import 'package:disaster_mapper/app/modules/admin_home/controllers/admin_home_controller.dart';
import 'package:disaster_mapper/app/modules/edukasi/controllers/edukasi_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../utils/theme.dart';
import '../controllers/bottom_admin_controller.dart';

class BottomAdminView extends GetView<BottomAdminController> {
  const BottomAdminView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(AdminHomeController());
    Get.put(EdukasiController());
    Get.put(AdminDataController());

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
              icon: Icon(Icons.cast_for_education_outlined),
              title: 'Edukasi',
              activeColor: kWhiteColor,
              inactiveColor: kOrangeRed,
              activeBackgroundColor: kOrangeRed,
            ),
            BottomNavBarItem(
              icon: Icon(Icons.assignment),
              title: 'Data',
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
