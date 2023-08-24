import 'package:disaster_mapper/app/modules/information_pendataan/views/information_pendataan_view.dart';
import 'package:get/get.dart';

import '../../home/views/home_view.dart';
import '../../profile_user/views/profile_user_view.dart';

class BottomUserController extends GetxController {
  RxInt currentIndex = 0.obs;

  var pages = [
    HomeView(),
    InformationPendataanView(),
    ProfileUserView(),
  ];
}
