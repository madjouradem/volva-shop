import 'package:ecommerce_app/core/calsses/Favorite/FavoriteCtr.dart';
import 'package:ecommerce_app/core/constant/AppRoute.dart';
import 'package:ecommerce_app/data/models/ItemModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

import '../../core/constant/AppColor.dart';

class CustomItem2 extends StatelessWidget {
  const CustomItem2({
    super.key,
    required this.item,
    this.onPressedFavorite,
    this.onTapElement,
    this.width,
  });
  final ItemModel item;
  final void Function()? onPressedFavorite;
  final void Function()? onTapElement;
  final double? width;
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Get.toNamed(AppRoute.item, arguments: {'itemInfo': item});
      },
      child: Container(
        // height: 200,
        width: width,
        margin: EdgeInsets.all(5.h),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            color: AppColor.lightbackgroundC,
            boxShadow: const [
              // BoxShadow(
              //     color: Colors.black.withOpacity(0.25),
              //     offset: const Offset(0, 5),
              //     // spreadRadius: 4,
              //     blurRadius: 5)
            ]),
        child: Column(
          children: [
            Expanded(
              flex: 1,
              child: SizedBox(
                // alignment: Alignment.topCenter,
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  // crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Container(
                      height: 35.h,
                      width: 35.w,
                      margin: EdgeInsets.all(3.h),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10),
                        color: AppColor.lightbackgroundC,
                      ),
                      child: GetBuilder<FavoriteCtr>(builder: (ctr) {
                        return IconButton(
                          onPressed: () {
                            if (ctr.favoriteItem[item.itemId] == '1') {
                              ctr.setFavorite(item.itemId!, '0');
                              ctr.removeFavorite(item.itemId!);
                            } else {
                              ctr.setFavorite(item.itemId!, '1');
                              ctr.addFavorite(item.itemId!);
                            }
                          },
                          icon: Icon(
                            ctr.favoriteItem[item.itemId] == '1'
                                ? Icons.favorite
                                : Icons.favorite_outline,
                            color: Colors.red,
                          ),
                        );
                      }),
                    ),
                    item.itemDiscount == '0'
                        ? Container()
                        : Container(
                            height: 25.h,
                            width: 45.w,
                            alignment: Alignment.center,
                            margin: EdgeInsets.all(3.h),
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                color: AppColor.breaker),
                            child: Text('- %${item.itemDiscount}',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(fontWeight: FontWeight.bold)),
                          ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 3,
              child: Container(
                padding: EdgeInsets.all(3.h),
                width: double.infinity,
                margin: EdgeInsets.all(3.h),
                decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(10),
                    image: DecorationImage(
                        fit: BoxFit.fill,
                        image: NetworkImage(
                          item.itemImage!,
                        ))),
              ),
            ),
            Expanded(
              flex: 1,
              child: Container(
                // height: 50.h,
                width: double.infinity,
                margin: EdgeInsets.all(3.h),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  // color: AppColor.secondry,
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      item.itemName!,
                      maxLines: 1,
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontWeight: FontWeight.bold),
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.start,
                      children: [
                        Text(
                          "${item.itemPrice!} \$",
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  fontWeight: FontWeight.bold,
                                  color: AppColor.primary,
                                  decorationThickness: 2.spMin,
                                  decoration: item.itemDiscount != '0'
                                      ? TextDecoration.lineThrough
                                      : null),
                        ),
                        const SizedBox(
                          width: 30,
                        ),
                        item.itemDiscount == '0'
                            ? Container()
                            : Text('${item.itemPriceDiscount} \$',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        fontWeight: FontWeight.bold,
                                        color: AppColor.breaker)),
                      ],
                    ),
                  ],
                ),
              ),
            ),
            // Expanded(
            //   flex: 1,
            //   child: Container(
            //     height: 50.h,
            //     width: double.infinity,
            //     margin: EdgeInsets.all(3.h),
            //     decoration: BoxDecoration(
            //       borderRadius: BorderRadius.circular(10),
            //     ),
            //     child: Row(
            //       mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //       children: [
            //         Row(
            //           children: [
            //             const Icon(
            //               Icons.star,
            //               color: AppColor.breaker,
            //             ),
            //             Text('4.5',
            //                 style: Theme.of(context)
            //                     .textTheme
            //                     .displayMedium!
            //                     .copyWith(color: AppColor.breaker)),
            //           ],
            //         ),
            //         Container(
            //             height: 45.h,
            //             width: 50.w,
            //             // margin: EdgeInsets.all(3.h),
            //             decoration: BoxDecoration(
            //                 borderRadius: BorderRadius.only(
            //                     topLeft: Radius.circular(10.r),
            //                     bottomRight: Radius.circular(10.r)),
            //                 color: AppColor.primary),
            //             child: const Icon(Icons.dark_mode_sharp)),
            //       ],
            //     ),
            //   ),
            // ),
          ],
        ),
      ),
    );
  }
}
