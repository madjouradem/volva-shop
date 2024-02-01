import 'package:ecommerce_app/core/calsses/Favorite/FavoriteCtr.dart';
import 'package:ecommerce_app/core/calsses/HandlingDataView.dart';
import 'package:ecommerce_app/core/calsses/StripPayCtr.dart';
import 'package:ecommerce_app/pages/1component/BnbAndDrawer/bottomNavigationBar.dart';
import 'package:ecommerce_app/pages/1component/CustomItem2.dart';
import 'package:ecommerce_app/pages/Home/HomeController.dart';
import 'package:ecommerce_app/pages/Home/widgets/CustomCategories.dart';
import 'package:ecommerce_app/pages/Home/widgets/CustomItems.dart';
import 'package:ecommerce_app/pages/Home/widgets/CustomSearchBar.dart';
import 'package:ecommerce_app/pages/Home/widgets/CustomTitleCollection.dart';
import 'package:ecommerce_app/pages/Home/widgets/DiscoutWidget.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Home extends GetView<HomeCtr> {
  const Home({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(HomeCtr());
    Get.put(FavoriteCtr(), permanent: true);

    return SafeArea(
      child: WillPopScope(
        onWillPop: () {
          print('///////////////////');
          Get.defaultDialog(
            title: 'Warning',
            middleText: 'Do you want to exite the app ?',
            onCancel: () {
              Get.back();
            },
            onConfirm: () {
              // exit(0);
            },
          );
          return Future.value(false);
        },
        child: Scaffold(
          appBar: AppBar(
            flexibleSpace: Container(
              margin: EdgeInsets.only(
                  top: 10.spMin, right: 10.spMin, left: 10.spMin),
              child: Form(
                key: controller.formState,
                child: CustomSearchBar(
                  hint: '31'.tr,
                  icon: Icons.search,
                  controller: controller.searchController,
                  onPressed: () {
                    PayCtr payCtr = Get.put(PayCtr());
                    payCtr.makePayment(100, 'usd');
                    // controller.onTapSearch();
                  },
                  onChanged: (_) {
                    controller.onWriteInField();
                  },
                ),
              ),
            ),
            toolbarHeight: 70,
            backgroundColor: Theme.of(context).primaryColor,
          ),
          body: Container(
            height: double.infinity,
            width: double.infinity,
            margin: EdgeInsets.all(5.spMin),
            child: Container(
              height: double.infinity,
              margin: EdgeInsets.only(top: 10.h),
              child: GetBuilder<HomeCtr>(builder: (_) {
                return HandlingDataView(
                  statusRequest: controller.statusRequest,
                  child: controller.isSearch
                      ? GridView.builder(
                          // shrinkWrap: true,
                          // physics: const NeverScrollableScrollPhysics(),
                          itemCount: controller.searchItemList.length,
                          gridDelegate:
                              const SliverGridDelegateWithFixedCrossAxisCount(
                                  crossAxisCount: 2,
                                  crossAxisSpacing: 10,
                                  mainAxisSpacing: 10,
                                  childAspectRatio: 0.6),
                          itemBuilder: (context, index) {
                            // favoriteCtr.favoriteItem[controller.itemsList[index].itemId!] =
                            //     controller.itemsList[index].favorite;

                            return CustomItem2(
                              item: controller.searchItemList[index],
                              width: 200.spMin,
                              onTapElement: () {
                                // controller.g
                              },
                            );
                          },
                        )
                      : ListView(
                          children: [
                            const DiscoutWidget(),
                            CustomTitleCollection(
                              name: '32'.tr,
                              onTapViewMore: () {
                                controller.goToCategories();
                              },
                            ),
                            CustomCategories(
                              categoriesList: controller.categoryList,
                              onTap: (catId) {
                                controller.goToCategoryItem(catId);
                              },
                            ),
                            CustomTitleCollection(
                              name: '38'.tr,
                              onTapViewMore: () {
                                controller.goToTopSelling();
                              },
                            ),
                            CustomItems(
                              itemList: controller.topSellingList,
                              onTapItem: (itemInfo) {
                                controller.goToItem(itemInfo);
                              },
                            ),
                            CustomTitleCollection(
                              name: '33'.tr,
                              onTapViewMore: () {
                                controller.goToMoreItems('for you');
                              },
                            ),
                            CustomItems(
                              itemList: controller.itemList,
                              onTapItem: (itemInfo) {
                                controller.goToItem(itemInfo);
                              },
                            ),
                            CustomTitleCollection(
                              name: '34'.tr,
                              onTapViewMore: () {
                                controller.goToOffers();
                              },
                            ),
                            CustomItems(
                              itemList: controller.offersList,
                              onTapItem: (itemInfo) {
                                controller.goToItem(itemInfo);
                              },
                            ),
                          ],
                        ),
                );
              }),
            ),
          ),
          bottomNavigationBar: const BNB(),
        ),
      ),
    );
  }
}
