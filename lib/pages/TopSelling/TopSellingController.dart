import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:ecommerce_app/core/functions/handlingData.dart';
import 'package:ecommerce_app/data/models/ItemModel.dart';
import 'package:ecommerce_app/pages/TopSelling/TopSellingData.dart';
import 'package:get/get.dart';

import '../../core/calsses/StatusRequest.dart';

abstract class TopSellingCtrAbs extends GetxController {
  getData();
}

class TopSellingCtr extends TopSellingCtrAbs {
  StatusRequest statusRequest = StatusRequest.none;
  TopSellingData data = TopSellingData();
  MyServices myServices = Get.find();
  List<ItemModel> itemsList = [];

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await data.getData(myServices.box.read('user')['user_id']);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        response['data'].forEach((element) {
          itemsList.add(ItemModel.fromJson(element));
        });
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }
}
