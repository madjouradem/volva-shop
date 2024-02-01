import 'package:ecommerce_app/core/calsses/StatusRequest.dart';
import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:ecommerce_app/core/functions/handlingData.dart';
import 'package:ecommerce_app/data/models/OrderModel.dart';
import 'package:ecommerce_app/data/models/OrdersDetailsModel.dart';
import 'package:ecommerce_app/pages/OrderDetails/OrderDetailsData.dart';
import 'package:get/get.dart';

abstract class OrderDetailsCtrAbs extends GetxController {
  getData();
}

class OrderDetailsCtr extends OrderDetailsCtrAbs {
  StatusRequest statusRequest = StatusRequest.none;
  OrderDetailsData data = OrderDetailsData();
  MyServices myServices = Get.find();
  late OrderModel orderInfo;
  List<OrdersDetailsModel> ordersDetailsList = [];

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await data.getData(orderInfo.orderId!);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        response['data'].forEach((element) {
          ordersDetailsList.add(OrdersDetailsModel.fromJson(element));
        });
        print(response['data']);
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    orderInfo = Get.arguments['orderInfo'];
    super.onInit();
    getData();
  }
}
