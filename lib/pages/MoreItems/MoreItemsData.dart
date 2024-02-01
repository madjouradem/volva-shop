import 'package:ecommerce_app/core/calsses/Requests.dart';
import 'package:ecommerce_app/core/constant/AppLinkes.dart';

class MoreItemsData extends Crud {
  getData(itemsType, userId, [subCatId]) async {
    Map data = {'items_type': itemsType, 'user_id': userId};
    if (itemsType == 'by Cat') {
      data = {'items_type': itemsType, 'user_id': userId, 'cat_id': subCatId};
    }
    var response = await postRequest(AppLink.moreItem, data);
    return response.fold((l) => l, (r) => r);
  }
}
