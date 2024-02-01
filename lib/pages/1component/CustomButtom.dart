import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/AppColor.dart';

class CustomButtom extends StatelessWidget {
  final String text;
  final Color? color;
  final void Function()? onPressed;
  const CustomButtom({Key? key, required this.text, this.color, this.onPressed})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onPressed,
      child: Container(
        margin: EdgeInsets.only(top: 4.r),
        padding: EdgeInsets.all(6.spMin),
        decoration: BoxDecoration(
            color: color ?? AppColor.primary,
            borderRadius: BorderRadius.circular(10.spMin)),
        child: Text(text,
            style: TextStyle(fontWeight: FontWeight.bold, fontSize: 16.spMin)),
      ),
    );
  }
}
