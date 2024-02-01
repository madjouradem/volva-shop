import 'package:ecommerce_app/core/calsses/StatusRequest.dart';
import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:ecommerce_app/core/constant/AppRoute.dart';
import 'package:ecommerce_app/data/models/CategoryModel.dart';
import 'package:ecommerce_app/pages/MoreCategories/CategoriesData.dart';
import 'package:get/get.dart';

abstract class CategoriesCtrAbs extends GetxController {
  goToMoreItems(String itemsType, String subCatId);
}

class CategoriesCtr extends CategoriesCtrAbs {
  StatusRequest statusRequest = StatusRequest.none;
  CategoriesData data = CategoriesData();
  MyServices myServices = Get.find();
  late List<CategoryModel> categoryList;

  @override
  void onInit() {
    super.onInit();
    categoryList = Get.arguments['categoriesList'];
  }

  @override
  goToMoreItems(String itemsType, String subCatId) {
    Get.toNamed(AppRoute.moreItems,
        arguments: {'itemsType': itemsType, 'subCatId': subCatId});
  }
}
