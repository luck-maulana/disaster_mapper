import 'package:get/get.dart';
import 'package:flutter/material.dart';

import '../../../controllers/auth_controller.dart';

class LoginController extends GetxController {
  final authC = Get.find<AuthController>();
  double get width => Get.width;

  TextEditingController emailC = TextEditingController();
  TextEditingController passC = TextEditingController();
  var obscureText = true.obs;

  @override
  void onClose() {
    emailC.dispose();
    passC.dispose();
    super.onClose();
  }

  
}
