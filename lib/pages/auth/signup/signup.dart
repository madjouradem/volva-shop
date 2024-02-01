import 'package:ecommerce_app/pages/auth/signup/signup_controller.dart';
import 'package:ecommerce_app/pages/auth/widgets/CustomButtomAuth.dart';
import 'package:ecommerce_app/pages/auth/widgets/CustomTextFormFieldAuth.dart';
import 'package:ecommerce_app/pages/auth/widgets/customtexttitleauth.dart';
import 'package:ecommerce_app/pages/auth/widgets/googleAuthButton.dart';
import 'package:ecommerce_app/pages/auth/widgets/textsignup.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../core/functions/validinput.dart';

class SignUp extends StatelessWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(SignUpControllerImp());
    return Scaffold(
      body: GetBuilder<SignUpControllerImp>(
        builder: (controller) => Container(
          padding: EdgeInsets.symmetric(vertical: 5.h, horizontal: 5.w),
          child: Form(
            key: controller.formstate,
            child: ListView(children: [
              SizedBox(height: 45.h),
              CustomTextTitleAuth(text: "9".tr),
              // CustomTextBodyAuth(text: '10'.tr),
              SizedBox(height: 45.h),
              CustomTextFormAuth(
                isNumber: false,
                valid: (val) {
                  return validInput(val!, 3, 30, "username");
                },
                mycontroller: controller.username,
                focusNode: controller.field1FocusNode,
                onFieldSubmitted: (p0) {
                  FocusScope.of(context)
                      .requestFocus(controller.field2FocusNode);
                },
                textInputAction: TextInputAction.next,
                hinttext: "11".tr,
                iconData: Icons.person_outline,
                labeltext: "11".tr,
                // mycontroller: ,
              ),
              CustomTextFormAuth(
                isNumber: false,
                valid: (val) {
                  return validInput(val!, 3, 40, "email");
                },
                mycontroller: controller.email,
                keyboardType: TextInputType.emailAddress,

                hinttext: "12".tr,
                iconData: Icons.email_outlined,
                labeltext: "12".tr,
                focusNode: controller.field2FocusNode,
                onFieldSubmitted: (p0) {
                  FocusScope.of(context)
                      .requestFocus(controller.field3FocusNode);
                },
                textInputAction: TextInputAction.next,
                // mycontroller: ,
              ),
              CustomTextFormAuth(
                obscureText: controller.isshowpassword,
                onTapIcon: () {
                  controller.showPassword();
                },
                focusNode: controller.field3FocusNode,
                onFieldSubmitted: (p0) {
                  FocusScope.of(context)
                      .requestFocus(controller.field4FocusNode);
                },
                textInputAction: TextInputAction.next,

                valid: (val) {
                  return validInput(val!, 8, 30, "password");
                },
                mycontroller: controller.password,
                hinttext: "13".tr,
                iconData: controller.isshowpassword
                    ? Icons.lock_outline
                    : Icons.lock_open_outlined,
                labeltext: "13".tr,
                // mycontroller: ,
              ),
              CustomTextFormAuth(
                obscureText: controller.isshowpassword,
                onTapIcon: () {
                  controller.showPassword();
                },
                focusNode: controller.field4FocusNode,
                onFieldSubmitted: (p0) {
                  controller.signUp();
                },
                valid: (val) {
                  return validInput(val!, 8, 30, "password");
                },
                mycontroller: controller.confirmpassword,
                hinttext: "14".tr,
                iconData: controller.isshowpassword
                    ? Icons.lock_outline
                    : Icons.lock_open_outlined,
                labeltext: "14".tr,
                // mycontroller: ,
              ),
              CustomButtomAuth(
                  text: "9".tr,
                  onPressed: () {
                    controller.signUp();
                  }),
              googleAuthButton(
                onTap: () {},
              ),
              SizedBox(height: 35.h),
              CustomTextSignUpOrSignIn(
                textone: "15".tr,
                texttwo: "16".tr,
                onTap: () {
                  controller.goToSignIn();
                },
              ),
            ]),
          ),
        ),
      ),
    );
  }
}
