import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/pages/Item/ItemController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class ItemInforamtion extends StatelessWidget {
  const ItemInforamtion({
    super.key,
    required this.controller,
  });

  final ItemCtr controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.topCenter,
      width: double.infinity,
      margin: EdgeInsets.all(5.spMin),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Container(
            margin: EdgeInsets.symmetric(vertical: 10.spMin),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Expanded(
                    flex: 4,
                    child: Text(
                      controller.itemInfo.itemName!,
                      style: Theme.of(context)
                          .textTheme
                          .displayLarge!
                          .copyWith(fontWeight: FontWeight.bold),
                    )),
              ],
            ),
          ),
          Row(
            children: [
              Expanded(
                flex: 5,
                child: Container(
                    alignment: Alignment.bottomLeft,
                    child: Row(
                      children: [
                        Text(
                          '${controller.itemInfo.itemPrice} \$',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  color: AppColor.primary,
                                  fontWeight: FontWeight.bold,
                                  decorationThickness: 2.spMin,
                                  decoration:
                                      controller.itemInfo.itemDiscount != '0'
                                          ? TextDecoration.lineThrough
                                          : null),
                        ),
                        SizedBox(
                          width: 40.spMin,
                        ),
                        controller.itemInfo.itemDiscount == '0'
                            ? Container()
                            : Text(
                                '${controller.itemInfo.itemPriceDiscount} \$',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.breaker),
                              ),
                      ],
                    )),
              ),
            ],
          ),
          Container(
            height: 1,
            width: Get.size.width,
            margin: EdgeInsets.symmetric(vertical: 15.spMin),
            color: Colors.grey,
          ),
          Column(
            // mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '36'.tr,
                style: Theme.of(context)
                    .textTheme
                    .displayLarge!
                    .copyWith(fontWeight: FontWeight.bold),
              ),
              Container(
                margin: EdgeInsets.only(bottom: 100.spMin),
                child: Text(controller.itemInfo.itemDesc!,
                    style: Theme.of(context).textTheme.displaySmall!),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
