import 'package:ecommerce_app/core/calsses/Cart/CartCtr.dart';
import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/pages/Item/ItemController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddCartButton extends StatelessWidget {
  const AddCartButton({
    super.key,
    required this.controller,
  });

  final ItemCtr controller;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 62.h,
      width: double.infinity,
      alignment: Alignment.center,
      margin: const EdgeInsets.symmetric(horizontal: 30),
      decoration: BoxDecoration(
          color: AppColor.primary, borderRadius: BorderRadius.circular(10)),
      child: Row(
        children: [
          GetBuilder<CartCtr>(builder: (cartCtr) {
            return Expanded(
              flex: 2,
              child: GestureDetector(
                onTap: () {
                  var priceWithDiscount =
                      double.parse(controller.itemInfo.itemPrice!) -
                          (double.parse(controller.itemInfo.itemDiscount!) *
                              double.parse(controller.itemInfo.itemPrice!) /
                              100);
                  cartCtr.addCart(controller.itemInfo.itemId!,
                      priceWithDiscount.toString());
                },
                child: Row(
                  children: [
                    const Expanded(
                        flex: 1,
                        child: Icon(
                          Icons.safety_check,
                          color: AppColor.white,
                        )),
                    Expanded(
                      flex: 2,
                      child: Text(
                        '37'.tr,
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(color: AppColor.white),
                      ),
                    ),
                  ],
                ),
              ),
            );
          }),
          Container(
            height: 50,
            width: 1,
            margin: EdgeInsets.symmetric(horizontal: 15.spMin),
            color: Colors.grey,
          ),
          Expanded(
            flex: 1,
            child: Text(
              ' ${controller.itemInfo.itemPriceDiscount} \$',
              style: Theme.of(context).textTheme.displayLarge!.copyWith(
                    color: AppColor.white,
                    fontWeight: FontWeight.bold,
                  ),
            ),
          )
        ],
      ),
    );
  }
}
