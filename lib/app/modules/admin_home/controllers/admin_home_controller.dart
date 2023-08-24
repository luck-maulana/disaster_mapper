import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../../data/count_kabupaten.dart';
import '../../../data/user_model.dart';

class AdminHomeController extends GetxController {
  UserModel? userData;
  CountKabupaten? countKabupaten;

  @override
  void onInit() {
    super.onInit();
    fetchUserData();
    fecthDataKabupaten();
  }

  Future<void> fetchUserData() async {
    try {
      String? userId = Get.find<AuthController>().loggedinUserId;
      if (userId != null) {
        DocumentSnapshot<Map<String, dynamic>> userSnapshot =
            await FirebaseFirestore.instance
                .collection('users')
                .doc(userId)
                .get();
        if (userSnapshot.exists) {
          userData = UserModel.fromMap(userSnapshot.data()!);
          update();
        }
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }

  Future<void> fecthDataKabupaten() async {
    try {
      String? countKab = Get.find<AuthController>().adminSelectedKabupaten;
      if (countKab != null) {
        DocumentSnapshot<Map<String, dynamic>> userSnapshot =
            await FirebaseFirestore.instance
                .collection('data_kabupaten')
                .doc(countKab)
                .get();
        if (userSnapshot.exists) {
          countKabupaten = CountKabupaten.fromMap(userSnapshot.data()!);
          update();
        }
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }
}
