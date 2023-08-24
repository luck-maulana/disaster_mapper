import 'package:get/get.dart';

import '../controllers/admin_desa_data_controller.dart';

class AdminDesaDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminDesaDataController>(
      () => AdminDesaDataController(),
    );
  }
}
