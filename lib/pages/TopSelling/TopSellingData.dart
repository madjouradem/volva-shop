import 'package:ecommerce_app/core/calsses/Requests.dart';
import 'package:ecommerce_app/core/constant/AppLinkes.dart';

class TopSellingData extends Crud {
  getData(String userId) async {
    var response = await postRequest(AppLink.topSelling, {'user_id': userId});
    return response.fold((l) => l, (r) => r);
  }
}
