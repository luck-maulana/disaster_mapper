import 'package:disaster_mapper/app/modules/admin_data/views/admin_data_view.dart';
import 'package:disaster_mapper/app/modules/admin_home/views/admin_home_view.dart';
import 'package:get/get.dart';

import '../../edukasi/views/edukasi_view2.dart';

class BottomAdminController extends GetxController {
  RxInt currentIndex = 0.obs;

  var pages = [
    AdminHomeView(),
    EdukasiView(),
    AdminDataView(),
  ];
}
