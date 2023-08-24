import 'package:get/get.dart';

import '../controllers/information_pendataan_controller.dart';

class InformationPendataanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InformationPendataanController>(
      () => InformationPendataanController(),
    );
  }
}
