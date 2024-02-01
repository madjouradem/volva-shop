import 'package:ecommerce_app/core/calsses/HandlingDataView.dart';
import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/pages/1component/CustomButtom.dart';
import 'package:ecommerce_app/pages/orders/OrdersController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class ActiveOrders extends StatelessWidget {
  const ActiveOrders({
    super.key,
    required this.controller,
  });

  final OrdersCtr controller;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<OrdersCtr>(builder: (_) {
      return HandlingDataView(
        statusRequest: controller.statusRequest,
        child: Container(
          margin: EdgeInsets.all(10.spMin),
          height: double.infinity,
          width: double.infinity,
          child: ListView.builder(
            itemCount: controller.ordersList.length,
            itemBuilder: (context, index) {
              return controller.ordersList[index].orderStatus == "Delivered"
                  ? Container()
                  : Container(
                      padding: EdgeInsets.all(10.spMin),
                      margin: EdgeInsets.all(10.spMin),
                      width: double.infinity,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(10.spMin),
                        border: Border.all(color: AppColor.primary),
                      ),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 8.0.spMin,
                            ),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Order Number : N° ${controller.ordersList[index].orderId}',
                                  textAlign: TextAlign.center,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayLarge!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                SizedBox(
                                  width: (Get.width / 4 + 10).spMin,
                                  child: Text(
                                    Jiffy.parse(
                                            '${controller.ordersList[index].orderDate}')
                                        .fromNow(),
                                    textAlign: TextAlign.center,
                                    style: Theme.of(context)
                                        .textTheme
                                        .displayMedium!
                                        .copyWith(
                                            color: AppColor.primary,
                                            fontWeight: FontWeight.bold),
                                  ),
                                )
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(bottom: 8.0.spMin),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              // crossAxisAlignment: CrossAxisAlignment.center,
                              children: [
                                Expanded(
                                  child: Text.rich(
                                    TextSpan(children: [
                                      TextSpan(
                                        text: 'Order Status: ',
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                      TextSpan(
                                        text: controller
                                            .ordersList[index].orderStatus,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium!
                                            .copyWith(
                                              color: controller
                                                          .ordersList[index]
                                                          .orderStatus ==
                                                      'Pending'
                                                  ? AppColor.breaker
                                                  : AppColor.primary,
                                            ),
                                      )
                                    ]),
                                  ),
                                ),
                              ],
                            ),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 8.0.spMin,
                            ),
                            child: Text(
                                'Order Type: ${controller.ordersList[index].orderType} ',
                                style:
                                    Theme.of(context).textTheme.displayMedium),
                          ),
                          Padding(
                            padding: EdgeInsets.only(
                              bottom: 8.0.spMin,
                            ),
                            child: Text(
                                'Order Price: ${controller.ordersList[index].orderPrice} \$',
                                style:
                                    Theme.of(context).textTheme.displayMedium),
                          ),
                          controller.ordersList[index].orderType != 'delivery'
                              ? Container()
                              : Padding(
                                  padding: EdgeInsets.only(
                                    bottom: 8.0.spMin,
                                  ),
                                  child: Text('Shopping price: 100 \$',
                                      style: Theme.of(context)
                                          .textTheme
                                          .displayMedium),
                                ),
                          Row(
                            mainAxisAlignment: MainAxisAlignment.end,
                            children: [
                              controller.ordersList[index].orderStatus !=
                                      'Pending'
                                  ? controller.ordersList[index].orderStatus ==
                                          'Out for Delivery'
                                      ? CustomButtom(
                                          text: 'track',
                                          color: AppColor.primary,
                                          onPressed: () {
                                            controller.goToTrack(
                                                controller.ordersList[index]);
                                          },
                                        )
                                      : const SizedBox.shrink()
                                  : CustomButtom(
                                      text: 'cancel',
                                      color: AppColor.primary,
                                      onPressed: () {
                                        controller.removeOrder(controller
                                            .ordersList[index].orderId!);
                                      },
                                    ),
                              SizedBox(
                                width: 30.spMin,
                              ),
                              CustomButtom(
                                text: 'More Details',
                                onPressed: () {
                                  controller.goToOrderDetails(
                                      controller.ordersList[index]);
                                },
                              ),
                            ],
                          ),
                        ],
                      ),
                    );
            },
          ),
        ),
      );
    });
  }
}
