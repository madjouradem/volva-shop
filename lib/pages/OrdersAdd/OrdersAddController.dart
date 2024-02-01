import 'package:ecommerce_app/core/calsses/Cart/CartCtr.dart';
import 'package:ecommerce_app/core/calsses/StatusRequest.dart';
import 'package:ecommerce_app/core/calsses/StripPayCtr.dart';
import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:ecommerce_app/core/constant/AppRoute.dart';
import 'package:ecommerce_app/core/functions/handlingData.dart';
import 'package:ecommerce_app/pages/OrdersAdd/OrdersAddData.dart';
import 'package:flutter/widgets.dart';
import 'package:get/get.dart';

abstract class OrdersAddCtrAbs extends GetxController {
  goToAddress();
  checkout();
  onChooseOrderType(String type);
}

class OrdersAddCtr extends OrdersAddCtrAbs {
  StatusRequest statusRequest = StatusRequest.none;
  OrdersAddData data = OrdersAddData();
  MyServices myServices = Get.find();
  CartCtr cartCtr = Get.find();
  String selectedCartItemIDStr = '';
  @override
  goToAddress() {
    Get.toNamed(AppRoute.address);
  }

  @override
  checkout() async {
    PayCtr payCtr = Get.put(PayCtr());
    if (await payCtr.makePayment(cartCtr.totalPrice, 'eur')) {
      print('Iam out order add');

      if (myServices.box.read('selectedAddress') != null ||
          myServices.box.read('orderType') == 'recive') {
        print('Iam in order add');
        statusRequest = StatusRequest.loading;
        List selectedCartItemID = [];
        String orderAddress = myServices.box.read('selectedAddress') != null
            ? myServices.box.read('selectedAddress')['address_id']
            : '';

        update();
        myServices.box.read('selectedCart').forEach((key, value) {
          selectedCartItemID.add(value['item_id']);
          selectedCartItemIDStr = selectedCartItemID.join(',');
        });

        var response = await data.addOrder(
            userId: myServices.box.read('user')['user_id'],
            orderAddress: orderAddress,
            orderPrice:
                '${cartCtr.totalPrice.toPrecision(3) + cartCtr.shoppingPrice.toPrecision(3)}',
            couponId: cartCtr.couponInfo == null
                ? '0'
                : cartCtr.couponInfo!.couponId!,
            orderCoupon: cartCtr.couponInfo == null
                ? '0'
                : cartCtr.couponInfo!.couponId!,
            orderPayType: 'cash',
            orderPriceDelivery: '100',
            orderType: myServices.box.read('orderType'),
            cartItemIDs: selectedCartItemIDStr);
        statusRequest = handlingData(response);

        if (statusRequest == StatusRequest.success) {
          if (response['status'] == 'success') {
            print('I added order ');

            Get.offAllNamed(AppRoute.home);
            Get.snackbar(
              'Check out',
              'The order was processed successfully',
            );
          } else {
            print('fail added order ');

            statusRequest = StatusRequest.failure;
          }
        }
        update();
      } else {
        Get.showSnackbar(const GetSnackBar(
          title: 'notification',
          messageText: Text('choose address and pay methode'),
        ));
      }
    }
  }

  @override
  onChooseOrderType(String type) {
    myServices.box.write('orderType', type);
    if (type == 'recive') {
      Get.find<CartCtr>().shoppingPrice = 0.0;
    } else {
      Get.find<CartCtr>().shoppingPrice =
          double.parse(myServices.box.read('settings_shopping_price'));
    }
    Get.find<CartCtr>().update();
    update();
  }
}
