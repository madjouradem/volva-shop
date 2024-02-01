import 'package:ecommerce_app/core/calsses/Requests.dart';
import 'package:ecommerce_app/core/constant/AppLinkes.dart';

class FavoriteData extends Crud {
  addFavorite(String itemId, userId) async {
    var response = await postRequest(
        AppLink.addfavorite, {'item_id': itemId, 'user_id': userId});
    return response.fold((l) => l, (r) => r);
  }

  removeFavorite(String itemId, userId) async {
    var response = await postRequest(
        AppLink.removefavorite, {'item_id': itemId, 'user_id': userId});
    return response.fold((l) => l, (r) => r);
  }
}
