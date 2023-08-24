import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../../../routes/app_pages.dart';
import '../../utils/theme.dart';
import '../controllers/reset_password_controller.dart';
import '../../../controllers/auth_controller.dart';

class ResetPasswordView extends GetView<ResetPasswordController> {
  final authC = Get.find<AuthController>();
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              color: kWhiteColor,
            ),
          ),
          SafeArea(
            child: SingleChildScrollView(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 24.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Container(
                      margin: EdgeInsets.only(
                        top: 24,
                        bottom: 15,
                      ),
                      child: Text(
                        'Reset Password',
                        style: orangeRedTextstyle.copyWith(
                          fontSize: controller.width / 12.9375,
                          fontWeight: bold,
                        ),
                      ),
                    ),
                    Container(
                      child: Text(
                        'Silahkan masukan email yang terdaftar untuk mendapatkan link reset password',
                        style: orangeRedTextstyle.copyWith(
                          fontSize: controller.width / 20.7,
                        ),
                      ),
                    ),
                    SizedBox(height: 40.0),
                    Text(
                      'Email',
                      style: orangeRedTextstyle.copyWith(
                        fontSize: controller.width / 20.7,
                        fontWeight: bold,
                      ),
                    ),
                    EmailInput(controller: controller),
                    SizedBox(height: 20),
                    Container(
                      width: double.infinity,
                      height: controller.width / 7.666666667,
                      child: ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          backgroundColor: kOrangeRed,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10.0),
                          ),
                        ),
                        onPressed: () {
                          authC.resetPassword(
                            controller.emailC.text,
                          );
                        },
                        child: Text(
                          'Reset Password',
                          style: whiteTextStyle.copyWith(
                            fontSize: controller.width / 17.25,
                            fontWeight: bold,
                          ),
                        ),
                      ),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Sudah Punya Akun?',
                          style: greyTextStyle.copyWith(
                            fontSize: controller.width / 25.875,
                          ),
                        ),
                        TextButton(
                          onPressed: () {
                            Get.toNamed(Routes.LOGIN);
                          },
                          child: Text(
                            'Login',
                            style: orangeRedTextstyle.copyWith(
                              fontSize: controller.width / 25.875,
                              fontWeight: bold,
                            ),
                          ),
                        ),
                      ],
                    ),
                    SizedBox(height: 8.0),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final ResetPasswordController controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(
        top: 15,
        bottom: 15,
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
      child: TextFormField(
        autocorrect: false,
        controller: controller.emailC,
        decoration: InputDecoration.collapsed(
          hintText: 'Email',
          hintStyle: greyTextStyle.copyWith(
            fontSize: controller.width / 25.875,
            fontWeight: semiBold,
          ),
        ),
        onTap: () => controller.emailC.clear(),
      ),
    );
  }
}
