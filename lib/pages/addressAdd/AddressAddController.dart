import 'package:ecommerce_app/core/calsses/StatusRequest.dart';
import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:ecommerce_app/core/functions/handlingData.dart';
import 'package:ecommerce_app/pages/address/AddressController.dart';
import 'package:ecommerce_app/pages/addressAdd/AddressAddData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddressAddViewCtrAbs extends GetxController {
  addAddress();
  refreshData();
}

class AddressAddViewCtr extends AddressAddViewCtrAbs {
  StatusRequest statusRequest = StatusRequest.none;
  AddressAddData data = AddressAddData();
  MyServices myServices = Get.find();
  Map placeInfo = {};

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();
  FocusNode field1FocusNode = FocusNode();
  FocusNode field2FocusNode = FocusNode();

  @override
  void onInit() {
    placeInfo = Get.arguments['placeInfo'];
    city.text = placeInfo['city'];
    street.text = placeInfo['street'];
    super.onInit();
  }

  @override
  addAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await data.addAddress(
      userId: myServices.box.read('user')['user_id'],
      city: placeInfo['city'],
      street: placeInfo['street'],
      lat: placeInfo['lat'].toString(),
      lng: placeInfo['lng'].toString(),
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.back();
        Get.back();
        refreshData();
        Get.snackbar('add address', 'success');
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  refreshData() {
    AddressViewCtr addressViewCtr = Get.find<AddressViewCtr>();
    addressViewCtr.addressList.clear();
    addressViewCtr.getData();
  }
}
