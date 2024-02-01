import 'package:ecommerce_app/core/calsses/Requests.dart';
import 'package:ecommerce_app/core/constant/AppLinkes.dart';

class AddressEditData extends Crud {
  editAddress({addressId, city, street, lat, lng}) async {
    var response = await postRequest(AppLink.editaddress, {
      'address_id': addressId,
      'city': city,
      'street': street,
      'lat': lat,
      'lng': lng
    });
    return response.fold((l) => l, (r) => r);
  }
}
