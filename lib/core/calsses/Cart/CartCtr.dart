import 'package:ecommerce_app/core/calsses/Cart/CartData.dart';
import 'package:ecommerce_app/core/calsses/StatusRequest.dart';
import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:ecommerce_app/core/functions/handlingData.dart';
import 'package:ecommerce_app/data/models/CouponModel.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

abstract class CartCtrImp extends GetxController {
  selectCart(String cartId, double cartPrice, String itemID);
  inSelectCart(String cartId, double cartPrice);
  setCart(String itemId, val);
  addCart(String itemId, String itemPrice);
  removeCart(String itemId);
  incrementCartCount(String cardId, String itemId, String itemPrice);
  decrementCartCount(String cardId, itemPrice);
  applayCoupon(String couponName);
  cancelCoupon();
  setCartCountCustom(
      String count, String cardId, String itemId, String itemPrice);
  editCartCount(String count, String price, String cartId);
}

class CartCtr extends CartCtrImp {
  Map cartItem = {};
  StatusRequest statusRequestadd = StatusRequest.none;
  StatusRequest statusRequestremove = StatusRequest.none;
  StatusRequest statusRequestApllayCoupon = StatusRequest.none;
  CartData data = CartData();
  MyServices myServices = Get.find();
  Map selectedCart = {};
  double price = 0.0;
  double shoppingPrice = 100.0;
  double totalPrice = 0.0;
  double? totalPriceBeforeDiscount;
  TextEditingController couponFieldCtr = TextEditingController();
  FocusNode focusNode = FocusNode();
  GlobalKey<FormState> couponFieldKey = GlobalKey<FormState>();
  double fieldPosition = 0;
  CouponModel? couponInfo;
  TextEditingController countFiled = TextEditingController();
  FocusNode focusNodeFiled = FocusNode();
  int? customCartCount;

  @override
  selectCart(String cartId, double cartPrice, String itemID) {
    //make the cart selected
    selectedCart[cartId] = {'price': cartPrice, 'item_id': itemID};
    //save it in cache
    myServices.box.write('selectedCart', selectedCart);
    price += cartPrice;
    totalPrice += cartPrice;
    print('/////////////////////////////////');
    print(myServices.box.read('selectedCart'));
    print('/////////////////////////////////');
    update();
    update(['filed']);
  }

  @override
  inSelectCart(String cartId, double cartPrice) {
    //make the cart Inselected
    selectedCart.remove(cartId);
    //save it in cache

    myServices.box.write('selectedCart', selectedCart);
    price -= cartPrice;
    totalPrice -= cartPrice;
    update();
  }

  @override
  setCart(String itemId, val) {
    cartItem[itemId] = val;
    update();
  }

  @override
  addCart(String itemId, String itemPrice) async {
    statusRequestadd = StatusRequest.loading;
    update();
    var response = await data.addCart(
      itemId,
      myServices.box.read('user')['user_id'],
      itemPrice,
    );
    statusRequestadd = handlingData(response);
    if (statusRequestadd == StatusRequest.success) {
      Get.rawSnackbar(title: 'add', message: 'success');
    } else {
      Get.rawSnackbar(title: 'add', message: 'failure');
    }
  }

  @override
  removeCart(String itemId) async {
    statusRequestremove = StatusRequest.loading;
    update();
    var response =
        await data.removeCart(itemId, myServices.box.read('user')['user_id']);
    statusRequestremove = handlingData(response);
    if (statusRequestremove == StatusRequest.success) {
      setCart(itemId, '0');
      // Get.rawSnackbar(title: 'remove', message: 'success');
    } else {
      // Get.rawSnackbar(title: 'remove', message: 'failure');
    }
  }

  @override
  incrementCartCount(String cardId, String itemId, String itemPrice) async {
    statusRequestremove = StatusRequest.loading;
    update();
    print(itemPrice);
    var response = await data.incrementCountCart(cardId, itemId, itemPrice);
    statusRequestremove = handlingData(response);
    if (statusRequestremove == StatusRequest.success) {
      //change cart price

      if (response['status'] == 'success') {
        update(['cartCount']);
        return true;
      }
      // Get.rawSnackbar(title: 'increment', message: 'success');
    } else {
      // Get.rawSnackbar(title: 'increment', message: 'failure');
      return false;
    }
    return false;
  }

  @override
  decrementCartCount(String cardId, itemPrice) async {
    statusRequestremove = StatusRequest.loading;
    update();
    var response = await data.decrementCountCart(cardId, itemPrice);
    statusRequestremove = handlingData(response);
    if (statusRequestremove == StatusRequest.success) {
      // Get.rawSnackbar(title: 'decrement', message: 'success');
      if (response['status'] == 'success') {
        update(['cartCount']);
        return true;
      }
    } else {
      // Get.rawSnackbar(title: 'decrement', message: 'failure');
      return false;
    }
    return false;
  }

  @override
  applayCoupon(String couponName) async {
    if (couponFieldKey.currentState!.validate()) {
      statusRequestApllayCoupon = StatusRequest.loading;
      update(['filed']);
      var response = await data.getCoupon(couponName);

      statusRequestApllayCoupon = handlingData(response);
      if (statusRequestApllayCoupon == StatusRequest.success) {
        if (response['status'] == 'success') {
          couponInfo = CouponModel.fromJson(response['data']);
          totalPriceBeforeDiscount = totalPrice;
          totalPrice = totalPrice -
              (totalPrice * int.parse(couponInfo!.couponDicount!) / 100);
          Get.rawSnackbar(title: 'Applay', message: 'success');
        } else {
          statusRequestApllayCoupon = StatusRequest.failure;
          Get.rawSnackbar(title: 'Applay', message: 'failure');
        }
      }
      update(['filed']);
    }
  }

  @override
  cancelCoupon() {
    couponInfo = null;
    couponFieldCtr.clear();
    totalPrice = totalPriceBeforeDiscount!;
    update(['filed']);
  }

  void listener() {
    if (focusNode.hasFocus) {
      print('open key _________________');
      fieldPosition = 300;
      update(['padding']);
      print('open key _________${fieldPosition}________');
    } else {
      print('close key _________________');
      fieldPosition = 0;
      update(['padding']);
      print('close key _________${fieldPosition}________');
    }
  }

  @override
  setCartCountCustom(
      String count, String cardId, String itemId, String itemPrice) async {
    statusRequestremove = StatusRequest.loading;
    update();
    var response =
        await data.setCountCartCustom(cardId, itemId, itemPrice, count);
    statusRequestremove = handlingData(response);
    print(statusRequestremove);
    if (statusRequestremove == StatusRequest.success) {
      //change cart price

      if (response['status'] == 'success') {
        countFiled.text = response['data'];
        customCartCount = int.parse(response['data']);
        update(['cartCount']);
        return true;
      }
      // Get.rawSnackbar(title: 'increment', message: 'success');
    } else {
      // Get.rawSnackbar(title: 'increment', message: 'failure');
      return false;
    }
    return false;
  }

  @override
  editCartCount(String count, String price, String cartId) async {
    // statusRequestremove = StatusRequest.loading;
    // update();
    var response = await data.editCartCount(count, price, cartId);
    statusRequestremove = handlingData(response);
    print(statusRequestremove);
    if (statusRequestremove == StatusRequest.success) {
      if (response['status'] == 'success') {
        update(['cartCount']);
        return true;
      }
      Get.rawSnackbar(title: 'edit', message: 'success');
    } else {
      // Get.rawSnackbar(title: 'increment', message: 'failure');
      return false;
    }
    return false;
  }

  @override
  void onInit() {
    shoppingPrice =
        double.parse(myServices.box.read('settings_shopping_price'));
    focusNode.addListener(listener);
    super.onInit();
  }
}
