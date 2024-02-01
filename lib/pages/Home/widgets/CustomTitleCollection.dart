import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../../core/constant/AppColor.dart';

class CustomTitleCollection extends StatelessWidget {
  const CustomTitleCollection({
    super.key,
    required this.name,
    this.showViweMore = true,
    this.onTapViewMore,
  });
  final String name;
  final bool? showViweMore;
  final void Function()? onTapViewMore;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      width: double.infinity,
      margin: EdgeInsets.only(top: 15.spMin, left: 5.spMin),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Expanded(
            flex: 2,
            child: Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .displayLarge!
                  .copyWith(fontWeight: FontWeight.bold),
            ),
          ),
          showViweMore == true
              ? Expanded(
                  flex: 1,
                  child: Container(
                    margin: EdgeInsets.symmetric(horizontal: 5.spMin),
                    child: InkWell(
                      onTap: onTapViewMore,
                      child: Text(
                        '35'.tr,
                        textAlign: TextAlign.end,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(color: AppColor.breaker),
                      ),
                    ),
                  ),
                )
              : Container(),
        ],
      ),
    );
  }
}
