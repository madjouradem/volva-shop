import 'package:ecommerce_app/core/calsses/StatusRequest.dart';
import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:ecommerce_app/core/constant/AppRoute.dart';
import 'package:ecommerce_app/core/functions/handlingData.dart';
import 'package:ecommerce_app/data/models/AddressModel.dart';
import 'package:ecommerce_app/pages/OrdersAdd/OrdersAddController.dart';
import 'package:ecommerce_app/pages/address/AddressData.dart';
import 'package:get/get.dart';

abstract class AddressViewCtrAbs extends GetxController {
  getData();
  onSelectAddress(AddressModel address);
  removeAddress(int index, String addId);
  goToEditAddress(AddressModel addInfo);
}

//
class AddressViewCtr extends AddressViewCtrAbs {
  StatusRequest statusRequest = StatusRequest.none;
  AddressData data = AddressData();
  MyServices myServices = Get.find();
  List<AddressModel> addressList = [];

  @override
  void onInit() {
    getData();
    super.onInit();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await data.getData(myServices.box.read('user')['user_id']);
    statusRequest = handlingData(response);
    print(statusRequest);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        response['data'].forEach((element) {
          addressList.add(AddressModel.fromJson(element));
        });
        print(addressList.length);
      } else {
        statusRequest = StatusRequest.failure;
      }
    }
    update();
  }

  @override
  onSelectAddress(AddressModel address) {
    Map addressInfo = {
      'address_id': address.addressId,
      'address_user_id': address.addressUserId,
      'address_city': address.addressCity,
      'address_strees': address.addressStrees,
      'address_lat': address.addressLat,
      'address_lng': address.addressLng,
    };
    myServices.box.write('selectedAddress', addressInfo);
    Get.put(OrdersAddCtr()).update(['address in order']);
    update();
  }

  @override
  removeAddress(int index, String addId) async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await data.removeAddress(addId);
    statusRequest = handlingData(response);
    print(statusRequest);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        addressList.removeAt(index);
        if (addId == myServices.box.read('selectedAddress')) {
          myServices.box.remove('selectedAddress');
        }
      }
    }
    update();
  }

  @override
  goToEditAddress(AddressModel addInfo) {
    Get.toNamed(AppRoute.editAddress, arguments: {'addInfo': addInfo});
  }
}
