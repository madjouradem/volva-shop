import 'package:ecommerce_app/core/calsses/Requests.dart';
import 'package:ecommerce_app/core/constant/AppLinkes.dart';

class CartData extends Crud {
  getData(String userId) async {
    var response = await postRequest(AppLink.cart, {'user_id': userId});
    return response.fold((l) => l, (r) => r);
  }
}
