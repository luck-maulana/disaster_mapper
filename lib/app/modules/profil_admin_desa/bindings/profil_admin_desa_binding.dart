import 'package:get/get.dart';

import '../controllers/profil_admin_desa_controller.dart';

class ProfilAdminDesaBinding extends Bindings {
  @override
  void dependencies() {
    Get.lazyPut<ProfilAdminDesaController>(
      () => ProfilAdminDesaController(),
    );
  }
}
