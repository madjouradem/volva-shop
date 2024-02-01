import 'package:ecommerce_app/core/calsses/Cart/CartCtr.dart';
import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/core/functions/validinput.dart';
import 'package:ecommerce_app/data/models/CartModel.dart';
import 'package:ecommerce_app/pages/1component/CustomButtom.dart';
import 'package:ecommerce_app/pages/Cart/CartController.dart';
import 'package:ecommerce_app/pages/Cart/widgets/CustomTextFormField.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class CartCount extends StatelessWidget {
  const CartCount({
    super.key,
    required this.cartCtr,
    required this.controller,
    required this.cartModel,
  });

  final CartCtr cartCtr;
  final CartViewCtr controller;
  final CartModel cartModel;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartCtr>(
        id: 'cartCount',
        builder: (_) {
          return GestureDetector(
            onTap: () {
              Get.defaultDialog(
                title: '',
                content: Column(
                  children: [
                    CustomTextForm(
                      focusNode: cartCtr.focusNodeFiled,
                      keyboardType: TextInputType.number,
                      hinttext: 'proudect count',
                      labeltext: 'proudect count',
                      iconData: Icons.numbers,
                      mycontroller: cartCtr.countFiled,
                      valid: (p0) {
                        return validInput(p0!, 1, 99999, 'number');
                      },
                    ),
                    CustomButtom(
                      text: 'valid',
                      onPressed: () async {
                        var priceWithDiscount =
                            double.parse(cartModel.itemPrice!) -
                                (double.parse(cartModel.itemDiscount!) *
                                    double.parse(cartModel.itemPrice!) /
                                    100);
                        if (await cartCtr.setCartCountCustom(
                            cartCtr.countFiled.text,
                            cartModel.cartId!,
                            cartModel.itemId!,
                            priceWithDiscount.toString())) {
                          //just for know cart count before applay
                          // the new custom count
                          double currentCount =
                              double.parse(cartModel.cartCount!);
                          // custom cart count
                          cartModel.cartCount = cartCtr.countFiled.text;

                          // "custom" operating for cart price
                          cartModel.cartPrice = (priceWithDiscount *
                                  int.parse(cartCtr.countFiled.text))
                              .toString();
                          controller.update(['cartCount']);
                          // for information cart
                          if (cartCtr.selectedCart[cartModel.cartId!] != null) {
                            // remove current cart price from
                            // totalprice and price
                            cartCtr.totalPrice = cartCtr.totalPrice -
                                priceWithDiscount * currentCount;

                            cartCtr.price = cartCtr.price -
                                priceWithDiscount * currentCount;
                            //add the new cart price to totalprice and price

                            cartCtr.totalPrice += priceWithDiscount *
                                int.parse(cartModel.cartCount!);

                            cartCtr.price += priceWithDiscount *
                                int.parse(cartModel.cartCount!);

                            cartCtr.update();
                          }
                        }
                      },
                    )
                  ],
                ),
              );
            },
            child: Container(
              width: 60.spMin,
              padding:
                  EdgeInsets.symmetric(horizontal: 8.spMin, vertical: 4.spMin),
              decoration: BoxDecoration(
                  border: Border.all(color: AppColor.primary),
                  borderRadius: BorderRadius.circular(10.spMin)),
              child: Text(
                cartModel.cartCount!,
                textAlign: TextAlign.center,
              ),
            ),
          );
        });
  }
}
