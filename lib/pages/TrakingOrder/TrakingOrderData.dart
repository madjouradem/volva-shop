import 'package:ecommerce_app/core/calsses/Requests.dart';
import 'package:ecommerce_app/core/constant/AppLinkes.dart';

class TrakingOrderData extends Crud {
  // confirmationOrders(String orderId, orderUserId, deliveryId) async {
  //   var response = await postRequest(AppLink.t, {
  //     'order_user_id': orderUserId,
  //     'order_id': orderId,
  //     'delivery_id': deliveryId
  //   });
  //   return response.fold((l) => l, (r) => r);
  // }

  // deliveredOrder(String orderId, orderUserId) async {
  //   var response = await postRequest(AppLink.deliveredOrders,
  //       {'order_user_id': orderUserId, 'order_id': orderId});
  //   return response.fold((l) => l, (r) => r);
  // }

  delivereyInfo(String deliveryId) async {
    var response =
        await postRequest(AppLink.addaddress, {'delivery_id': deliveryId});
    return response.fold((l) => l, (r) => r);
  }
}
