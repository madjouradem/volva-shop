import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/pages/orders/OrdersController.dart';
import 'package:ecommerce_app/pages/orders/widgets/ActiveOrders.dart';
import 'package:ecommerce_app/pages/orders/widgets/ArchiveOrders.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Orders extends GetView<OrdersCtr> {
  const Orders({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(OrdersCtr());
    return DefaultTabController(
      length: 2,
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Orders'),
          bottom: TabBar(
              labelColor: Theme.of(context).primaryColor,
              indicatorColor: AppColor.breaker,
              indicatorSize: TabBarIndicatorSize.tab,
              unselectedLabelColor: AppColor.black,
              // labelStyle: Theme.of(context).textTheme.displayMedium,
              tabs: const [
                Tab(child: Text('Active')),
                Tab(child: Text('Archive')),
              ]),
        ),
        body: TabBarView(
          children: [
            // Container(),
            // Container(),
            ActiveOrders(controller: controller),
            ArchiveOrders(controller: controller),
          ],
        ),
      ),
    );
  }
}
