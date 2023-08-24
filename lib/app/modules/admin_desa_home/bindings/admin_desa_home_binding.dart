import 'package:get/get.dart';

import '../controllers/admin_desa_home_controller.dart';

class AdminDesaHomeBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminDesaHomeController>(
      () => AdminDesaHomeController(),
    );
  }
}
