import 'package:ecommerce_app/core/calsses/Requests.dart';

import '../../../../../../core/constant/AppLinkes.dart';

class CheckEmailData extends Crud {
  postdata(String email) async {
    var response = await postRequest(AppLink.checkEmail, {"email": email});
    return response.fold((l) => l, (r) => r);
  }
}
