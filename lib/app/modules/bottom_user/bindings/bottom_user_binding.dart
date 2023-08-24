import 'package:get/get.dart';

import '../controllers/bottom_user_controller.dart';

class BottomUserBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<BottomUserController>(
      () => BottomUserController(),
    );
  }
}
