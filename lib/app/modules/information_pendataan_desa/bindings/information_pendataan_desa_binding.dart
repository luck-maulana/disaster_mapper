import 'package:get/get.dart';

import '../controllers/information_pendataan_desa_controller.dart';

class InformationPendataanDesaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<InformationPendataanDesaController>(
      () => InformationPendataanDesaController(),
    );
  }
}
