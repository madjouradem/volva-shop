import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/pages/Item/ItemController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ImagePart extends StatelessWidget {
  const ImagePart({
    super.key,
    required this.controller,
  });
  final ItemCtr controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      color: AppColor.lightbackgroundC,
      width: double.infinity,
      height: Get.size.height / 2,
      child: Stack(
        children: [
          Container(
            width: double.infinity,
            alignment: Alignment.center,
            child: Row(
              children: [
                Expanded(
                  child: InteractiveViewer(
                    maxScale: 3,
                    child: Image.network(
                      controller.itemInfo.itemImage!,
                      fit: BoxFit.contain,
                    ),
                  ),
                ),
              ],
            ),
          ),
          Positioned(
              top: 10,
              left: 10,
              right: 10,
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                    icon: const Icon(Icons.arrow_back),
                    onPressed: () {
                      Get.back();
                      print('object');
                    },
                  ),
                  controller.itemInfo.itemDiscount == '0'
                      ? Container()
                      : Container(
                          height: 25.h,
                          width: 45.w,
                          alignment: Alignment.center,
                          margin: EdgeInsets.all(3.h),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(10),
                              color: AppColor.breaker),
                          child: Text('- %${controller.itemInfo.itemDiscount}',
                              style: Theme.of(context)
                                  .textTheme
                                  .displayMedium!
                                  .copyWith(fontWeight: FontWeight.bold)),
                        ),
                ],
              )),
        ],
      ),
    );
  }
}
