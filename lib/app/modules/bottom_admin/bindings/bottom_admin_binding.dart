import 'package:get/get.dart';

import '../controllers/bottom_admin_controller.dart';

class BottomAdminBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomAdminController>(
      () => BottomAdminController(),
    );
  }
}
