import 'package:ecommerce_app/core/calsses/Requests.dart';
import 'package:ecommerce_app/core/constant/AppLinkes.dart';

class OrdersAddData extends Crud {
  addOrder({
    required String userId,
    required String orderAddress,
    required String orderType,
    required String orderPayType,
    required String orderPriceDelivery,
    required String orderPrice,
    required String orderCoupon,
    required String cartItemIDs,
    required String couponId,
  }) async {
    var response = await postRequest(AppLink.checkout, {
      "order_user_id": userId,
      "order_address": orderAddress,
      "order_type": orderType,
      "order_pay_type": orderPayType,
      "order_price_delivery": orderPriceDelivery,
      "order_price": orderPrice,
      "order_coupon": orderCoupon,
      "cartItemIDs": cartItemIDs,
      "coupon_id": couponId
    });
    return response.fold((l) => l, (r) => r);
  }
}
