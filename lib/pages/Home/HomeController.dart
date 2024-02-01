import 'package:ecommerce_app/core/calsses/StatusRequest.dart';
import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:ecommerce_app/core/constant/AppRoute.dart';
import 'package:ecommerce_app/core/functions/handlingData.dart';
import 'package:ecommerce_app/data/models/CategoryModel.dart';
import 'package:ecommerce_app/data/models/ItemModel.dart';
import 'package:ecommerce_app/data/models/SettingsModel.dart';
import 'package:ecommerce_app/pages/Home/HomeData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:permission_handler/permission_handler.dart';

abstract class HomeCtrAbs extends GetxController {
  getData();
  goToItem(ItemModel itemInfo);
  goToCategories();
  goToCategoryItem(String catId);
  goToMoreItems(String itemsType);
  goToOffers();
  goToTopSelling();
  search(String itemName);
  onWriteInField();
  onTapSearch();
}

class HomeCtr extends HomeCtrAbs {
  StatusRequest statusRequest = StatusRequest.none;
  TextEditingController searchController = TextEditingController();
  GlobalKey<FormState> formState = GlobalKey();
  HomeData homeData = HomeData();
  MyServices myServices = Get.find();
  List<ItemModel> itemList = [];
  List<ItemModel> searchItemList = [];
  List<ItemModel> offersList = [];
  List<ItemModel> topSellingList = [];
  List<CategoryModel> categoryList = [];
  List<SettingsModel> settingsList = [];
  bool isSearch = false;

  @override
  void onInit() {
    getPemetion();
    getData();
    super.onInit();
  }

  getPemetion() async {
    var status = await Permission.storage.status;
    if (!status.isGranted) {
      await Permission.storage.request();
    }
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await homeData.getData(myServices.box.read('user')['user_id']);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        if (response['data']['items'] != 0) {
          response['data']['items'].forEach((element) {
            itemList.add(ItemModel.fromJson(element));
          });
        }
        if (response['data']['offers'] != 0) {
          response['data']['offers'].forEach((element) {
            offersList.add(ItemModel.fromJson(element));
          });
        }
        if (response['data']['topSelling'] != 0) {
          response['data']['topSelling'].forEach((element) {
            topSellingList.add(ItemModel.fromJson(element));
          });
        }
        if (response['data']['categories'] != 0) {
          response['data']['categories'].forEach((element) {
            categoryList.add(CategoryModel.fromJson(element));
          });
        }
        if (response['data']['settings'] != 0) {
          response['data']['settings'].forEach((element) {
            settingsList.add(SettingsModel.fromJson(element));
          });
          myServices.box.write('settings_shopping_price',
              response['data']['settings'][0]['settings_shopping_price']);
        }

        // print(categoryList);
        // print(itemList);
      }
    }
    update();
  }

  @override
  goToItem(ItemModel itemInfo) {
    Get.toNamed(AppRoute.item, arguments: {'itemInfo': itemInfo});
  }

  @override
  goToCategories() {
    Get.toNamed(AppRoute.categories,
        arguments: {'categoriesList': categoryList});
  }

  @override
  goToCategoryItem(String catId) {
    Get.toNamed(AppRoute.categoryItems, arguments: {"catId": catId});
  }

  @override
  goToMoreItems(String itemsType) {
    Get.toNamed(AppRoute.moreItems, arguments: {'itemsType': itemsType});
  }

  @override
  goToOffers() {
    Get.toNamed(AppRoute.offers);
  }

  @override
  goToTopSelling() {
    Get.toNamed(AppRoute.topSelling);
  }

  @override
  search(String itemName) async {
    statusRequest = StatusRequest.loading;
    update();
    var response =
        await homeData.search(myServices.box.read('user')['user_id'], itemName);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        if (response['data'] != 0) {
          response['data'].forEach((element) {
            searchItemList.add(ItemModel.fromJson(element));
          });
        }
      }
    }
    update();
  }

  @override
  onWriteInField() {
    if (searchController.text.isEmpty) {
      isSearch = false;
      searchItemList.clear();
      update();
    }
  }

  @override
  onTapSearch() {
    if (formState.currentState!.validate()) {
      isSearch = true;
      search(searchController.text);
      update();
    }
  }
}
