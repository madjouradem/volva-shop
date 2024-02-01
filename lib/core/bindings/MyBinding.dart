import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:get/get.dart';

class MyBinding implements Bindings {
  @override
  void dependencies() {
    Get.put(MyServices(), permanent: true);
    // Get.put(LanguageCtr(), permanent: true);
  }
}
