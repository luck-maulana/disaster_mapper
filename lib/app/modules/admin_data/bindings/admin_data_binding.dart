import 'package:get/get.dart';

import '../controllers/admin_data_controller.dart';

class AdminDataBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<AdminDataController>(
      () => AdminDataController(),
    );
  }
}
