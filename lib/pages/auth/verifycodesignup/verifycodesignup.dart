import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/pages/auth/verifycodesignup/verfiycodesignup_controller.dart';
import 'package:ecommerce_app/pages/auth/widgets/customtextbodyauth.dart';
import 'package:ecommerce_app/pages/auth/widgets/customtexttitleauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_otp_text_field/flutter_otp_text_field.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class VerfiyCodeSignUp extends StatelessWidget {
  const VerfiyCodeSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    VerifyCodeSignUpControllerImp ctr =
        Get.put(VerifyCodeSignUpControllerImp());
    return Scaffold(
      body: GetBuilder<VerifyCodeSignUpControllerImp>(
          builder: (controller) => Container(
                padding: EdgeInsets.symmetric(
                    vertical: 5.spMin, horizontal: 5.spMin),
                child: ListView(children: [
                  SizedBox(height: 20.h),
                  const CustomTextTitleAuth(text: "Check code"),
                  SizedBox(height: 10.h),
                  CustomTextBodyAuth(
                      text: "Please Enter The Digit Code Sent To ${ctr.email}"),
                  SizedBox(height: 15.h),
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
                      controller.goToSuccessSignUp(verificationCode);
                    }, // end onSubmit
                  ),
                  SizedBox(height: 35.h),
                ]),
              )),
    );
  }
}
