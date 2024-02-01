import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/core/constant/AppImage.dart';
import 'package:ecommerce_app/pages/auth/Login/login_controller.dart';
import 'package:ecommerce_app/pages/auth/widgets/CustomButtomAuth.dart';
import 'package:ecommerce_app/pages/auth/widgets/CustomTextFormFieldAuth.dart';
import 'package:ecommerce_app/pages/auth/widgets/customtexttitleauth.dart';
import 'package:ecommerce_app/pages/auth/widgets/googleAuthButton.dart';
import 'package:ecommerce_app/pages/auth/widgets/logoauth.dart';
import 'package:ecommerce_app/pages/auth/widgets/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import '../../../../core/functions/validinput.dart';

class Login extends StatelessWidget {
  const Login({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(LoginControllerImp());
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0.0,
      ),
      body: GetBuilder<LoginControllerImp>(
        builder: (controller) => Container(
          padding: EdgeInsets.symmetric(vertical: 5.spMin, horizontal: 5.spMin),
          child: Form(
            key: controller.formstate,
            child: ListView(children: [
              CustomTextTitleAuth(text: "16".tr),

              const LogoAuth(name: AppImage.appIcon),
              // CustomTextBodyAuth(text: '2'.tr),
              CustomTextFormAuth(
                isNumber: false,
                onFieldSubmitted: (p0) {
                  FocusScope.of(context)
                      .requestFocus(controller.field2FocusNode);
                },
                textInputAction: TextInputAction.next,
                focusNode: controller.field1FocusNode,
                keyboardType: TextInputType.emailAddress,
                valid: (val) {
                  return validInput(val!, 5, 100, "email");
                },
                mycontroller: controller.email,
                hinttext: "3".tr,
                iconData: Icons.email_outlined,
                labeltext: "3".tr,
              ),
              GetBuilder<LoginControllerImp>(
                builder: (controller) => CustomTextFormAuth(
                  obscureText: controller.isshowpassword,
                  focusNode: controller.field2FocusNode,
                  onFieldSubmitted: (_) {
                    controller.login();
                  },
                  onTapIcon: () {
                    controller.showPassword();
                  },
                  isNumber: false,
                  valid: (val) {
                    return validInput(val!, 8, 30, "password");
                  },
                  mycontroller: controller.password,
                  hinttext: "4".tr,
                  iconData: controller.isshowpassword
                      ? Icons.lock_outline
                      : Icons.lock_open_outlined,
                  labeltext: "4".tr,
                  // mycontroller: ,
                ),
              ),
              InkWell(
                onTap: () {
                  controller.goToForgetPassword();
                },
                child: Text(
                  "5".tr,
                  textAlign: TextAlign.right,
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(color: AppColor.primary),
                ),
              ),
              CustomButtomAuth(
                  text: "6".tr,
                  onPressed: () {
                    controller.login();
                  }),
              googleAuthButton(
                onTap: () {},
              ),
              const SizedBox(height: 40),
              CustomTextSignUpOrSignIn(
                textone: "7".tr,
                texttwo: "8".tr,
                onTap: () {
                  controller.goToSignUp();
                },
              )
            ]),
          ),
        ),
      ),
    );
  }
}
