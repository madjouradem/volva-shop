import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:ecommerce_app/core/functions/handlingData.dart';
import 'package:ecommerce_app/data/models/ItemModel.dart';
import 'package:ecommerce_app/pages/Favorite/FavoriteData.dart';
import 'package:get/get.dart';

import '../../core/calsses/StatusRequest.dart';

abstract class FavoriteCtrAbs extends GetxController {
  getData();
}

class FavoriteViewCtr extends FavoriteCtrAbs {
  StatusRequest statusRequest = StatusRequest.none;
  FavoriteData data = FavoriteData();
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
      print(response['data']);
    }
    update();
  }
}
