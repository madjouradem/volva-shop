import 'package:ecommerce_app/core/calsses/StatusRequest.dart';
import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:ecommerce_app/core/functions/handlingData.dart';
import 'package:ecommerce_app/data/models/OrderModel.dart';
import 'package:ecommerce_app/pages/TrakingOrder/TrakingOrderData.dart';
import 'package:get/get.dart';

abstract class TrakingOrderCtrAbs extends GetxController {
  getDeliveryInfo(String deliveryId);
}

class TrakingOrderCtr extends TrakingOrderCtrAbs {
  StatusRequest statusRequest = StatusRequest.none;
  TrakingOrderData data = TrakingOrderData();
  MyServices myServices = Get.find();
  late OrderModel orderModel;
  // AddressCtr addressCtr = Get.find<AddressCtr>();

  @override
  void onInit() {
    orderModel = Get.arguments['orderModel'];
    super.onInit();
  }

  @override
  getDeliveryInfo(String deliveryId) async {
    var response = await data.delivereyInfo(orderModel.orderDeliveryId!);
    statusRequest = handlingData(response);

    if (StatusRequest.success == statusRequest) {
      if (response['status'] == 'success') {}
    } else {
      statusRequest = StatusRequest.failure;
    }

    update();
  }

  // @override
  // deliveredOrder() async {
  //   alertWaiting();
  //   print(myServices.box.read('delivery')['delivery_id']);
  //   var response =
  //       await data.deliveredOrder(orderModel.orderId!, orderModel.orderUserId!);
  //   statusRequest = handlingData(response);

  //   if (StatusRequest.success == statusRequest) {
  //     if (response['status'] == "success") {
  //       if (addressCtr.positionStream != null) {
  //         addressCtr.positionStream!.cancel();
  //       }
  //       Get.back();
  //       Get.back();
  //       Get.find<HomeCtr>().refreshData();
  //     } else {
  //       statusRequest = StatusRequest.failure;
  //     }
  //     print(response);

  //     update();
  //   }
  // }
}
