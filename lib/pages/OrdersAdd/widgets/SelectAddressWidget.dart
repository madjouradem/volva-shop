import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/pages/OrdersAdd/OrdersAddController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectAddressWidget extends StatelessWidget {
  const SelectAddressWidget({super.key, required this.controller});

  final OrdersAddCtr controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        controller.goToAddress();
      },
      child: Container(
        height: 60.spMin,
        width: double.infinity,
        margin: EdgeInsets.only(bottom: 10.spMin),
        padding: EdgeInsets.symmetric(horizontal: 10.spMin),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColor.primary)),
        child: GetBuilder<OrdersAddCtr>(
            id: 'address in order',
            builder: (_) {
              return Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Text(controller.myServices.box.read('selectedAddress') != null
                      ? controller.myServices.box
                          .read('selectedAddress')['address_city']
                      : 'pick address'),
                  controller.myServices.box.read('selectedAddress') != null
                      ? const Icon(Icons.place)
                      : const Icon(Icons.add),
                ],
              );
            }),
      ),
    );
  }
}
