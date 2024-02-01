import 'package:ecommerce_app/core/functions/showAlert.dart';
import 'package:ecommerce_app/pages/auth/signup/signupData.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

import '../../../core/calsses/StatusRequest.dart';
import '../../../core/constant/AppRoute.dart';
import '../../../core/functions/alertWaiting.dart';
import '../../../core/functions/handlingData.dart';

abstract class SignUpController extends GetxController {
  signUp();
  goToSignIn();
}

class SignUpControllerImp extends SignUpController {
  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  late TextEditingController username;
  late TextEditingController email;
  late TextEditingController password;
  late TextEditingController confirmpassword;

  FocusNode field1FocusNode = FocusNode();
  FocusNode field2FocusNode = FocusNode();
  FocusNode field3FocusNode = FocusNode();
  FocusNode field4FocusNode = FocusNode();

  StatusRequest statusRequest = StatusRequest.none;

  SignupData signupData = SignupData();
  List data = [];

  bool isshowpassword = true;

  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  signUp() async {
    if (formstate.currentState!.validate()) {
      if (confirmpassword.text == password.text) {
        statusRequest = StatusRequest.loading;
        update();
        alertWaiting();

        var response = await signupData.postdata(
          username.text,
          password.text,
          email.text,
        );
        // print("=============================== Controller $response ");

        statusRequest = handlingData(response);
        print('("=============================== $statusRequest');

        if (StatusRequest.success == statusRequest) {
          if (response['status'] == "success") {
            // data.addAll(response['data']);
            Get.offNamed(AppRoute.verfiyCodeSignUp,
                arguments: {"email": email.text});
          } else {
            Get.back();
            Get.defaultDialog(
                title: "ُWarning",
                middleText: "Phone Number Or Email Already Exists");
            statusRequest = StatusRequest.failure;
          }
        }
        update();
      } else {
        showAlert(title: 'Alert', content: 'Wrong confirm password ');
      }
    } else {}
  }

  @override
  goToSignIn() {
    Get.back();
  }

  @override
  void onInit() {
    username = TextEditingController();
    email = TextEditingController();
    password = TextEditingController();
    confirmpassword = TextEditingController();
    super.onInit();
  }

  @override
  void dispose() {
    username.dispose();
    email.dispose();
    password.dispose();
    super.dispose();
  }
}
