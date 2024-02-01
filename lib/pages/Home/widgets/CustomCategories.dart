import 'package:ecommerce_app/core/constant/AppLinkes.dart';
import 'package:ecommerce_app/data/models/CategoryModel.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../../core/constant/AppColor.dart';

class CustomCategories extends StatelessWidget {
  const CustomCategories({
    super.key,
    required this.categoriesList,
    this.onTap,
  });
  final List<CategoryModel> categoriesList;
  final void Function(String)? onTap;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 100.h,
      width: double.infinity,
      margin: EdgeInsets.only(top: 5.h),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ListView.builder(
        // separatorBuilder: (context, index) {
        //   return const SizedBox(width: 10);
        // },
        scrollDirection: Axis.horizontal,
        itemCount: categoriesList.length,
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              onTap!(categoriesList[index].catId!);
            },
            child: Column(
              children: [
                Expanded(
                  flex: 7,
                  child: Container(
                    width: 75.w,
                    margin: EdgeInsets.all(5.h),
                    padding: EdgeInsets.all(10.h),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: AppColor.primary,
                    ),
                    child: Image.network(
                      '${AppLink.upload}category/${categoriesList[index].catImage}',
                      fit: BoxFit.fitHeight,
                    ),
                  ),
                ),
                Expanded(
                    flex: 3,
                    child: SizedBox(
                      width: 75.w,
                      height: 20,
                      child: Text(
                        categoriesList[index].catName!,
                        // maxLines: 1,
                        textAlign: TextAlign.center,
                        style: Theme.of(context).textTheme.displaySmall,
                      ),
                    ))
              ],
            ),
          );
        },
      ),
    );
  }
}
