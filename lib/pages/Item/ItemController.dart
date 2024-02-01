import 'package:ecommerce_app/core/calsses/StatusRequest.dart';
import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:ecommerce_app/data/models/ItemModel.dart';
import 'package:ecommerce_app/pages/Item/ItemData.dart';
import 'package:get/get.dart';

abstract class ItemCtrAbs extends GetxController {}

class ItemCtr extends ItemCtrAbs {
  StatusRequest statusRequest = StatusRequest.none;
  ItemData data = ItemData();
  MyServices myServices = Get.find();
  late ItemModel itemInfo;

  @override
  void onInit() {
    // TODO: implement onInit
    super.onInit();
    itemInfo = Get.arguments['itemInfo'];
  }
}
