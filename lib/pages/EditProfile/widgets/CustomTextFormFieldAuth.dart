import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomTextFormAuth extends StatelessWidget {
  final String hinttext;
  final String labeltext;
  final IconData iconData;
  final TextEditingController? mycontroller;
  final String? Function(String?) valid;
  final bool? isNumber;
  final bool? obscureText;
  final void Function()? onTapIcon;
  final void Function(String)? onFieldSubmitted;
  final TextInputAction? textInputAction;
  final FocusNode? focusNode;
  final TextInputType? keyboardType;

  const CustomTextFormAuth(
      {Key? key,
      this.obscureText,
      this.onTapIcon,
      required this.hinttext,
      required this.labeltext,
      required this.iconData,
      required this.mycontroller,
      required this.valid,
      this.isNumber,
      this.onFieldSubmitted,
      this.textInputAction,
      this.focusNode,
      this.keyboardType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: EdgeInsets.only(bottom: 20.r),
      child: TextFormField(
        keyboardType: keyboardType,
        validator: valid,
        focusNode: focusNode,
        cursorColor: AppColor.primary,
        controller: mycontroller,
        onFieldSubmitted: onFieldSubmitted,
        textInputAction: textInputAction,
        obscureText: obscureText == null || obscureText == false ? false : true,
        decoration: InputDecoration(
            hintText: hinttext,
            hintStyle: Theme.of(context).textTheme.displaySmall,
            floatingLabelBehavior: FloatingLabelBehavior.always,
            contentPadding:
                EdgeInsets.symmetric(vertical: 13.h, horizontal: 15.w),
            label: Container(
                margin: EdgeInsets.symmetric(horizontal: 5.w),
                child: Text(
                  labeltext,
                  style: Theme.of(context).textTheme.displayLarge,
                )),
            suffixIcon: InkWell(onTap: onTapIcon, child: Icon(iconData)),
            focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(10.r),
                borderSide: const BorderSide(color: AppColor.primary)),
            focusColor: AppColor.primary,
            fillColor: AppColor.primary,
            hoverColor: AppColor.primary,
            // filled: true,
            suffixIconColor: AppColor.primary,

            // disabledBorder: ,
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(10.r),
            )),
      ),
    );
  }
}
