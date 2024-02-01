import 'package:ecommerce_app/core/calsses/Favorite/FavoriteData.dart';
import 'package:ecommerce_app/core/calsses/StatusRequest.dart';
import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:ecommerce_app/core/functions/handlingData.dart';
import 'package:get/get.dart';

class FavoriteCtr extends GetxController {
  Map favoriteItem = {};
  StatusRequest statusRequestadd = StatusRequest.none;
  StatusRequest statusRequestremove = StatusRequest.none;
  FavoriteData data = FavoriteData();
  MyServices myServices = Get.find();

  setFavorite(String itemId, val) {
    favoriteItem[itemId] = val;
    update();
  }

  addFavorite(String itemId) async {
    statusRequestadd = StatusRequest.loading;
    update();
    var response = await data.addFavorite(
      itemId,
      myServices.box.read('user')['user_id'],
    );
    statusRequestadd = handlingData(response);
    if (statusRequestadd == StatusRequest.success) {
      Get.rawSnackbar(title: 'add', message: 'success');
    } else {
      Get.rawSnackbar(title: 'add', message: 'failure');
    }
  }

  removeFavorite(String itemId) async {
    statusRequestremove = StatusRequest.loading;
    update();
    var response = await data.removeFavorite(
        itemId, myServices.box.read('user')['user_id']);
    statusRequestremove = handlingData(response);
    if (statusRequestremove == StatusRequest.success) {
      Get.rawSnackbar(title: 'remove', message: 'success');
    } else {
      Get.rawSnackbar(title: 'remove', message: 'failure');
    }
  }
}
