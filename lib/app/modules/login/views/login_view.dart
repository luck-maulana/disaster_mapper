import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../../routes/app_pages.dart';

import '../../utils/theme.dart';
import '../controllers/login_controller.dart';

class LoginView extends GetView<LoginController> {
  const LoginView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
    return Scaffold(
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
                colors: [Color(0xffFF581A), Color(0xffB93200)],
              ),
            ),
          ),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  decoration: BoxDecoration(
                    image: DecorationImage(
                      image: AssetImage('assets/Logo.png'),
                      fit: BoxFit.fill,
                    ),
                  ),
                  width: controller.width / 2.8951,
                  height: controller.width / 2.8951,
                ),
                SizedBox(height: 16),
                Text(
                  'PENDATAAN',
                  style: whiteTextStyle.copyWith(
                    fontSize: controller.width / 14.7857,
                    fontWeight: bold,
                  ),
                ),
                Text(
                  'G E M P A',
                  style: whiteTextStyle.copyWith(
                    fontSize: controller.width / 18.8181,
                    fontWeight: medium,
                  ),
                  textAlign: TextAlign.center,
                ),
              ],
            ),
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                Container(
                  width: double.infinity,
                  height: controller.width / 7.666666667,
                  padding: EdgeInsets.only(
                    left: 24,
                    right: 24,
                    //  bottom: 10,
                  ),
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      backgroundColor: kOrangeRed,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10.0),
                      ),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(
                          builder: (context) => LoginPage2(),
                        ),
                      );
                    },
                    child: Text(
                      'Login',
                      style: whiteTextStyle.copyWith(
                        fontSize: controller.width / 17.25,
                        fontWeight: bold,
                      ),
                    ),
                  ),
                ),
                //SizedBox(height: 8.0),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Text(
                      'Belum Punya Akun?',
                      style: whiteTextStyle.copyWith(
                        fontSize: controller.width / 25.875,
                      ),
                    ),
                    TextButton(
                      onPressed: () {
                        Get.toNamed(Routes.SIGNUP);
                      },
                      child: Text(
                        'Register',
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
        ],
      ),
    );
  }
}

class LoginPage2 extends GetView<LoginController> {
  const LoginPage2({super.key});

  @override
  Widget build(BuildContext context) {
    final authC = Get.find<AuthController>();
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
                      'Selamat Datang!',
                      style: orangeRedTextstyle.copyWith(
                        fontSize: controller.width / 12.9375,
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
                      'Masuk untuk melanjutkan',
                      style: orangeRedTextstyle.copyWith(
                        fontSize: controller.width / 20.7,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        SizedBox(height: 40.0),
                        Text(
                          'Email',
                          style: orangeRedTextstyle.copyWith(
                            fontSize: controller.width / 20.7,
                            fontWeight: bold,
                          ),
                        ),
                        EmailInput(controller: controller),
                        Text(
                          'Password',
                          style: orangeRedTextstyle.copyWith(
                            fontSize: controller.width / 20.7,
                            fontWeight: bold,
                          ),
                        ),
                        PasswordInput(controller: controller),
                        Row(
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Container(
                              margin: EdgeInsets.only(
                                bottom: controller.width / 20.7,
                              ),
                              child: TextButton(
                                onPressed: () {
                                  Get.toNamed(Routes.RESET_PASSWORD);
                                },
                                child: Text(
                                  'Lupa Password?',
                                  style: orangeRedTextstyle.copyWith(
                                    fontSize: controller.width / 23,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ],
                    ),
                  ),
                  Container(
                    width: double.infinity,
                    height: controller.width / 7.6666,
                    padding: EdgeInsets.symmetric(
                      horizontal: 24,
                      //  bottom: 10,
                    ),
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: kOrangeRed,
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(10.0),
                        ),
                      ),
                      onPressed: () {
                        authC.login(
                          controller.emailC.text,
                          controller.passC.text,
                        );
                      },
                      child: Text(
                        'Login',
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
                        'Belum Punya Akun?',
                        style: greyTextStyle.copyWith(
                          fontSize: controller.width / 25.875,
                        ),
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.SIGNUP);
                        },
                        child: Text(
                          'Register',
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
        ],
      ),
    );
  }
}

class PasswordInput extends StatelessWidget {
  PasswordInput({
    super.key,
    required this.controller,
  });

  final LoginController controller;
  final FocusNode _passwordFocus = FocusNode();
  void _showErrorToast(String message) {
    Fluttertoast.showToast(
      msg: message,
      toastLength: Toast.LENGTH_SHORT,
      gravity: ToastGravity.TOP,
      backgroundColor: Colors.red,
      textColor: Colors.white,
    );
  }

  @override
  Widget build(BuildContext context) {
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
                controller: controller.passC,
                decoration: InputDecoration.collapsed(
                  hintText: 'Password',
                  hintStyle: greyTextStyle.copyWith(
                    fontSize: controller.width / 25.875,
                    fontWeight: semiBold,
                  ),
                ),
                focusNode: _passwordFocus,
                onEditingComplete: () {
                  final value = controller.passC.text;
                  if (value.isEmpty) {
                    _showErrorToast('Password harus diisi.');
                  } else if (value.length < 8) {
                    _showErrorToast(
                        'Password harus memiliki minimal 8 karakter.');
                  }
                  _passwordFocus.unfocus();
                },
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
                  size: controller.width / 20.7,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class EmailInput extends StatelessWidget {
  const EmailInput({
    Key? key,
    required this.controller,
  }) : super(key: key);

  final LoginController controller;

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
