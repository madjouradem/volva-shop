import 'package:ecommerce_app/core/calsses/Cart/CartCtr.dart';
import 'package:ecommerce_app/core/calsses/HandlingDataView.dart';
import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/core/constant/AppRoute.dart';
import 'package:ecommerce_app/pages/1component/BnbAndDrawer/bottomNavigationBar.dart';
import 'package:ecommerce_app/pages/Cart/CartController.dart';
import 'package:ecommerce_app/pages/Cart/widgets/PriceInformation.dart';
import 'package:ecommerce_app/pages/Cart/widgets/customCarts.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Cart extends GetView<CartViewCtr> {
  const Cart({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(CartViewCtr());
    CartCtr cartCtr = Get.put(CartCtr());

    return SafeArea(
      child: Scaffold(
        resizeToAvoidBottomInset: false,
        appBar: AppBar(
          title: const Text('My Cart'),
          centerTitle: true,
          backgroundColor: AppColor.primary,
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          padding: const EdgeInsets.only(bottom: 2),
          margin: EdgeInsets.only(top: 8.spMin, left: 8.spMin, right: 8.spMin),
          child: GetBuilder<CartViewCtr>(
            builder: (_) {
              return HandlingDataView(
                statusRequest: controller.statusRequest,
                child: Stack(children: [
                  Positioned(
                      top: 0,
                      left: 0,
                      right: 0,
                      child: CustomCarts(
                          controller: controller, cartCtr: cartCtr)),
                  GetBuilder<CartCtr>(builder: (_) {
                    return cartCtr.price != 0.0
                        ? Positioned(
                            bottom: 0,
                            left: 0,
                            right: 0,
                            child: PriceInformation(
                                cartCtr: cartCtr,
                                onCheckOut: () {
                                  Get.toNamed(AppRoute.addOrder);
                                }),
                          )
                        : Container();
                  })
                ]),
              );
            },
          ),
        ),
        bottomNavigationBar: const BNB(),
      ),
    );
  }
}
