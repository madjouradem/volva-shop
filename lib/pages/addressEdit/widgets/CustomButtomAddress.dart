import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../../core/constant/AppColor.dart';

class CustomButtomAddress extends StatelessWidget {
  final String text;
  final void Function()? onPressed;
  const CustomButtomAddress({Key? key, required this.text, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.r),
      child: MaterialButton(
        shape:
            RoundedRectangleBorder(borderRadius: BorderRadius.circular(10.h)),
        padding: EdgeInsets.symmetric(vertical: 13.r),
        onPressed: onPressed,
        color: AppColor.primary,
        textColor: Colors.white,
        child: Text(text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.spMin)),
      ),
    );
  }
}
