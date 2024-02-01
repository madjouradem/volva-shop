import 'package:ecommerce_app/core/constant/AppImage.dart';
import 'package:ecommerce_app/pages/auth/forgetpassword/resetpassword/resetpassword_controller.dart';
import 'package:ecommerce_app/pages/auth/widgets/CustomButtomAuth.dart';
import 'package:ecommerce_app/pages/auth/widgets/CustomTextFormFieldAuth.dart';
import 'package:ecommerce_app/pages/auth/widgets/customtextbodyauth.dart';
import 'package:ecommerce_app/pages/auth/widgets/customtexttitleauth.dart';
import 'package:ecommerce_app/pages/auth/widgets/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/functions/validinput.dart';

class ResetPassword extends StatelessWidget {
  const ResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ResetPasswordControllerImp());
    return Scaffold(
        body: GetBuilder<ResetPasswordControllerImp>(
            builder: (controller) => Container(
                  padding: EdgeInsets.symmetric(
                      vertical: 5.spMin, horizontal: 5.spMin),
                  child: Form(
                    key: controller.formstate,
                    child: ListView(children: [
                      SizedBox(height: 20.h),
                      CustomTextTitleAuth(text: "23".tr),
                      SizedBox(height: 15.h),
                      CustomTextBodyAuth(text: '24'.tr),
                      const LogoAuth(name: AppImage.resetPassword),
                      CustomTextFormAuth(
                        obscureText: controller.isshowpassword,
                        focusNode: controller.field1FocusNode,
                        onFieldSubmitted: (p0) {
                          FocusScope.of(context)
                              .requestFocus(controller.field2FocusNode);
                        },
                        textInputAction: TextInputAction.next,
                        onTapIcon: () {
                          controller.showPassword();
                        },
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 8, 30, "password");
                        },
                        mycontroller: controller.password,
                        hinttext: "25".tr,
                        iconData: controller.isshowpassword
                            ? Icons.lock_outline
                            : Icons.lock_open_outlined,
                        labeltext: "25".tr,
                        // mycontroller: ,
                      ),
                      CustomTextFormAuth(
                        obscureText: controller.isshowpassword,
                        onTapIcon: () {
                          controller.showPassword();
                        },
                        focusNode: controller.field2FocusNode,
                        onFieldSubmitted: (p0) {
                          controller.goToSuccessResetPassword();
                        },
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 8, 30, "password");
                        },
                        mycontroller: controller.repassword,
                        hinttext: "26".tr,
                        iconData: controller.isshowpassword
                            ? Icons.lock_outline
                            : Icons.lock_open_outlined,
                        labeltext: "26".tr,
                        // mycontroller: ,
                      ),
                      CustomButtomAuth(
                          text: "20".tr,
                          onPressed: () {
                            controller.goToSuccessResetPassword();
                          }),
                      SizedBox(height: 35.h),
                    ]),
                  ),
                )));
  }
}
