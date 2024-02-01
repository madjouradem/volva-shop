import 'package:ecommerce_app/pages/auth/forgetpassword/success_resetpassword/successresetpassword_controller.dart';
import 'package:ecommerce_app/pages/auth/widgets/CustomButtomAuth.dart';
import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SuccessResetPassword extends StatelessWidget {
  const SuccessResetPassword({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessResetPasswordControllerImp controller =
        Get.put(SuccessResetPasswordControllerImp());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(5.spMin),
        child: Column(children: [
          SizedBox(height: 100.h),
          Center(
              child: Icon(
            Icons.check_circle_outline_rounded,
            size: 200.h,
            color: AppColor.primary,
          )),
          Text("27".tr, style: Theme.of(context).textTheme.headlineMedium!),
          Text(
            "28".tr,
            style: Theme.of(context).textTheme.displayMedium!,
          ),
          const Spacer(),
          Container(
            margin: EdgeInsets.only(bottom: 50.spMin),
            width: double.infinity,
            child: CustomButtomAuth(
                text: "29".tr,
                onPressed: () {
                  controller.goToPageLogin();
                }),
          ),
        ]),
      ),
    );
  }
}
