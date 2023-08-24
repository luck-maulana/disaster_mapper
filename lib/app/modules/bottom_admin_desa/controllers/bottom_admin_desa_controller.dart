import 'package:disaster_mapper/app/modules/admin_desa_data/views/admin_desa_data_view.dart';
import 'package:disaster_mapper/app/modules/admin_desa_home/views/admin_desa_home_view.dart';
import 'package:disaster_mapper/app/modules/information_pendataan_desa/views/information_pendataan_desa_view.dart';
import 'package:get/get.dart';

class BottomAdminDesaController extends GetxController {
  RxInt currentIndex = 0.obs;
  RxBool isAdmin = true.obs;
  var pages = [
    AdminDesaDataView(),
    InformationPendataanDesaView(),
    AdminDesaHomeView(),
  ];
}
