import 'package:ecommerce_app/core/calsses/Cart/CartCtr.dart';
import 'package:ecommerce_app/pages/Item/ItemController.dart';
import 'package:ecommerce_app/pages/Item/widgets/AddCartButton.dart';
import 'package:ecommerce_app/pages/Item/widgets/ImagePart.dart';
import 'package:ecommerce_app/pages/Item/widgets/ItemInforamtion.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Item extends GetView<ItemCtr> {
  const Item({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(ItemCtr());
    Get.put(CartCtr());
    return SafeArea(
      child: Scaffold(
        // appBar: ,
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          // color: Colors.black,
          // margin: EdgeInsets.symmetric(horizontal: 5.spMin),
          child: SingleChildScrollView(
            child: Column(
              children: [
                ImagePart(controller: controller),
                ItemInforamtion(controller: controller),
              ],
            ),
          ),
        ),
        floatingActionButton: AddCartButton(controller: controller),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
