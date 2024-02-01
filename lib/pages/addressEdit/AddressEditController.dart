import 'package:ecommerce_app/core/calsses/StatusRequest.dart';
import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:ecommerce_app/core/functions/handlingData.dart';
import 'package:ecommerce_app/data/models/AddressModel.dart';
import 'package:ecommerce_app/pages/address/AddressController.dart';
import 'package:ecommerce_app/pages/addressEdit/AddressEditData.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class AddressEditViewCtrAbs extends GetxController {
  editAddress();
  refreshData();
}

class AddressEditViewCtr extends AddressEditViewCtrAbs {
  StatusRequest statusRequest = StatusRequest.none;
  AddressEditData data = AddressEditData();
  MyServices myServices = Get.find();
  late AddressModel addInfo;

  GlobalKey<FormState> formstate = GlobalKey<FormState>();

  TextEditingController city = TextEditingController();
  TextEditingController street = TextEditingController();
  FocusNode field1FocusNode = FocusNode();
  FocusNode field2FocusNode = FocusNode();

  @override
  void onInit() {
    addInfo = Get.arguments['addInfo'];
    city.text = addInfo.addressCity!;
    street.text = addInfo.addressStrees!;
    super.onInit();
  }

  @override
  editAddress() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await data.editAddress(
      addressId: addInfo.addressId,
      city: city.text,
      street: street.text,
      lat: addInfo.toString(),
      lng: addInfo.toString(),
    );
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.back();
        refreshData();
        Get.snackbar('edit address', 'success');
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
