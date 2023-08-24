import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:get/get.dart';

import '../../../controllers/auth_controller.dart';
import '../../../data/count_desa.dart';
import '../../../data/user_model.dart';

class AdminDesaDataController extends GetxController {
  UserModel? userData;
  CountDesa? countDesa;
double get width => Get.width;


  @override
  void onInit() {
    super.onInit();
    fetchUserData();
    fetchDataDesa();
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

  Future<void> fetchDataDesa() async {
    try {
      String? countDesa1 = Get.find<AuthController>().admindesaSelectedDesa;
      if (countDesa1 != null) {
        DocumentSnapshot<Map<String, dynamic>> userSnapshot =
            await FirebaseFirestore.instance
                .collection('data_desa')
                .doc(countDesa1)
                .get();
        if (userSnapshot.exists) {
          countDesa = CountDesa.fromMap(userSnapshot.data()!);
          update();
        }
      }
    } catch (e) {
      print('Error fetching user data: $e');
    }
  }
}
