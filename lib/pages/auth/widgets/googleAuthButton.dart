import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/core/constant/AppImage.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class googleAuthButton extends StatelessWidget {
  const googleAuthButton({super.key, required this.onTap});
  final Function()? onTap;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.only(top: 10.r, left: 30.spMin, right: 30.spMin),
        padding: EdgeInsets.symmetric(vertical: 10.spMin),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(10.r),
          border: Border.all(color: AppColor.primary),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            Text(
              'Continue with google',
              style: Theme.of(context).textTheme.displayMedium,
            ),
            const Image(
              image: AssetImage(AppImage.google),
              height: 30,
            )
          ],
        ),
      ),
    );
  }
}
