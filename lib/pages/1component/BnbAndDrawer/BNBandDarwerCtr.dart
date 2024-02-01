import 'package:get/get.dart';

class BNBandDarwerCtr extends GetxController {
  int currentNum = 0;
  changeNum(int defaultNum) {
    currentNum = defaultNum;
    update();
  }

  goTo(String route) {
    Get.offAllNamed(route);
  }
}
