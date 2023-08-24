import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:disaster_mapper/app/modules/utils/theme.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../routes/app_pages.dart';

class AuthController extends GetxController {
  FirebaseAuth auth = FirebaseAuth.instance;

  Stream<User?> get streamAuthStatus => auth.authStateChanges();
  void resetPassword(String email) async {
    if (email != "" && GetUtils.isEmail(email)) {
      try {
        await auth.sendPasswordResetEmail(email: email);
        Get.snackbar(
          "Berhasil",
          "Kami telah mengirimkan reset password ke email $email.",
          colorText: Colors.white,
          backgroundColor: Colors.green,
          duration: Duration(seconds: 5),
          snackPosition: SnackPosition.TOP,
          margin: EdgeInsets.all(16.0),
          icon: Icon(
            Icons.check,
            color: Colors.white,
          ),
        );
      } catch (e) {
        Get.snackbar(
          "Terjadi Kesalahan",
          "Tidak dapat mengirimkan reset password.",
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
          snackPosition: SnackPosition.TOP,
          margin: EdgeInsets.all(16.0),
          icon: Icon(
            Icons.warning,
            color: Colors.white,
          ),
        );
      }
    } else {
      Get.snackbar(
        "Terjadi Kesalahan",
        "Email tidak valid.",
        backgroundColor: Colors.red,
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        margin: EdgeInsets.all(16.0),
        icon: Icon(
          Icons.warning,
          color: Colors.white,
        ),
      );
    }
  }

  String? admindesaSelectedDesa;
  String? loggedinUserId;
  String? adminSelectedKabupaten;
  Future<void> login(String email, String password) async {
    try {
      QuerySnapshot<Map<String, dynamic>> adminQuerySnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .where('role', whereIn: ['admin', 'admindesa'])
              .where('email', isEqualTo: email)
              .limit(1)
              .get();

      if (adminQuerySnapshot.docs.isNotEmpty) {
        DocumentSnapshot<Map<String, dynamic>> userSnapshot =
            adminQuerySnapshot.docs.first;
        String storedPassword = userSnapshot['password'];
        String role = userSnapshot['role'];

        if (storedPassword == password) {
          if (role == 'admin') {
            String uid = userSnapshot.id;
            await FirebaseFirestore.instance
                .collection('users')
                .doc(uid)
                .update({'uid': uid});
            Get.offAllNamed(Routes.BOTTOM_ADMIN);
            loggedinUserId = userSnapshot['uid'];
            adminSelectedKabupaten = userSnapshot['selectedKabupaten'];
          } else if (role == 'admindesa') {
            String uid = userSnapshot.id;
            await FirebaseFirestore.instance
                .collection('users')
                .doc(uid)
                .update({'uid': uid});
            Get.offAllNamed(Routes.BOTTOM_ADMIN_DESA);
            loggedinUserId = userSnapshot['uid'];
            admindesaSelectedDesa = userSnapshot['selectedDesa'];
          }
          return;
        }
      }

      UserCredential myUser = await auth.signInWithEmailAndPassword(
        email: email,
        password: password,
      );

      DocumentSnapshot<Map<String, dynamic>> userSnapshot =
          await FirebaseFirestore.instance
              .collection('users')
              .doc(myUser.user!.uid)
              .get();

      Map<String, dynamic>? userData = userSnapshot.data();

      if (userData != null) {
        String role = userData['role'];

        if (myUser.user!.emailVerified) {
          Get.offAllNamed(Routes.BOTTOM_USER);
        } else {
          Get.snackbar(
            "Verifikasi Email",
            "Kamu perlu verifikasi email terlebih dahulu. Apakah kamu ingin dikirimkan verifikasi ulang ?",
            backgroundColor: Colors.yellow,
            duration: Duration(seconds: 10),
            snackPosition: SnackPosition.TOP,
            mainButton: TextButton(
              onPressed: () async {
                await myUser.user!.sendEmailVerification();
                Get.back();
              },
              child: Text("Kirim Ulang"),
            ),
            icon: Icon(Icons.email),
          );
        }
      }
    } on FirebaseAuthException catch (e) {
      if (e.code == 'user-not-found' || e.code == 'wrong-password') {
        print('Invalid email or password.');
        Get.snackbar(
          "Terjadi Kesalahan",
          'Email atau kata sandi salah.',
          colorText: kWhiteColor,
          backgroundColor: Colors.red,
          margin: EdgeInsets.all(16.0),
          duration: Duration(seconds: 3),
          snackPosition: SnackPosition.TOP,
        );
      } else {
        print('Authentication error: ${e.message}');
        Get.snackbar(
          "Terjadi Kesalahan",
          'Tidak dapat login dengan akun ini.',
          colorText: kWhiteColor,
          backgroundColor: Colors.red,
          margin: EdgeInsets.all(16.0),
          duration: Duration(seconds: 3),
          snackPosition: SnackPosition.TOP,
        );
      }
    } catch (e) {
      print('Authentication error: $e');
      Get.snackbar(
        "Terjadi Kesalahan",
        'Tidak dapat login dengan akun ini.',
        colorText: kWhiteColor,
        backgroundColor: Colors.red,
        margin: EdgeInsets.all(16.0),
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
      );
    }
  }

   Future<void> signup(String username, String email, String password) async {
    if (password.length < 8) {
      Get.snackbar(
        "Terjadi Kesalahan",
        'Sandi harus memiliki minimal 8 karakter.',
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
      );
      return;
    }

    try {
      UserCredential myUser =
          await FirebaseAuth.instance.createUserWithEmailAndPassword(
        email: email,
        password: password,
      );

      await myUser.user!.updateProfile(displayName: username);

      await myUser.user!.sendEmailVerification();

      Timestamp createdAt = Timestamp.now();

      await FirebaseFirestore.instance
          .collection('users')
          .doc(myUser.user!.uid)
          .set({
        'uid': myUser.user!.uid,
        'username': username,
        'email': email,
        'created_at': createdAt,
        'role': 'user',
        'photoURL': null,
      });

      Get.snackbar(
        "Email Verifikasi",
        "Kami telah mengiriman email verifikasi ke $email.",
        backgroundColor: Colors.green,
        colorText: Colors.white,
        duration: Duration(seconds: 5),
        snackPosition: SnackPosition.TOP,
        icon: Icon(
          Icons.email,
          color: Colors.white,
        ),
        mainButton: TextButton(
          onPressed: () {
            Get.back();
          },
          child: Text(
            "Ya, Saya akan cek email.",
            style: TextStyle(color: Colors.green),
          ),
        ),
      );
    } on FirebaseAuthException catch (e) {
      if (e.code == 'weak-password') {
        print('The password provided is too weak.');
        Get.snackbar(
          "Terjadi Kesalahan",
          'Sandi yang diberikan terlalu lemah.',
          backgroundColor: Colors.red,
          colorText: Colors.white,
          duration: Duration(seconds: 3),
          snackPosition: SnackPosition.TOP,
          icon: Icon(
            Icons.error,
            color: Colors.white,
          ),
        );
      } else if (e.code == 'email-already-in-use') {
        print('The account already exists for that email.');
        Get.snackbar(
          "Akun sudah ada",
          "Akun sudah ada untuk email yang akan didaftarkan",
          backgroundColor: Colors.yellow,
          colorText: Colors.black,
          duration: Duration(seconds: 3),
          snackPosition: SnackPosition.TOP,
          icon: Icon(
            Icons.warning,
            color: Colors.black,
          ),
        );
      }
    } catch (e) {
      print(e);
      Get.snackbar(
        "Terjadi Kesalahan",
        "Tidak dapat mendaftarkan akun ini.",
        backgroundColor: Colors.red,
        colorText: Colors.white,
        duration: Duration(seconds: 3),
        snackPosition: SnackPosition.TOP,
        icon: Icon(
          Icons.error,
          color: Colors.white,
        ),
      );
    }
  }

  void logout() async {
    await FirebaseAuth.instance.signOut();
    Get.offAllNamed(Routes.LOGIN);
  }
}
