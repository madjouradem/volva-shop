import 'package:ecommerce_app/core/calsses/HandlingDataView.dart';
import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/pages/OrderDetails/OrderDetailsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class OrderDetailsView extends GetView<OrderDetailsCtr> {
  const OrderDetailsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrderDetailsCtr());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Order Details'),
        ),
        body: Container(
          height: double.infinity,
          width: double.infinity,
          margin: EdgeInsets.all(10.spMin),
          child: GetBuilder<OrderDetailsCtr>(builder: (_) {
            return HandlingDataView(
              statusRequest: controller.statusRequest,
              child: ListView(
                children: [
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Order Number :   ',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  color: AppColor.primary,
                                  fontWeight: FontWeight.bold),
                        ),
                        Text(
                          'N° ${controller.orderInfo.orderId}',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    alignment: Alignment.center,
                    width: double.infinity,
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Text(
                          'Order Status : ',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  color: AppColor.primary,
                                  fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${controller.orderInfo.orderStatus}',
                          style: Theme.of(context)
                              .textTheme
                              .displayLarge!
                              .copyWith(
                                  color: AppColor.breaker,
                                  fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order Time :   ',
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  color: AppColor.primary,
                                  fontWeight: FontWeight.bold),
                        ),
                        Text(
                          Jiffy.parse(controller.orderInfo.orderDate!)
                              .yMMMMEEEEd,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(top: 10.0),
                    child: Row(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Order Type :   ',
                          textAlign: TextAlign.left,
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(
                                  color: AppColor.primary,
                                  fontWeight: FontWeight.bold),
                        ),
                        Text(
                          '${controller.orderInfo.orderType}',
                          style: Theme.of(context)
                              .textTheme
                              .displayMedium!
                              .copyWith(fontWeight: FontWeight.bold),
                        ),
                      ],
                    ),
                  ),
                  controller.orderInfo.orderType == 'recive'
                      ? Container()
                      : Padding(
                          padding: const EdgeInsets.only(top: 10.0),
                          child: Row(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                'Shipping Price :   ',
                                textAlign: TextAlign.left,
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(
                                        color: AppColor.primary,
                                        fontWeight: FontWeight.bold),
                              ),
                              Text(
                                '100 \$',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        flex: 2,
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Proudect',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    color: AppColor.breaker,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Count',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    color: AppColor.breaker,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                      Expanded(
                        child: Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Text(
                            'Price',
                            textAlign: TextAlign.center,
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                    color: AppColor.breaker,
                                    fontWeight: FontWeight.bold),
                          ),
                        ),
                      ),
                    ],
                  ),
                  ListView.builder(
                    shrinkWrap: true,
                    physics: const NeverScrollableScrollPhysics(),
                    itemCount: controller.ordersDetailsList.length,
                    itemBuilder: (context, index) {
                      return Padding(
                        padding: const EdgeInsets.all(8.0),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Expanded(
                              flex: 2,
                              child: Text(
                                  '${controller.ordersDetailsList[index].itemName}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium),
                            ),
                            Expanded(
                              child: Text(
                                  '${controller.ordersDetailsList[index].cartCount}',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium),
                            ),
                            Expanded(
                              child: Text(
                                  '${controller.ordersDetailsList[index].cartPrice} \$',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium),
                            ),
                          ],
                        ),
                      );
                    },
                  ),
                  controller.ordersDetailsList.isEmpty
                      ? Container()
                      : controller.ordersDetailsList[0].couponDicount == null
                          ? Container()
                          : Padding(
                              padding: const EdgeInsets.only(top: 20.0),
                              child: Center(
                                child: Text(
                                  'Discount : ${controller.ordersDetailsList[0].couponDicount} %',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(
                                          color: AppColor.primary,
                                          fontWeight: FontWeight.bold),
                                ),
                              ),
                            ),
                  Padding(
                    padding: const EdgeInsets.all(20.0),
                    child: Container(
                      alignment: Alignment.center,
                      width: double.infinity,
                      child: Text(
                        'Totel Price : ${controller.orderInfo.orderPrice} \$',
                        textAlign: TextAlign.center,
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(
                                color: AppColor.primary,
                                fontWeight: FontWeight.bold),
                      ),
                    ),
                  ),
                  controller.orderInfo.orderType == 'recive'
                      ? Container()
                      : controller.ordersDetailsList.isEmpty
                          ? Container()
                          : controller.ordersDetailsList[0].addressCity == null
                              ? Container()
                              : Padding(
                                  padding: const EdgeInsets.only(top: 10.0),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Shpping Address : ',
                                        textAlign: TextAlign.left,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                                color: AppColor.primary,
                                                fontWeight: FontWeight.bold),
                                      ),
                                      Text(
                                          '${controller.ordersDetailsList[0].addressCity} ${controller.ordersDetailsList[0].addressStrees}',
                                          style: Theme.of(context)
                                              .textTheme
                                              .displayMedium),
                                    ],
                                  ),
                                ),
                ],
              ),
            );
          }),
        ),
      ),
    );
  }
}
