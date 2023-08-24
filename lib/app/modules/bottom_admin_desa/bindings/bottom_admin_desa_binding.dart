import 'package:get/get.dart';

import '../controllers/bottom_admin_desa_controller.dart';

class BottomAdminDesaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomAdminDesaController>(
      () => BottomAdminDesaController(),
    );
  }
}
