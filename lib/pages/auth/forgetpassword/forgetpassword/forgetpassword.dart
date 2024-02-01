import 'package:ecommerce_app/core/constant/AppImage.dart';
import 'package:ecommerce_app/pages/auth/forgetpassword/forgetpassword/forgetpassword_controller.dart';
import 'package:ecommerce_app/pages/auth/widgets/customtexttitleauth.dart';
import 'package:ecommerce_app/pages/auth/widgets/logoauth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../../../core/functions/validinput.dart';
import '../../widgets/CustomButtomAuth.dart';
import '../../widgets/customtextbodyauth.dart';
import '../../widgets/CustomTextFormFieldAuth.dart';

class ForgetPassword extends StatelessWidget {
  const ForgetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    Get.put(ForgetPasswordControllerImp());
    return Scaffold(
      body: GetBuilder<ForgetPasswordControllerImp>(
          builder: (controller) => Container(
                padding: EdgeInsets.symmetric(
                    vertical: 5.spMin, horizontal: 5.spMin),
                child: Form(
                  key: controller.formstate,
                  child: ListView(
                    children: [
                      SizedBox(height: 20.h),
                      CustomTextTitleAuth(text: "17".tr),
                      SizedBox(height: 10.h),
                      CustomTextBodyAuth(text: "18".tr),
                      SizedBox(height: 15.h),
                      const LogoAuth(name: AppImage.forgotFassword),
                      CustomTextFormAuth(
                        isNumber: false,
                        valid: (val) {
                          return validInput(val!, 5, 40, "email");
                        },
                        onFieldSubmitted: (_) {
                          controller.checkemail();
                        },

                        keyboardType: TextInputType.emailAddress,
                        mycontroller: controller.email,
                        hinttext: "19".tr,
                        iconData: Icons.email_outlined,
                        labeltext: "19".tr,
                        // mycontroller: ,
                      ),
                      CustomButtomAuth(
                          text: "20".tr,
                          onPressed: () {
                            controller.checkemail();
                          }),
                      SizedBox(height: 35.h),
                    ],
                  ),
                ),
              )),
    );
  }
}
