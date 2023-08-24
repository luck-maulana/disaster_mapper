import 'package:get/get.dart';

import '../controllers/pelajari_pendataan_controller.dart';

class PelajariPendataanBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<PelajariPendataanController>(
      () => PelajariPendataanController(),
    );
  }
}
