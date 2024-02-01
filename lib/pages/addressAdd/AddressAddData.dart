import 'package:ecommerce_app/core/calsses/Requests.dart';
import 'package:ecommerce_app/core/constant/AppLinkes.dart';

class AddressAddData extends Crud {
  addAddress({userId, city, street, lat, lng}) async {
    var response = await postRequest(AppLink.addaddress, {
      'user_id': userId,
      'city': city,
      'street': street,
      'lat': lat,
      'lng': lng
    });
    return response.fold((l) => l, (r) => r);
  }
}
