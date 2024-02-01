import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/core/functions/validinput.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class CustomSearchBar extends StatelessWidget {
  const CustomSearchBar({
    super.key,
    this.onPressed,
    this.onTapField,
    this.onChanged,
    this.controller,
    this.hint,
    this.icon,
  });
  final void Function()? onPressed;
  final void Function()? onTapField;
  final void Function(String)? onChanged;
  final TextEditingController? controller;
  final String? hint;
  final IconData? icon;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: double.infinity,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Expanded(
            flex: 6,
            child: SizedBox(
              height: 60.h,
              child: TextFormField(
                controller: controller,
                validator: (value) {
                  return validInput(value!, 1, 200, '');
                },
                onChanged: onChanged,
                cursorColor: AppColor.primary,
                decoration: InputDecoration(
                    filled: true,
                    fillColor: AppColor.white,
                    hintText: hint,
                    hintStyle: Theme.of(context).textTheme.displayMedium,
                    border: OutlineInputBorder(
                        borderSide:
                            const BorderSide(width: 5, color: Colors.black),
                        borderRadius: BorderRadius.circular(20.r)),
                    focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: const BorderSide(
                            color: AppColor.primary, width: 3)),
                    enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(20.r),
                        borderSide: const BorderSide(
                            color: AppColor.primary, width: 3)),
                    suffixIcon: Container(
                        margin: EdgeInsets.all(10.spMin),
                        padding: EdgeInsets.symmetric(horizontal: 5.spMin),
                        decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(10.spMin)),
                        child: IconButton(
                            onPressed: onPressed,
                            icon: const Icon(
                              Icons.search_outlined,
                              color: Colors.black,
                            ))),
                    suffixIconColor: AppColor.primary,
                    contentPadding: EdgeInsets.only(
                        top: 10.spMin,
                        left: 30.spMin,
                        right: 10.spMin,
                        bottom: 10.spMin)),
              ),
            ),
          ),
          // Expanded(
          //   flex: 1,
          //   child: Container(
          //     height: 48.spMin,
          //     alignment: Alignment.center,
          //     margin: EdgeInsets.only(top: 6.spMin),
          //     decoration: BoxDecoration(
          //         color: AppColor.white,
          //         borderRadius: BorderRadius.circular(10)),
          //     child: GestureDetector(
          //         onTap: () {
          //           Get.toNamed(AppRoute.notifications);
          //         },
          //         child: SvgPicture.asset(
          //           AppImage.notification,
          //           height: 30.spMin,
          //           color: AppColor.black,
          //         )),
          //   ),
          // ),
        ],
      ),
    );
  }
}
