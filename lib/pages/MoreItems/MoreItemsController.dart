import 'package:ecommerce_app/core/calsses/StatusRequest.dart';
import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:ecommerce_app/core/functions/handlingData.dart';
import 'package:ecommerce_app/data/models/ItemModel.dart';
import 'package:ecommerce_app/pages/MoreItems/MoreItemsData.dart';
import 'package:get/get.dart';

abstract class MoreItemsCtrAbs extends GetxController {
  getData();
}

class MoreItemsCtr extends MoreItemsCtrAbs {
  StatusRequest statusRequest = StatusRequest.none;
  MoreItemsData data = MoreItemsData();
  MyServices myServices = Get.find();
  List<ItemModel> itemsList = [];
  String itemsType = 'all';
  String? subCatId;

  @override
  void onInit() {
    super.onInit();
    itemsType = Get.arguments['itemsType'];
    if (itemsType == 'by Cat') {
      subCatId = Get.arguments['subCatId'];
    }
    getData();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await data.getData(
        itemsType, myServices.box.read('user')['user_id'], subCatId);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        response['data'].forEach((element) {
          itemsList.add(ItemModel.fromJson(element));
        });
      }
      print(response['data']);
    }
    update();
  }
}
