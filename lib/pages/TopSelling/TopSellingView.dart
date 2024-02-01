import 'package:ecommerce_app/core/calsses/Favorite/FavoriteCtr.dart';
import 'package:ecommerce_app/core/calsses/HandlingDataView.dart';
import 'package:ecommerce_app/pages/1component/CustomItem2.dart';
import 'package:ecommerce_app/pages/TopSelling/TopSellingController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class TopSellingView extends GetView<TopSellingCtr> {
  const TopSellingView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(TopSellingCtr());
    FavoriteCtr favoriteCtr = Get.find();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('TopSelling'),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.all(10.spMin),
          child: GetBuilder<TopSellingCtr>(
            builder: (_) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                child: GridView.builder(
                  // shrinkWrap: true,
                  // physics: const NeverScrollableScrollPhysics(),
                  itemCount: controller.itemsList.length,
                  gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                      childAspectRatio: 0.6),
                  itemBuilder: (context, index) {
                    favoriteCtr
                            .favoriteItem[controller.itemsList[index].itemId!] =
                        controller.itemsList[index].favorite;

                    return CustomItem2(
                      item: controller.itemsList[index],
                      width: 200.spMin,
                      onTapElement: () {
                        // controller.goToItem(itemInfo);
                      },
                    );
                  },
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
