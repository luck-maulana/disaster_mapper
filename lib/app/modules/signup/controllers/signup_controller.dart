import 'package:get/get.dart';
import 'package:flutter/material.dart';

class SignupController extends GetxController {
  TextEditingController emailC = TextEditingController();
  TextEditingController userC = TextEditingController();
  TextEditingController passC = TextEditingController();
  TextEditingController passConfC = TextEditingController();

  var obscureText = true.obs;


  var isLoading = false.obs;

  void setLoading(bool value) {
    isLoading.value = value;
  }

  @override
  void onClose() {
    userC.dispose();
    emailC.dispose();
    passC.dispose();
    passConfC.dispose();
    super.onClose();
  }
}
