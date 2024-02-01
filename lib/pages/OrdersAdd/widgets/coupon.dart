import 'package:ecommerce_app/core/calsses/Cart/CartCtr.dart';
import 'package:ecommerce_app/core/calsses/StatusRequest.dart';
import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/core/functions/validinput.dart';
import 'package:ecommerce_app/pages/1component/CustomButtom.dart';
import 'package:ecommerce_app/pages/addressAdd/widgets/CustomButtomAddress.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class Coupon extends StatelessWidget {
  const Coupon({
    super.key,
    required this.cartCtr,
  });

  final CartCtr cartCtr;

  @override
  Widget build(BuildContext context) {
    return GetBuilder<CartCtr>(
        id: 'filed',
        builder: (ctr) {
          return cartCtr.price != 0.0
              ? Form(
                  key: cartCtr.couponFieldKey,
                  child: Container(
                    decoration: BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.circular(10)),
                    padding: EdgeInsets.symmetric(
                        horizontal: 6.spMin, vertical: 6.spMin),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        SizedBox(
                          width: 250.spMin,
                          child: Builder(builder: (context) {
                            return TextFormField(
                              validator: (val) {
                                return validInput(val!, 1, 100, '');
                              },
                              focusNode: cartCtr.focusNode,
                              cursorColor: AppColor.primary,
                              controller: cartCtr.couponFieldCtr,
                              onFieldSubmitted: (coupon) {
                                cartCtr.applayCoupon(coupon);
                              },
                              decoration: InputDecoration(
                                  hintText: 'Applay coupon her',
                                  hintStyle:
                                      Theme.of(context).textTheme.displaySmall,
                                  floatingLabelBehavior:
                                      FloatingLabelBehavior.always,
                                  contentPadding: EdgeInsets.symmetric(
                                      vertical: 8.h, horizontal: 15.w),
                                  focusedBorder: OutlineInputBorder(
                                      borderRadius: BorderRadius.circular(10.r),
                                      borderSide: const BorderSide(
                                          color: AppColor.primary)),
                                  focusColor: AppColor.primary,
                                  fillColor: AppColor.primary,
                                  hoverColor: AppColor.primary,
                                  errorText:
                                      cartCtr.statusRequestApllayCoupon !=
                                              StatusRequest.failure
                                          ? null
                                          : 'wrong coupon',
                                  // filled: true,
                                  suffixIconColor: AppColor.primary,

                                  // disabledBorder: ,
                                  border: OutlineInputBorder(
                                    borderRadius: BorderRadius.circular(10.r),
                                  )),
                            );
                          }),
                        ),
                        GetBuilder<CartCtr>(
                          id: 'filed',
                          builder: (_) {
                            return cartCtr.couponInfo == null
                                ? Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 8.0),
                                    child: CustomButtomAddress(
                                      text: 'Applay',
                                      onPressed: () {
                                        cartCtr.applayCoupon(
                                            cartCtr.couponFieldCtr.text);
                                      },
                                    ),
                                  )
                                : CustomButtom(
                                    text: 'Cancel',
                                    onPressed: () {
                                      cartCtr.cancelCoupon();
                                    },
                                  );
                          },
                        )
                      ],
                    ),
                  ),
                )
              : Container();
        });
  }
}
