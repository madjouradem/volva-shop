import 'package:ecommerce_app/core/calsses/Requests.dart';
import 'package:ecommerce_app/core/constant/AppLinkes.dart';

class OrderDetailsData extends Crud {
  getData(String orderId) async {
    var response =
        await postRequest(AppLink.ordersDetails, {"order_id": orderId});
    return response.fold((l) => l, (r) => r);
  }
}
