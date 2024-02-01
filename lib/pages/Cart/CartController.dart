import 'package:ecommerce_app/core/calsses/StatusRequest.dart';
import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:ecommerce_app/core/functions/handlingData.dart';
import 'package:ecommerce_app/data/models/CartModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import 'CartData.dart';

abstract class CartCtrAbs extends GetxController {
  getData();
}

class CartViewCtr extends CartCtrAbs {
  StatusRequest statusRequest = StatusRequest.none;
  CartData data = CartData();
  MyServices myServices = Get.find();
  List<CartModel> cartList = [];
  TextEditingController couponFieldCtr = TextEditingController();

  @override
  void onInit() {
    //  KeyboardVisibilityNotification().addNewListener(
    // onChange: (bool visible) {
    //   print(visible);
    //   if (visible == true) {
    //     Future.delayed(const Duration(milliseconds: 300), () {
    //       keyboardHeight = MediaQuery.of(context).viewInsets.bottom;
    //     })
    //   } else {
    //     keyboardHeight = 0.0;
    //   }
    // }
// );
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
        print(response['data']);
        response['data'].forEach((element) {
          cartList.add(CartModel.fromJson(element));
        });
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }
}
