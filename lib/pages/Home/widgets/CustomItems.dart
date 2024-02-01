import 'package:ecommerce_app/core/calsses/Favorite/FavoriteCtr.dart';
import 'package:ecommerce_app/data/models/ItemModel.dart';
import 'package:ecommerce_app/pages/1component/CustomItem2.dart';
import 'package:ecommerce_app/pages/Home/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CustomItems extends GetView<HomeCtr> {
  const CustomItems({
    super.key,
    required this.itemList,
    required this.onTapItem,
  });

  final List<ItemModel> itemList;
  final void Function(ItemModel) onTapItem;

  @override
  Widget build(BuildContext context) {
    FavoriteCtr favoriteCtr = Get.find();

    return Container(
      height: 300.spMin,
      width: double.infinity,
      margin: EdgeInsets.only(top: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10.r),
      ),
      child: ListView.builder(
        // separatorBuilder: (context, index) {
        //   return const SizedBox(width: 10);
        // },
        scrollDirection: Axis.horizontal,
        itemCount: itemList.length,
        itemBuilder: (context, index) {
          favoriteCtr.favoriteItem[itemList[index].itemId!] =
              itemList[index].favorite;
          return CustomItem2(
              item: itemList[index],
              width: 200.spMin,
              onTapElement: () {
                controller.goToItem(itemList[index]);
              });
        },
      ),
    );
  }
}
