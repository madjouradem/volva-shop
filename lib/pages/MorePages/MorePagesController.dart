import 'package:ecommerce_app/core/calsses/StatusRequest.dart';
import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:ecommerce_app/core/constant/AppRoute.dart';
import 'package:ecommerce_app/core/functions/checkInternet.dart';
import 'package:ecommerce_app/pages/MorePages/MorePagesData.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:get/get.dart';

abstract class MorePagesCtrAbs extends GetxController {
  logOut();
}

class MorePagesCtr extends MorePagesCtrAbs {
  StatusRequest statusRequest = StatusRequest.none;
  MorePagesData data = MorePagesData();
  MyServices myServices = Get.find();

  @override
  logOut() async {
    if (await checkInternet()) {
      await FirebaseMessaging.instance.unsubscribeFromTopic('users');
      await FirebaseMessaging.instance.unsubscribeFromTopic(
          'users${myServices.box.read("user")['user_id']}');
      myServices.box.remove("user");
      myServices.box.remove("step");
      Get.offAllNamed(AppRoute.login);
    } else {
      Get.snackbar('Logout failed', 'check your internet');
    }
  }
}
