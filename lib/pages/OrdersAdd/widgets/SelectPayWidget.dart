import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/pages/OrdersAdd/OrdersAddController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SelectPayWidget extends StatelessWidget {
  const SelectPayWidget({super.key, required this.controller});

  final OrdersAddCtr controller;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {},
      child: Container(
        height: 60.spMin,
        width: double.infinity,
        padding: EdgeInsets.symmetric(horizontal: 10.spMin),
        margin: EdgeInsets.only(bottom: 10.spMin),
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(10),
            border: Border.all(color: AppColor.primary)),
        child: GetBuilder<OrdersAddCtr>(builder: (_) {
          return const Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text('pick pay methode'),
              Icon(Icons.add),
            ],
          );
        }),
      ),
    );
  }
}
