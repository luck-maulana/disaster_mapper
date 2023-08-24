import 'package:bottom_nav_bar/bottom_nav_bar.dart';
import 'package:disaster_mapper/app/modules/pendataan/controllers/pendataan_controller.dart';
import 'package:disaster_mapper/app/modules/profile_user/controllers/profile_user_controller.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../home/controllers/home_controller.dart';
import '../../utils/theme.dart';
import '../controllers/bottom_user_controller.dart';

class BottomUserView extends GetView<BottomUserController> {
  const BottomUserView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    Get.put(HomeController());
    Get.put(PendataanController());
    Get.put(ProfileUserController());
    return Scaffold(
      body: Obx(
        () => IndexedStack(
          index: controller.currentIndex.value,
          children: controller.pages,
        ),
      ),
      bottomNavigationBar: Obx(
        () => BottomNavBar(
          containerHeight: width / 6.3692,
          iconSize: width / 18,
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
              icon: Icon(Icons.person),
              title: 'Profile',
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
