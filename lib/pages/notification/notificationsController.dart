import 'package:ecommerce_app/core/calsses/StatusRequest.dart';
import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:ecommerce_app/core/functions/handlingData.dart';
import 'package:ecommerce_app/data/models/NotificationModel.dart';
import 'package:ecommerce_app/pages/notification/notificationsData.dart';
import 'package:get/get.dart';

abstract class NotificationsCtrAbs extends GetxController {
  getData();
}

class NotificationsCtr extends NotificationsCtrAbs {
  StatusRequest statusRequest = StatusRequest.none;
  NotificationsData data = NotificationsData();
  MyServices myServices = Get.find();
  List<NotificationModel> notificationsList = [];

  @override
  getData() async {
    statusRequest = StatusRequest.loading;
    update();
    var response = await data.getData(myServices.box.read('user')['user_id']);
    statusRequest = handlingData(response);
    if (statusRequest == StatusRequest.success) {
      if (response['status'] == 'success') {
        response['data'].forEach((element) {
          notificationsList.add(NotificationModel.fromJson(element));
        });
      }
    } else {
      statusRequest = StatusRequest.failure;
    }
    update();
  }

  @override
  void onInit() {
    super.onInit();
    getData();
  }
}
