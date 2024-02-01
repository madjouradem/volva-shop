import 'package:ecommerce_app/core/calsses/Cart/CartCtr.dart';
import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/pages/Cart/widgets/PriceInformation.dart';
import 'package:ecommerce_app/pages/OrdersAdd/OrdersAddController.dart';
import 'package:ecommerce_app/pages/OrdersAdd/widgets/SelectAddressWidget.dart';
import 'package:ecommerce_app/pages/OrdersAdd/widgets/SelectPayWidget.dart';
import 'package:ecommerce_app/pages/OrdersAdd/widgets/coupon.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddOrders extends GetView<OrdersAddCtr> {
  const AddOrders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersAddCtr());
    CartCtr cartCtr = Get.put(CartCtr());

    return SafeArea(
        child: Scaffold(
      appBar: AppBar(
        title: const Text('Add Orders'),
      ),
      body: GetBuilder<CartCtr>(
          id: 'padding',
          builder: (_) {
            return Container(
              height: double.infinity,
              width: double.infinity,
              margin: EdgeInsets.all(10.spMin),
              padding: EdgeInsets.only(bottom: cartCtr.fieldPosition),
              child: SingleChildScrollView(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceAround,
                  children: [
                    GetBuilder<OrdersAddCtr>(builder: (_) {
                      return Container(
                        margin: const EdgeInsets.only(bottom: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            GestureDetector(
                              onTap: () {
                                controller.onChooseOrderType('delivery');
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 80.spMin,
                                width: 80.spMin,
                                decoration: BoxDecoration(
                                  color: controller.myServices.box
                                              .read('orderType') !=
                                          'delivery'
                                      ? Colors.transparent
                                      : AppColor.primary,
                                  borderRadius: BorderRadius.circular(10.spMin),
                                  border: Border.all(
                                      color: AppColor.primary, width: 2),
                                ),
                                child: Text(
                                  'Delivery',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                            SizedBox(
                              width: 40.spMin,
                            ),
                            GestureDetector(
                              onTap: () {
                                controller.onChooseOrderType('recive');
                              },
                              child: Container(
                                alignment: Alignment.center,
                                height: 80.spMin,
                                width: 80.spMin,
                                decoration: BoxDecoration(
                                  color: controller.myServices.box
                                              .read('orderType') !=
                                          'recive'
                                      ? Colors.transparent
                                      : AppColor.primary,
                                  borderRadius: BorderRadius.circular(10.spMin),
                                  border: Border.all(
                                      color: AppColor.primary, width: 2),
                                ),
                                child: Text(
                                  'Recive',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                          ],
                        ),
                      );
                    }),
                    GetBuilder<OrdersAddCtr>(builder: (_) {
                      return controller.myServices.box.read('orderType') !=
                              'delivery'
                          ? Container()
                          : SelectAddressWidget(controller: controller);
                    }),
                    GetBuilder<OrdersAddCtr>(builder: (_) {
                      return controller.myServices.box.read('orderType') !=
                              'delivery'
                          ? Container()
                          : SelectPayWidget(controller: controller);
                    }),
                    SizedBox(
                      height: 200.spMin,
                    ),
                    Coupon(cartCtr: cartCtr),
                    GetBuilder<CartCtr>(builder: (_) {
                      return cartCtr.price != 0.0
                          ? PriceInformation(
                              cartCtr: cartCtr,
                              onCheckOut: () async {
                                await controller.checkout();
                              })
                          : Container();
                    }),
                  ],
                ),
              ),
            );
          }),
    ));
  }
}
