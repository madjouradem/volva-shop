import 'package:ecommerce_app/core/calsses/Favorite/FavoriteCtr.dart';
import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/pages/1component/CustomItem2.dart';
import 'package:ecommerce_app/pages/CategoryItems/CategoryItemsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CategoryItems extends GetView<CategoryItemsCtr> {
  const CategoryItems({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoryItemsCtr());
    FavoriteCtr favoriteCtr = Get.find();
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          elevation: 0,
          title: const Text('data'),
          centerTitle: true,
          backgroundColor: AppColor.primary,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.symmetric(horizontal: 5.spMin),
          child: GetBuilder<CategoryItemsCtr>(builder: (_) {
            return Column(
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      ...controller.subCategoryList.map(
                        (element) => Container(
                          margin: EdgeInsets.symmetric(horizontal: 5.spMin),
                          child: ChoiceChip(
                            label: Text(element.subcatName!),
                            padding: EdgeInsets.all(10.spMin),
                            selected: element.subcatId == controller.selectedId,
                            selectedColor: AppColor.primary,
                            onSelected: (_) {
                              controller.onSelectChoiceChip(element.subcatId!);
                            },
                          ),
                        ),
                      )
                    ],
                  ),
                ),
                Expanded(
                  child: GridView.builder(
                    // shrinkWrap: true,
                    // physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.itemsFilterList.length,
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                            crossAxisCount: 2,
                            crossAxisSpacing: 10,
                            mainAxisSpacing: 10,
                            childAspectRatio: 0.6),
                    itemBuilder: (context, index) {
                      favoriteCtr.favoriteItem[controller.itemsList[index]
                          .itemId!] = controller.itemsList[index].favorite;
                      return CustomItem2(item: controller.itemsList[index]);
                    },
                  ),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
