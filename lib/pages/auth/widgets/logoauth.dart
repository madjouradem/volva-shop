import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class LogoAuth extends StatelessWidget {
  const LogoAuth({Key? key, required this.name}) : super(key: key);

  final String name;

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(top: 10.spMin, bottom: 20.spMin),
      height: 200.sp,
      child: Image.asset(
        name,
      ),
    );
  }
}
