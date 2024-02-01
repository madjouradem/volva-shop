import 'package:ecommerce_app/core/calsses/Requests.dart';
import 'package:ecommerce_app/core/constant/AppLinkes.dart';

class CategoryItemsData extends Crud {
  getData(String catId, userId) async {
    var response = await postRequest(AppLink.getCategoryItemandSubCategories,
        {'cat_id': catId, 'user_id': userId});
    return response.fold((l) => l, (r) => r);
  }
}
