import 'package:ecommerce_app/core/calsses/Requests.dart';
import 'package:ecommerce_app/core/constant/AppLinkes.dart';

class OrdersData extends Crud {
  getData(String userId) async {
    var response = await postRequest(AppLink.orders, {"user_id": userId});
    return response.fold((l) => l, (r) => r);
  }

  removeOrder(String orderId) async {
    var response =
        await postRequest(AppLink.removeOrder, {"order_id": orderId});
    return response.fold((l) => l, (r) => r);
  }

  ratingOrder(String orderId, rating, comment) async {
    var response = await postRequest(AppLink.ratingOrder, {
      "order_id": orderId,
      "order_rating": rating,
      "order_comment": comment
    });
    return response.fold((l) => l, (r) => r);
  }
}
