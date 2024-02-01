import 'package:cached_network_image/cached_network_image.dart';
import 'package:ecommerce_app/core/constant/AppLinkes.dart';
import 'package:ecommerce_app/core/constant/colors.dart';
import 'package:ecommerce_app/pages/MoreCategories/CategoriesController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Categories extends GetView<CategoriesCtr> {
  const Categories({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CategoriesCtr());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Categories'),
          centerTitle: true,
          elevation: 0,
          backgroundColor: AppColor.primary,
        ),
        body: Container(
          margin: EdgeInsets.all(5.spMin),
          child: ListView.builder(
            itemCount: controller.categoryList.length,
            itemBuilder: (context, index) {
              return GestureDetector(
                onTap: () {
                  controller.goToMoreItems(
                      'by Cat', controller.categoryList[index].catId!);
                },
                child: Container(
                  height: 55.h,
                  width: double.infinity,
                  margin: EdgeInsets.symmetric(vertical: 3.spMin),
                  decoration: const BoxDecoration(color: AppColor.white),
                  child: Row(
                    children: [
                      Expanded(
                        flex: 1,
                        child: Container(
                          padding: EdgeInsets.all(8.0.spMin),
                          child: CachedNetworkImage(
                            imageUrl:
                                '${AppLink.upload}category/${controller.categoryList[index].catImage}',
                            fit: BoxFit.fitHeight,
                          ),
                        ),
                      ),
                      Expanded(
                        flex: 3,
                        child: Text(controller.categoryList[index].catName!),
                      ),
                      const Expanded(
                        flex: 1,
                        child: Icon(Icons.keyboard_arrow_right_rounded),
                      ),
                    ],
                  ),
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
