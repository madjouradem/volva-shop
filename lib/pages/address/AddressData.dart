import 'package:ecommerce_app/core/calsses/Requests.dart';
import 'package:ecommerce_app/core/constant/AppLinkes.dart';

class AddressData extends Crud {
  getData(userId) async {
    var response = await postRequest(AppLink.address, {'user_id': userId});
    return response.fold((l) => l, (r) => r);
  }

  removeAddress(addressId) async {
    var response = await postRequest(AppLink.removeaddress, {
      'address_id': addressId,
    });
    return response.fold((l) => l, (r) => r);
  }
}
