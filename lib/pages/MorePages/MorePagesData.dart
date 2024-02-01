import 'package:ecommerce_app/core/calsses/Requests.dart';

class MorePagesData extends Crud {
  getData() async {
    var response = await postRequest('AppLinks.test', {});
    return response.fold((l) => l, (r) => r);
  }
}
