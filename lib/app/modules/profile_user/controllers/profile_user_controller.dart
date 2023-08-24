import 'dart:io';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

import '../../../routes/app_pages.dart';

class ProfileUserController extends GetxController {
   double get width => Get.width;
  FirebaseAuth _auth = FirebaseAuth.instance;
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Rxn<DocumentSnapshot> userProfile = Rxn<DocumentSnapshot>();

  TextEditingController usernameController = TextEditingController();

  @override
  void onInit() {
    super.onInit();
    String uid = _auth.currentUser?.uid ?? '';
    userProfile.bindStream(userStream(uid));
  }

  @override
  void onClose() {

    super.onClose();
  }

  void pickAndUploadImage() async {
    final picker = ImagePicker();
    final pickedFile = await picker.pickImage(source: ImageSource.gallery);

    if (pickedFile != null) {
      File imageFile = File(pickedFile.path);
      try {
        String uid = _auth.currentUser?.uid ?? '';
        Reference ref = FirebaseStorage.instance.ref().child('profile/$uid');
        UploadTask uploadTask = ref.putFile(imageFile);
        TaskSnapshot uploadSnapshot = await uploadTask;
        String url = await uploadSnapshot.ref.getDownloadURL();
        await _firestore.collection('users').doc(uid).update({
          'photoURL': url,
        });
        print("URL is $url");
      } catch (e) {
        Get.snackbar(
          'Error',
          'Could not upload the image. Please try again later.',
          duration: Duration(seconds: 3),
        );
      }
    } else {
      print('No image selected.');
    }
  }

  void updateProfile({String? photoUrl}) async {
    String newUsername = usernameController.text.trim();

    if (newUsername.isNotEmpty) {
      String uid = _auth.currentUser?.uid ?? '';
      try {
        Map<String, dynamic> updates = {'username': newUsername};
        if (photoUrl != null) {
          updates['photoURL'] = photoUrl;
        }
        await _firestore.collection('users').doc(uid).update(updates);

        Get.snackbar(
          'Profile Berhasil Di Perbaharui',
          'Data Profil Berhasil Di Perbaharui',
          duration: Duration(seconds: 3),
        );
        Get.offAllNamed(Routes.BOTTOM_USER);
      } catch (e) {
        Get.snackbar(
          'Terjadi Kesalahan',
          'Gagal Melakukan Update',
          duration: Duration(seconds: 3),
        );
      }
    } else {
      Get.snackbar(
        'Terjadi Kesalahan',
        'Mohon Isi Username',
        duration: Duration(seconds: 3),
      );
    }
  }

  Stream<DocumentSnapshot> userStream(String uid) {
    return _firestore.collection('users').doc(uid).snapshots();
  }
}
