import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:ecommerce_app/core/constant/AppRoute.dart';
import 'package:flutter/cupertino.dart';
import 'package:get/get.dart';

class MyMiddlewere extends GetMiddleware {
  MyServices myServices = Get.find();
  @override
  // TODO: implement priority
  int? get priority => 1;

  @override
  RouteSettings? redirect(String? route) {
    // ignore: todo
    // TODO: implement redirect
    print('${myServices.box.read('step')}  jjjjjjjjjjjjj');

    if (myServices.box.read('step') == '2') {
      return const RouteSettings(name: AppRoute.home);
    }
    if (myServices.box.read('step') == '1') {
      return const RouteSettings(name: '/');
    }
    return null;
  }
}
