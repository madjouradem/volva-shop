import 'package:ecommerce_app/core/calsses/StatusRequest.dart';
import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:ecommerce_app/core/functions/handlingData.dart';
import 'package:ecommerce_app/data/models/ItemModel.dart';
import 'package:ecommerce_app/data/models/SubCategoryModel.dart';
import 'package:ecommerce_app/pages/CategoryItems/CategoryItemsData.dart';
import 'package:get/get.dart';

abstract class CategoryItemsCtrAbs extends GetxController {
  getData();
  onSelectChoiceChip(String subId);
}

class CategoryItemsCtr extends CategoryItemsCtrAbs {
  StatusRequest statusRequest = StatusRequest.none;
  CategoryItemsData data = CategoryItemsData();
  MyServices myServices = Get.find();
  late String catId;
  List<SubCategoryModel> subCategoryList = [
    SubCategoryModel(subcatId: '0', subcatName: 'All', subcatNameAr: 'الكل'),
  ];
  List<ItemModel> itemsList = [];
  var itemsFilterList = [];

  String selectedId = '0';

  @override
  void onInit() {
    catId = Get.arguments['catId'];
    super.onInit();
    getData();
    itemsFilterList = itemsList;
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await data.getData(catId, myServices.box.read('user')['user_id']);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        if (response['data']['subCategories'] != 0) {
          response['data']['subCategories'].forEach((element) {
            subCategoryList.add(SubCategoryModel.fromJson(element));
          });
        }
        if (response['data']['items'] != 0) {
          response['data']['items'].forEach((element) {
            itemsList.add(ItemModel.fromJson(element));
          });
        }
        print(itemsList);
      }
    }
    update();
  }

  @override
  onSelectChoiceChip(String subId) {
    selectedId = subId;
    if (subId != '0') {
      //which mean 'all'
      itemsFilterList = filter(subId);
    } else {
      itemsFilterList = itemsList;
    }
    update();
  }

  List<ItemModel> filter(String subId) {
    return itemsList.where((element) => element.itemSubcatId == subId).toList();
  }
}
