import 'package:ecommerce_app/core/calsses/Cart/CartCtr.dart';
import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/core/constant/AppImage.dart';
import 'package:ecommerce_app/pages/Cart/CartController.dart';
import 'package:ecommerce_app/pages/Cart/widgets/CartCount.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';

class CustomCarts extends StatelessWidget {
  const CustomCarts({
    super.key,
    required this.controller,
    required this.cartCtr,
  });

  final CartViewCtr controller;
  final CartCtr cartCtr;
  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartCtr>(builder: (_) {
      return ListView.builder(
        shrinkWrap: true,
        itemCount: controller.cartList.length,
        itemBuilder: (context, index) {
          if (cartCtr.cartItem[controller.cartList[index].itemId!] == null) {
            cartCtr.cartItem[controller.cartList[index].itemId!] =
                controller.cartList[index].isCart;
          }

          if (int.parse(controller.cartList[index].ititemCount!) <
              int.parse(controller.cartList[index].cartCount!)) {
            double price = controller.cartList[index].itemPriceDiscount! *
                int.parse(controller.cartList[index].ititemCount!);
            cartCtr.editCartCount(controller.cartList[index].ititemCount!,
                price.toString(), controller.cartList[index].cartId!);
          }

          return cartCtr.cartItem[controller.cartList[index].itemId!] == '1'
              ? CheckboxListTile(
                  onChanged: (value) {
                    if (value == true) {
                      //make the cart selected
                      cartCtr.selectCart(
                          controller.cartList[index].cartId!,
                          double.parse(controller.cartList[index].cartPrice!),
                          controller.cartList[index].itemId!);
                    } else {
                      //make the cart Inselected
                      cartCtr.inSelectCart(controller.cartList[index].cartId!,
                          double.parse(controller.cartList[index].cartPrice!));
                    }
                  },
                  // selected: true,

                  visualDensity: VisualDensity.compact,

                  value: cartCtr
                          .selectedCart[controller.cartList[index].cartId!] !=
                      null,
                  checkboxShape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(10.r),
                  ),
                  selectedTileColor: AppColor.primary,
                  activeColor: AppColor.primary,
                  contentPadding: const EdgeInsets.all(0),
                  title: Container(
                    height: 99.h,
                    margin: EdgeInsets.only(bottom: 8.spMin),
                    decoration: BoxDecoration(
                      boxShadow: const [
                        // BoxShadow(
                        //     blurRadius: 2,
                        //     offset: Offset(1, 3),
                        //     color: Colors.black45,
                        //     blurStyle: BlurStyle.outer),
                      ],
                      borderRadius: BorderRadius.circular(10.r),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                            flex: 1,
                            child: Container(
                              decoration: BoxDecoration(
                                  color: AppColor.lightbackgroundC,
                                  borderRadius: BorderRadius.circular(10.spMin),
                                  image: DecorationImage(
                                      fit: BoxFit.cover,
                                      image: NetworkImage(
                                        controller.cartList[index].itemImage!,
                                        scale: 0.8,
                                      ))),
                            )),
                        Expanded(
                          flex: 1,
                          child: Container(
                            color: AppColor.lightbackgroundC,
                            child: Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Expanded(
                                  flex: 1,
                                  child: Container(
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 5.spMin),
                                    alignment: Alignment.centerLeft,
                                    child: Text(
                                      controller.cartList[index].itemName!,
                                      style: Theme.of(context)
                                          .textTheme
                                          .displaySmall!
                                          .copyWith(
                                              fontWeight: FontWeight.bold),
                                    ),
                                  ),
                                ),
                                Expanded(
                                  flex: 1,
                                  child: Align(
                                    alignment: Alignment.topLeft,
                                    child: GetBuilder<CartCtr>(
                                        id: 'cartCount',
                                        builder: (_) {
                                          //if item count less then cart price == item price * item count else cart price
                                          //and  cart count = item count
                                          if (int.parse(controller
                                                  .cartList[index]
                                                  .ititemCount!) <
                                              int.parse(controller
                                                  .cartList[index]
                                                  .cartCount!)) {
                                            double price = controller
                                                    .cartList[index]
                                                    .itemPriceDiscount! *
                                                int.parse(controller
                                                    .cartList[index]
                                                    .ititemCount!);
                                            controller.cartList[index]
                                                .cartPrice = price.toString();
                                            //and  cart count = item count
                                            controller
                                                    .cartList[index].cartCount =
                                                controller.cartList[index]
                                                    .ititemCount;
                                          }

                                          return Container(
                                            margin: EdgeInsets.symmetric(
                                                horizontal: 5.spMin),
                                            child: Text(
                                              '${controller.cartList[index].cartPrice!} \$',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium!
                                                  .copyWith(
                                                      fontWeight:
                                                          FontWeight.bold,
                                                      color: AppColor.primary),
                                            ),
                                          );
                                        }),
                                  ),
                                ),
                              ],
                            ),
                          ),
                        ),
                        Container(
                          alignment: Alignment.center,
                          color: AppColor.lightbackgroundC,
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.end,
                            children: [
                              Expanded(
                                flex: 2,
                                child: InkWell(
                                  onTap: () {
                                    //remove cart
                                    cartCtr.removeCart(
                                        controller.cartList[index].itemId!);
                                    //make the cart Inselected
                                    if (cartCtr.selectedCart[controller
                                            .cartList[index].cartId!] !=
                                        null) {
                                      cartCtr.inSelectCart(
                                          controller.cartList[index].cartId!,
                                          controller.cartList[index]
                                              .itemPriceDiscount!);
                                    }
                                  },
                                  child: Container(
                                    padding: EdgeInsets.symmetric(
                                        horizontal: 8.spMin),
                                    margin: EdgeInsets.symmetric(
                                        horizontal: 3.spMin, vertical: 5.spMin),
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(10.r),
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 2,
                                          offset: Offset(1, 3),
                                          color: Colors.black45,
                                          blurStyle: BlurStyle.outer,
                                        ),
                                      ],
                                    ),
                                    child: SvgPicture.asset(
                                      AppImage.trash,
                                      color: AppColor.breaker,
                                      height: 22.spMin,
                                      width: 22.spMin,
                                    ),
                                  ),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: Row(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.center,
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Padding(
                                        padding:
                                            EdgeInsets.only(bottom: 17.spMin),
                                        child: InkWell(
                                            onTap: () async {
                                              var priceWithDiscount = double
                                                      .parse(controller
                                                          .cartList[index]
                                                          .itemPrice!) -
                                                  (double.parse(controller
                                                          .cartList[index]
                                                          .itemDiscount!) *
                                                      double.parse(controller
                                                          .cartList[index]
                                                          .itemPrice!) /
                                                      100);
                                              //this cond for make sure there is at list one cart
                                              if (controller.cartList[index]
                                                      .cartCount !=
                                                  '1') {
                                                if (await cartCtr
                                                    .decrementCartCount(
                                                  controller
                                                      .cartList[index].cartId!,
                                                  priceWithDiscount.toString(),
                                                )) {
                                                  controller.cartList[index]
                                                      .cartCount = (int.parse(
                                                              controller
                                                                  .cartList[
                                                                      index]
                                                                  .cartCount!) -
                                                          1)
                                                      .toString();
                                                  //"-" operating for cart price with count
                                                  controller.cartList[index]
                                                          .cartPrice =
                                                      (priceWithDiscount *
                                                              int.parse(controller
                                                                  .cartList[
                                                                      index]
                                                                  .cartCount!))
                                                          .toString();
                                                  cartCtr.update(['cartCount']);
                                                  if (cartCtr.selectedCart[
                                                          controller
                                                              .cartList[index]
                                                              .cartId!] !=
                                                      null) {
                                                    cartCtr.price -=
                                                        priceWithDiscount;

                                                    cartCtr.totalPrice -=
                                                        priceWithDiscount;
                                                    cartCtr.update();
                                                  }
                                                }
                                              } else {
                                                //if cart count < 1 => remove this cart
                                                Get.defaultDialog(
                                                  content: const Text(
                                                      'Are you sure want remove this Cart ?'),
                                                  confirm: TextButton(
                                                      onPressed: () {
                                                        cartCtr.removeCart(
                                                            controller
                                                                .cartList[index]
                                                                .itemId!);
                                                        Get.back();
                                                      },
                                                      child: const Text('Yes')),
                                                  cancel: TextButton(
                                                    onPressed: () {
                                                      Get.back();
                                                    },
                                                    child: const Text('No'),
                                                  ),
                                                  title: '',
                                                );
                                              }
                                            },
                                            child: const Icon(Icons.minimize)),
                                      ),
                                      CartCount(
                                          cartCtr: cartCtr,
                                          controller: controller,
                                          cartModel:
                                              controller.cartList[index]),
                                      InkWell(
                                          onTap: () async {
                                            var priceWithDiscount =
                                                double.parse(controller
                                                        .cartList[index]
                                                        .itemPrice!) -
                                                    (double.parse(controller
                                                            .cartList[index]
                                                            .itemDiscount!) *
                                                        double.parse(controller
                                                            .cartList[index]
                                                            .itemPrice!) /
                                                        100);
                                            if (await cartCtr
                                                .incrementCartCount(
                                                    controller.cartList[index]
                                                        .cartId!,
                                                    controller.cartList[index]
                                                        .itemId!,
                                                    priceWithDiscount
                                                        .toString())) {
                                              // increment cart count
                                              controller.cartList[index]
                                                  .cartCount = (int.parse(
                                                          controller
                                                              .cartList[index]
                                                              .cartCount!) +
                                                      1)
                                                  .toString();

                                              //"+" operating for cart price
                                              controller.cartList[index]
                                                      .cartPrice =
                                                  (priceWithDiscount *
                                                          int.parse(controller
                                                              .cartList[index]
                                                              .cartCount!))
                                                      .toString();

                                              cartCtr.update();
                                              controller.update();
                                              controller.update(['cartCount']);

                                              if (cartCtr.selectedCart[
                                                      controller.cartList[index]
                                                          .cartId!] !=
                                                  null) {
                                                cartCtr.price +=
                                                    priceWithDiscount;

                                                cartCtr.totalPrice +=
                                                    priceWithDiscount;
                                                cartCtr.update();
                                                controller.update();
                                                controller
                                                    .update(['cartCount']);
                                              }
                                            }
                                          },
                                          child: const Icon(Icons.add))
                                    ]),
                              ),
                            ],
                          ),
                        )
                      ],
                    ),
                  ),
                )
              : Container();
        },
      );
    });
  }
}
