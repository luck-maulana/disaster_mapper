import 'package:disaster_mapper/app/controllers/auth_controller.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../../utils/theme.dart';
import '../controllers/profile_user_controller.dart';

class ProfileUserView extends GetView<ProfileUserController> {
  AuthController authC = Get.find<AuthController>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Obx(
        () {
          if (controller.userProfile.value != null &&
              controller.userProfile.value!.exists == true) {
            var userData =
                controller.userProfile.value!.data() as Map<String, dynamic>;
            return SafeArea(
              child: Column(
                children: [
                  Container(
                    height: controller.width / 1.656,
                    color: kBlackColor,
                    child: Padding(
                      padding: const EdgeInsets.all(24.0),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Row(
                            children: [
                              Container(
                                child: Obx(
                                  () {
                                    String? photoUrl = controller
                                        .userProfile.value?['photoURL'];
                                    return Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.center,
                                      children: [
                                        GestureDetector(
                                          onTap: controller.pickAndUploadImage,
                                          child: Stack(
                                            alignment: Alignment.bottomCenter,
                                            children: [
                                              CircleAvatar(
                                                radius: controller.width / 8.28,
                                                backgroundImage:
                                                    photoUrl != null
                                                        ? NetworkImage(photoUrl)
                                                        : null,
                                                child: photoUrl == null
                                                    ? Icon(
                                                        Icons.person,
                                                        size: controller.width /
                                                            6.9,
                                                        color: Colors.white,
                                                      )
                                                    : null,
                                              ),
                                              if (photoUrl == null)
                                                Container(
                                                  padding: EdgeInsets.symmetric(
                                                    horizontal: 16,
                                                    vertical: 8,
                                                  ),
                                                  decoration: BoxDecoration(
                                                    color: Colors.black
                                                        .withOpacity(0.7),
                                                    borderRadius:
                                                        BorderRadius.circular(
                                                            8),
                                                  ),
                                                  child: Text(
                                                    'Add Photo',
                                                    style: TextStyle(
                                                      color: Colors.white,
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      fontSize:
                                                          controller.width /
                                                              25.875,
                                                    ),
                                                  ),
                                                ),
                                            ],
                                          ),
                                        ),
                                        SizedBox(height: 16),
                                      ],
                                    );
                                  },
                                ),
                              ),
                              SizedBox(width: 20),
                              Expanded(
                                child: Column(
                                  crossAxisAlignment: CrossAxisAlignment.start,
                                  children: [
                                    Text(
                                      '${userData['username']}',
                                      style: orangeRedTextstyle.copyWith(
                                        fontSize: controller.width / 15.9230,
                                        fontWeight: bold,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                    SizedBox(height: 8),
                                    Text(
                                      '${userData['email']}',
                                      style: whiteTextStyle.copyWith(
                                        fontSize: controller.width / 25.875,
                                      ),
                                      overflow: TextOverflow.ellipsis,
                                    ),
                                  ],
                                ),
                              ),
                            ],
                          ),
                          SizedBox(
                            height: 20,
                          ),
                        ],
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.all(24.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.start,
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Nama',
                          style: blackTextStyle.copyWith(
                            fontSize: controller.width / 20.7,
                            fontWeight: bold,
                          ),
                        ),
                        Container(
                          width: double.infinity,
                          margin: EdgeInsets.only(
                            top: 15,
                            bottom: 15,
                          ),
                          padding: EdgeInsets.all(16),
                          decoration: BoxDecoration(
                            color: kWhiteColor,
                            borderRadius: BorderRadius.circular(14),
                            border: Border.all(
                              color: kBlackColor,
                              width: 1,
                            ),
                          ),
                          child: TextFormField(
                            autocorrect: false,
                            textCapitalization: TextCapitalization.words,
                            controller: controller.usernameController,
                            decoration: InputDecoration.collapsed(
                              hintText: 'Nama',
                              hintStyle: greyTextStyle.copyWith(
                                fontSize: controller.width / 25.875,
                                fontWeight: FontWeight.w600,
                              ),
                            ),
                          ),
                        ),
                        SizedBox(height: 24.0),
                        Container(
                          width: double.infinity,
                          child: ElevatedButton(
                            onPressed: () {
                              controller.updateProfile();
                            },
                            child: Text(
                              'SIMPAN',
                              style: whiteTextStyle.copyWith(
                                fontSize: controller.width / 25.875,
                              ),
                            ),
                            style: ElevatedButton.styleFrom(
                              backgroundColor: kOrangeRed,
                              padding: EdgeInsets.symmetric(vertical: 16),
                              shape: RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          } else if (controller.userProfile.value != null &&
              controller.userProfile.value!.exists == false) {
            return Center(
              child: Text(
                'User does not exist',
                style: TextStyle(
                  fontSize: controller.width / 20.7,
                ),
              ),
            );
          } else {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
        },
      ),
    );
  }
}
