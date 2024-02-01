import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextBodyAuth extends StatelessWidget {
  final String text;
  const CustomTextBodyAuth({Key? key, required this.text}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.only(bottom: 20.spMin),
      child: Text(
        text,
        textAlign: TextAlign.center,
        style: Theme.of(context).textTheme.displayMedium,
      ),
    );
  }
}
