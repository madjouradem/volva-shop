import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/core/constant/AppImage.dart';
import 'package:ecommerce_app/pages/auth/forgetpassword/verifycode/verifycode_controller.dart';
import 'package:ecommerce_app/pages/auth/widgets/customtextbodyauth.dart';
import 'package:ecommerce_app/pages/auth/widgets/customtexttitleauth.dart';
import 'package:ecommerce_app/pages/auth/widgets/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VerfiyCode extends StatelessWidget {
  const VerfiyCode({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeControllerImp controller = Get.put(VerifyCodeControllerImp());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(vertical: 5.spMin, horizontal: 5.spMin),
        child: ListView(children: [
          SizedBox(height: 20.h),
          CustomTextTitleAuth(text: "21".tr),
          SizedBox(height: 10.h),
          CustomTextBodyAuth(text: "${'22'.tr} ${controller.email}"),
          SizedBox(height: 15.h),
          const LogoAuth(name: AppImage.otpCode),
          OtpTextField(
            fieldWidth: 45.0.w,
            borderRadius: BorderRadius.circular(10.r),
            numberOfFields: 5,
            borderColor: AppColor.primary,
            cursorColor: AppColor.primary,
            focusedBorderColor: AppColor.primary,
            borderWidth: 3,
            //set to true to show as box or false to show as dash
            showFieldAsBox: false,
            //runs when a code is typed in
            onCodeChanged: (String code) {
              //handle validation or checks here
            },
            //runs when every textfield is filled
            onSubmit: (String verificationCode) {
              controller.goToResetPassword(verificationCode);
            }, // end onSubmit
          ),
          SizedBox(height: 35.h),
        ]),
      ),
    );
  }
}
