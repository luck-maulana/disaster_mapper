import 'package:get/get.dart';

class InformationPendataanController extends GetxController {
  RxBool isContainerExpanded = RxBool(false);
  RxDouble opacityLevel = RxDouble(1.0);

   double get width => Get.width;

  void toggleContainer() {
    isContainerExpanded.toggle();
    opacityLevel.value = isContainerExpanded.value ? 0.0 : 1.0;
  }
}
