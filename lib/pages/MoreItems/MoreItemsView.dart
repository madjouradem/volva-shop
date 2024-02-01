import 'package:ecommerce_app/core/calsses/Favorite/FavoriteCtr.dart';
import 'package:ecommerce_app/pages/1component/CustomItem2.dart';
import 'package:ecommerce_app/pages/moreItems/moreItemsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MoreItems extends GetView<MoreItemsCtr> {
  const MoreItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MoreItemsCtr());
    FavoriteCtr favoriteCtr = Get.find<FavoriteCtr>();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          // title: const Text('More item'),
          // centerTitle: true,
          // backgroundColor: AppColor.primary,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 5.spMin),
          child: GetBuilder<MoreItemsCtr>(builder: (_) {
            return GridView.builder(
              // shrinkWrap: true,
              // physics: const NeverScrollableScrollPhysics(),
              itemCount: controller.itemsList.length,
              gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 2,
                  crossAxisSpacing: 10,
                  mainAxisSpacing: 10,
                  childAspectRatio: 0.6),
              itemBuilder: (context, index) {
                favoriteCtr.favoriteItem[controller.itemsList[index].itemId!] =
                    controller.itemsList[index].favorite;

                return CustomItem2(
                  item: controller.itemsList[index],
                  width: 200.spMin,
                  onTapElement: () {
                    // controller.g
                  },
                );
              },
            );
          }),
        ),
      ),
    );
  }
}
