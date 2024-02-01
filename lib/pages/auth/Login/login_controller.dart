import 'package:ecommerce_app/core/functions/showAlert.dart';
import 'package:ecommerce_app/pages/auth/Login/loginData.dart';
import 'package:ecommerce_app/core/functions/alertWaiting.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/calsses/StatusRequest.dart';
import '../../../core/calsses/services.dart';
import '../../../core/constant/AppRoute.dart';
import '../../../core/functions/handlingData.dart';

abstract class LoginController extends GetxController {
  login();
  goToSignUp();
  goToForgetPassword();
}

class LoginControllerImp extends LoginController {
  LoginData loginData = LoginData();

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController email;
  late TextEditingController password;
  FocusNode field1FocusNode = FocusNode();
  FocusNode field2FocusNode = FocusNode();

  bool isshowpassword = true;
  MyServices myServices = Get.find();

  StatusRequest statusRequest = StatusRequest.none;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  login() async {
    if (formstate.currentState!.validate()) {
      statusRequest = StatusRequest.loading;
      update();
      var response = await loginData.postdata(email.text, password.text);
      print("=============================== Controller $response ");
      statusRequest = handlingData(response);
      alertWaiting();
      if (StatusRequest.success == statusRequest) {
        if (response['status'] == "success") {
          showAlert(title: 'success', content: 'content'); //temp
          myServices.box.write("user", response['data']);
          myServices.box.write("step", "2");
          await FirebaseMessaging.instance.subscribeToTopic('users');
          await FirebaseMessaging.instance
              .subscribeToTopic('users${response['data']['user_id']}');

          Get.back();
          Get.offAllNamed(AppRoute.home);
        } else {
          Get.back();
          Get.defaultDialog(
              title: "ُWarning", middleText: "Email Or Password Not Correct");
          statusRequest = StatusRequest.failure;
        }
      }
      update();
    } else {}
  }

  @override
  goToSignUp() {
    Get.toNamed(AppRoute.signUp);
  }

  @override
  void onInit() {
    email = TextEditingController();
    password = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    email.dispose();
    password.dispose();
    super.dispose();
  }

  @override
  goToForgetPassword() {
    Get.toNamed(AppRoute.forgetPassword);
  }
}
