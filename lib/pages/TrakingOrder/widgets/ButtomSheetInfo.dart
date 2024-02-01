import 'package:ecommerce_app/core/calsses/AddressCrt.dart';
import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/pages/TrakingOrder/TrakingOrderController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_decorated_text/flutter_decorated_text.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class MapDraggableScrollableSheet extends StatelessWidget {
  const MapDraggableScrollableSheet({
    super.key,
    required this.controller,
  });

  final AddressCtr controller;

  @override
  Widget build(BuildContext context) {
    TrakingOrderCtr trakingOrderCtr = Get.put(TrakingOrderCtr());

    return DraggableScrollableSheet(
      maxChildSize: 0.5,
      minChildSize: 0.03,
      builder: (context, scrollController) {
        return Container(
          padding: EdgeInsets.symmetric(horizontal: 8.spMin),
          decoration: BoxDecoration(
              boxShadow: const [
                BoxShadow(
                    color: Colors.black, offset: Offset(0, 3), blurRadius: 10)
              ],
              color: Theme.of(context).primaryColor,
              borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(30.r),
                  topRight: Radius.circular(30.r))),
          child: ListView(
            controller: scrollController,
            children: [
              Container(
                margin: EdgeInsets.symmetric(
                    horizontal: 135.spMin, vertical: 5.spMin),
                child: const Divider(
                  thickness: 5,
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(bottom: 10.spMin),
                child: Row(
                  children: [
                    Expanded(
                      child: DecoratedText(
                          text:
                              'Order Number : N° ${trakingOrderCtr.orderModel.orderId} ',
                          rules: [
                            DecoratorRule.words(
                                words: ['Order', 'Number'],
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(fontWeight: FontWeight.bold))
                          ]),
                    ),
                    Expanded(
                      child: DecoratedText(
                          text:
                              'Cost of  delivery : ${trakingOrderCtr.orderModel.orderPriceDelivery} \$ ',
                          rules: [
                            DecoratorRule.words(
                                words: ['Cost', 'of', 'delivery'],
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(fontWeight: FontWeight.bold))
                          ]),
                    ),
                  ],
                ),
              ),
              Container(
                margin: EdgeInsetsDirectional.only(bottom: 10.spMin),
                child: Row(
                  children: [
                    Expanded(
                      child: DecoratedText(
                          text:
                              'To : ${trakingOrderCtr.orderModel.addressCity} ${trakingOrderCtr.orderModel.addressStrees} ',
                          rules: [
                            DecoratorRule.word(
                                word: 'To',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(fontWeight: FontWeight.bold))
                          ]),
                    ),
                    Expanded(
                      child: DecoratedText(text: 'Distence : 2.3 Km', rules: [
                        DecoratorRule.word(
                            word: 'Distence',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(fontWeight: FontWeight.bold))
                      ]),
                    ),
                  ],
                ),
              ),
              Container(
                height: 60.spMin,
                decoration: BoxDecoration(
                    border: Border.all(
                      color: AppColor.primary,
                      width: 2.spMin,
                    ),
                    borderRadius: BorderRadius.circular(10.r)),
                margin: EdgeInsets.symmetric(
                  horizontal: 40.spMin,
                  vertical: 10.spMin,
                ),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    SizedBox(width: 10.spMin),
                    const CircleAvatar(),
                    SizedBox(width: 15.spMin),
                    Expanded(
                        child: Text(trakingOrderCtr.orderModel.deliveryName!)),
                    const Icon(Icons.email),
                    SizedBox(width: 15.spMin),
                    const Icon(Icons.phone),
                    SizedBox(width: 10.spMin),
                  ],
                ),
              ),
              GetBuilder<AddressCtr>(builder: (_) {
                return controller.myServices.box.read('isTrak') == '1'
                    ? GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          height: 60.spMin,
                          margin: EdgeInsets.symmetric(
                            horizontal: 40.spMin,
                            vertical: 10.spMin,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(10.spMin),
                          ),
                          child: Text(
                            'Delivered',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      )
                    : GestureDetector(
                        onTap: () {},
                        child: Container(
                          alignment: Alignment.center,
                          height: 60.spMin,
                          margin: EdgeInsets.symmetric(
                            horizontal: 40.spMin,
                            vertical: 10.spMin,
                          ),
                          decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(10.spMin),
                          ),
                          child: Text(
                            'Start Delivering',
                            style: Theme.of(context)
                                .textTheme
                                .displayMedium!
                                .copyWith(
                                  fontWeight: FontWeight.bold,
                                ),
                          ),
                        ),
                      );
              }),
            ],
          ),
        );
      },
    );
  }
}
