import 'package:ecommerce_app/core/calsses/StatusRequest.dart';
import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:ecommerce_app/core/constant/AppRoute.dart';
import 'package:ecommerce_app/core/functions/alertWaiting.dart';
import 'package:ecommerce_app/core/functions/handlingData.dart';
import 'package:ecommerce_app/data/models/OrderModel.dart';
import 'package:ecommerce_app/pages/orders/OrdersData.dart';
import 'package:get/get.dart';

abstract class OrdersCtrAbs extends GetxController {
  getData();
  goToOrderDetails(OrderModel orderInfo);
  removeOrder(String orderId);
  ratingOrder(String orderId, String orderRating, String orderComment);
  goToTrack(OrderModel orderModel);
}

class OrdersCtr extends OrdersCtrAbs {
  StatusRequest statusRequest = StatusRequest.none;
  OrdersData data = OrdersData();
  MyServices myServices = Get.find();
  List<OrderModel> ordersList = [];

  @override
  void onInit() {
    super.onInit();
    getData();
  }

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await data.getData(myServices.box.read('user')['user_id']);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        response['data'].forEach((element) {
          ordersList.add(OrderModel.fromJson(element));
        });
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  goToOrderDetails(OrderModel orderInfo) {
    Get.toNamed(AppRoute.orderDetailsView, arguments: {'orderInfo': orderInfo});
  }

  @override
  removeOrder(String orderId) async {
    var response = await data.removeOrder(orderId);
    statusRequest = handlingData(response);
    alertWaiting();
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.back();
      }
    } else {
      Get.back();
      Get.snackbar('Remove Order', 'Failed to delete order');
    }
    update();
  }

  @override
  ratingOrder(String orderId, String orderRating, String orderComment) async {
    var response = await data.ratingOrder(orderId, orderRating, orderComment);
    statusRequest = handlingData(response);
    alertWaiting();
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        Get.back();
        Get.back();
        Get.snackbar('Rating Order', ' Rating order done Successfully !');
      }
    } else {
      Get.back();
      Get.snackbar('Rating Order', 'Failed to rating order !');
    }
    update();
  }

  @override
  goToTrack(OrderModel orderModel) {
    Get.toNamed(AppRoute.trakingOrder, arguments: {'orderModel': orderModel});
  }
}
