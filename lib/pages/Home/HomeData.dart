import 'package:ecommerce_app/core/calsses/Requests.dart';
import 'package:ecommerce_app/core/constant/AppLinkes.dart';

class HomeData extends Crud {
  getData(String userId) async {
    var response = await postRequest(AppLink.getHomeData, {'user_id': userId});
    return response.fold((l) => l, (r) => r);
  }

  search(String userId, itemName) async {
    var response = await postRequest(
        AppLink.searchWithName, {'user_id': userId, 'item_name': itemName});
    return response.fold((l) => l, (r) => r);
  }
}
