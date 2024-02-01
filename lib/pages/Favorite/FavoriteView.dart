import 'package:ecommerce_app/core/calsses/Favorite/FavoriteCtr.dart';
import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/pages/1component/BnbAndDrawer/bottomNavigationBar.dart';
import 'package:ecommerce_app/pages/1component/CustomItem2.dart';
import 'package:ecommerce_app/pages/Favorite/FavoriteController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Favorite extends GetView<FavoriteViewCtr> {
  const Favorite({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(FavoriteViewCtr());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Favorite'),
          centerTitle: true,
          backgroundColor: AppColor.primary,
        ),
        body: Container(
            height: double.infinity,
            width: double.infinity,
            margin: EdgeInsets.symmetric(horizontal: 5.spMin),
            child: GetBuilder<FavoriteViewCtr>(builder: (_) {
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
                  // favoriteCtr.favoriteItem[controller.itemsList[index].itemId!] =
                  //     controller.itemsList[index].favorite;

                  return GetBuilder<FavoriteCtr>(builder: (ctr) {
                    return ctr.favoriteItem[
                                controller.itemsList[index].itemId!] ==
                            '1'
                        ? CustomItem2(
                            item: controller.itemsList[index],
                            width: 200,
                          )
                        : Container();
                  });
                },
              );
            })),
        bottomNavigationBar: const BNB(),
      ),
    );
  }
}
