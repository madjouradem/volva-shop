import 'package:ecommerce_app/pages/auth/success_signup/successsignup_controller.dart';
import 'package:ecommerce_app/pages/auth/widgets/CustomButtomAuth.dart';
import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SuccessSignUp extends StatelessWidget {
  const SuccessSignUp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    SuccessSignUpControllerImp controller =
        Get.put(SuccessSignUpControllerImp());
    return Scaffold(
      body: Container(
        padding: EdgeInsets.all(5.spMin),
        child: ListView(children: [
          const Center(
              child: Icon(
            Icons.check_circle_outline_rounded,
            size: 200,
            color: AppColor.primary,
          )),
          Center(
            child: Text("27".tr,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontSize: 30)),
          ),
          Center(child: Text("30".tr)),
          SizedBox(
            height: 300.h,
          ),
          SizedBox(
            width: double.infinity,
            child: CustomButtomAuth(
                text: "29".tr,
                onPressed: () {
                  controller.goToPageLogin();
                }),
          ),
          const SizedBox(height: 30)
        ]),
      ),
    );
  }
}
