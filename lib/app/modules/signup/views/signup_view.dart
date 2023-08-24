import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../utils/theme.dart';
import '../controllers/signup_controller.dart';

class SignupView extends GetView<SignupController> {
  final authC = Get.find<AuthController>();
  final RxBool isLoading = false.obs;

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Obx(
        () => Stack(
          children: [
            Container(
              decoration: BoxDecoration(
                color: kWhiteColor,
              ),
            ),
            SafeArea(
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        right: 24,
                        top: 24,
                        left: 24,
                        bottom: 15,
                      ),
                      child: Text(
                        'Register',
                        style: orangeRedTextstyle.copyWith(
                          fontSize: width / 12.9375,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                    Container(
                      margin: EdgeInsets.only(
                        right: 24,
                        left: 24,
                      ),
                      child: Text(
                        'Buat Akun Untuk Melanjutkan',
                        style: orangeRedTextstyle.copyWith(
                          fontSize: width / 20.7,
                        ),
                      ),
                    ),
                    Padding(
                      padding: EdgeInsets.all(24),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          SizedBox(height: 20.0),
                          Text(
                            'Username',
                            style: orangeRedTextstyle.copyWith(
                              fontSize: width / 20.7,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          UsernameTextField(controller: controller),
                          Text(
                            'Email',
                            style: orangeRedTextstyle.copyWith(
                              fontSize: width / 20.7,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          EmailTextField(controller: controller),
                          Text(
                            'Password',
                            style: orangeRedTextstyle.copyWith(
                              fontSize: width / 20.7,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          PasswordTextField(controller: controller),
                          Text(
                            'Konfirmasi Password',
                            style: orangeRedTextstyle.copyWith(
                              fontSize: 20,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          ConfirmPasswordTextField(controller: controller),
                          SizedBox(height: 50),
                          Container(
                            width: double.infinity,
                            height: width / 7.66,
                            padding: EdgeInsets.only(),
                            child: ElevatedButton(
                              style: ElevatedButton.styleFrom(
                                backgroundColor: kOrangeRed,
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(10.0),
                                ),
                              ),
                              onPressed: () {
                                if (controller.passC.text !=
                                    controller.passConfC.text) {
                                  Get.defaultDialog(
                                    title: "Terjadi Kesalahan",
                                    middleText:
                                        "Password dan Konfirmasi Password Tidak sesuai",
                                  );
                                } else {
                                  _signup();
                                }
                              },
                              child: Text(
                                'Register',
                                style: whiteTextStyle.copyWith(
                                  fontSize: width / 17.25,
                                  fontWeight: FontWeight.bold,
                                ),
                              ),
                            ),
                          ),
                          SizedBox(height: 10),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Text(
                                'Sudah Punya Akun?',
                                style: greyTextStyle.copyWith(
                                    fontSize: width / 25.875),
                              ),
                              TextButton(
                                onPressed: () {
                                  Get.back();
                                },
                                child: Text(
                                  'Login',
                                  style: orangeRedTextstyle.copyWith(
                                    fontSize: width / 25.875,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
            if (isLoading.value)
              Positioned.fill(
                child: Container(
                  color: Colors.black.withOpacity(0.5),
                  child: Center(
                    child: CircularProgressIndicator(),
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  void _signup() async {
    isLoading.value = true;
    await authC.signup(
      controller.userC.text,
      controller.emailC.text,
      controller.passC.text,
    );
    isLoading.value = false;
  }
}

class ConfirmPasswordTextField extends StatelessWidget {
  final SignupController controller;

  const ConfirmPasswordTextField({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(
        top: 15,
        bottom: 10,
      ),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: kOrangeRed,
          width: 1,
        ),
      ),
      child: Obx(
        () => Row(
          children: [
            Expanded(
              child: TextFormField(
                obscureText: controller.obscureText.value,
                controller: controller.passConfC,
                decoration: InputDecoration.collapsed(
                  hintText: 'Konfirmasi Password',
                  hintStyle: greyTextStyle.copyWith(
                    fontSize: width / 25.875,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
            ),
            Obx(
              () => InkWell(
                onTap: () {
                  controller.obscureText.value = !controller.obscureText.value;
                },
                child: Icon(
                  controller.obscureText.value
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: kOrangeRed,
                  size: width / 20.7,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class PasswordTextField extends StatelessWidget {
  final SignupController controller;

  const PasswordTextField({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;

    return Container(
      margin: EdgeInsets.only(
        top: 15,
        bottom: 10,
      ),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: kOrangeRed,
          width: 1,
        ),
      ),
      child: Obx(
        () => Row(
          children: [
            Expanded(
              child: Column(
                children: [
                  TextFormField(
                    obscureText: controller.obscureText.value,
                    controller: controller.passC,
                    decoration: InputDecoration.collapsed(
                      hintText: 'Password',
                      hintStyle: greyTextStyle.copyWith(
                        fontSize: width / 25.875,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                  ),
                ],
              ),
            ),
            Obx(
              () => InkWell(
                onTap: () {
                  controller.obscureText.value = !controller.obscureText.value;
                },
                child: Icon(
                  controller.obscureText.value
                      ? Icons.visibility_off_outlined
                      : Icons.visibility_outlined,
                  color: kOrangeRed,
                  size: width / 20.7,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmailTextField extends StatelessWidget {
  final SignupController controller;

  const EmailTextField({Key? key, required this.controller}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 15),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: kOrangeRed,
          width: 1,
        ),
      ),
      child: TextFormField(
        autocorrect: false,
        controller: controller.emailC,
        decoration: InputDecoration.collapsed(
          hintText: 'Email',
          hintStyle: greyTextStyle.copyWith(
            fontSize: width / 25.875,
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: () => controller.emailC.clear(),
      ),
    );
  }
}

class UsernameTextField extends StatelessWidget {
  final SignupController controller;

  const UsernameTextField({Key? key, required this.controller})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    return Container(
      margin: EdgeInsets.only(top: 15, bottom: 15),
      padding: EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: kWhiteColor,
        borderRadius: BorderRadius.circular(14),
        border: Border.all(
          color: kOrangeRed,
          width: 1,
        ),
      ),
      child: TextFormField(
        autocorrect: false,
        controller: controller.userC,
        textCapitalization: TextCapitalization.words,
        decoration: InputDecoration.collapsed(
          hintText: 'Username',
          hintStyle: greyTextStyle.copyWith(
            fontSize: width / 25.875,
            fontWeight: FontWeight.w600,
          ),
        ),
        onTap: () => controller.userC.clear(),
        onChanged: (value) {
          final formattedValue =
              value.replaceAllMapped(RegExp('(^|\\s)[a-z]'), (match) {
            return match.group(0)!.toUpperCase();
          });
          if (formattedValue != value) {
            controller.userC.text = formattedValue;
            controller.userC.selection =
                TextSelection.fromPosition(TextPosition(offset: value.length));
          }
        },
      ),
    );
  }
}
