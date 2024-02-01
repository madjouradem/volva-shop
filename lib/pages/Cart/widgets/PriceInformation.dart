import 'package:ecommerce_app/core/calsses/Cart/CartCtr.dart';
import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class PriceInformation extends StatelessWidget {
  const PriceInformation({
    super.key,
    required this.cartCtr,
    this.onCheckOut,
  });

  final CartCtr cartCtr;
  final void Function()? onCheckOut;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartCtr>(builder: (_) {
      return Container(
        alignment: Alignment.bottomCenter,
        // width: Get.width / 2,
        // color: Colors.amber,
        padding: const EdgeInsets.all(8),
        margin: const EdgeInsets.all(8),
        decoration: BoxDecoration(
          boxShadow: const [
            BoxShadow(
                blurRadius: 2,
                offset: Offset(1, 3),
                color: Colors.black45,
                blurStyle: BlurStyle.outer),
          ],
          borderRadius: BorderRadius.circular(10),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Price :',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                GetBuilder<CartCtr>(builder: (_) {
                  return Text(
                    '${cartCtr.price.toPrecision(3)}\$',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.bold, color: AppColor.primary),
                  );
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'discount :',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                GetBuilder<CartCtr>(
                    id: 'filed',
                    builder: (_) {
                      return Text(
                        '-${cartCtr.couponInfo == null ? 0 : cartCtr.couponInfo!.couponDicount!} %',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColor.primary),
                      );
                    }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'shopping :',
                  style: Theme.of(context)
                      .textTheme
                      .displayMedium!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                GetBuilder<CartCtr>(builder: (_) {
                  return Text(
                    '${cartCtr.shoppingPrice.toPrecision(3)}\$',
                    style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.bold, color: AppColor.primary),
                  );
                }),
              ],
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Text(
                  'Totoal Price :',
                  style: Theme.of(context)
                      .textTheme
                      .displayLarge!
                      .copyWith(fontWeight: FontWeight.bold),
                ),
                GetBuilder<CartCtr>(
                    id: 'filed',
                    builder: (_) {
                      return Text(
                        '${cartCtr.totalPrice.toPrecision(3) + cartCtr.shoppingPrice.toPrecision(3)}\$',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(
                                fontWeight: FontWeight.bold,
                                color: AppColor.primary),
                      );
                    }),
              ],
            ),
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.only(top: 10.r),
              child: MaterialButton(
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.h)),
                padding: EdgeInsets.symmetric(vertical: 13.r),
                onPressed: onCheckOut,
                color: AppColor.primary,
                textColor: Colors.white,
                child: Text(
                  'Check out ',
                  style: Theme.of(context).textTheme.displayMedium!.copyWith(
                        fontWeight: FontWeight.bold,
                      ),
                ),
              ),
            ),
          ],
        ),
      );
    });
  }
}
