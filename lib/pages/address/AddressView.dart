import 'package:ecommerce_app/core/calsses/Cart/CartCtr.dart';
import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/core/constant/AppRoute.dart';
import 'package:ecommerce_app/pages/address/AddressController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class AddressView extends GetView<AddressViewCtr> {
  const AddressView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressViewCtr());
    Get.put(CartCtr());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Address'),
          centerTitle: true,
          backgroundColor: AppColor.primary,
        ),
        body: Container(
          margin: EdgeInsets.all(8.spMin),
          height: double.infinity,
          width: double.infinity,
          child: GetBuilder<AddressViewCtr>(builder: (_) {
            return ListView.builder(
                itemCount: controller.addressList.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      controller.onSelectAddress(controller.addressList[index]);
                    },
                    child: Container(
                      height: 60.spMin,
                      width: double.infinity,
                      margin: EdgeInsets.only(bottom: 4.spMin),
                      decoration: BoxDecoration(
                          color: controller.myServices.box
                                      .read('selectedAddress') ==
                                  null
                              ? Colors.transparent
                              : controller.myServices.box.read(
                                          'selectedAddress')['address_id'] ==
                                      controller.addressList[index].addressId
                                  ? AppColor.primary
                                  : Colors.transparent,
                          borderRadius: BorderRadius.circular(10.spMin),
                          border: Border.all(color: AppColor.primary)),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Padding(
                            padding: const EdgeInsets.all(8.0),
                            child: Column(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  controller.addressList[index].addressCity!,
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium!
                                      .copyWith(fontWeight: FontWeight.bold),
                                ),
                                Text(
                                  controller.addressList[index].addressStrees!,
                                  style:
                                      Theme.of(context).textTheme.displaySmall,
                                ),
                              ],
                            ),
                          ),
                          PopupMenuButton<dynamic>(
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.spMin),
                            ),
                            splashRadius: 10,
                            padding: EdgeInsets.all(5.spMin),
                            itemBuilder: (context) {
                              return [
                                PopupMenuItem(
                                  child: InkWell(
                                    onTap: () {
                                      controller.goToEditAddress(
                                          controller.addressList[index]);
                                    },
                                    child: SizedBox(
                                      width: 90,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Icon(Icons.edit),
                                          Text(
                                            "rename",
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                                PopupMenuItem(
                                  child: InkWell(
                                    onTap: () {
                                      Get.defaultDialog(
                                        title: 'Are you sure ?',
                                        content: Container(),
                                        cancel: GestureDetector(
                                            onTap: () {
                                              Get.back();
                                            },
                                            child: Text(
                                              'cancel',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium!
                                                  .copyWith(
                                                      color: AppColor.primary),
                                            )),
                                        confirm: GestureDetector(
                                            onTap: () {
                                              controller.removeAddress(
                                                  index,
                                                  controller.addressList[index]
                                                      .addressId!);
                                              Get.back();
                                              Get.back();
                                            },
                                            child: Text(
                                              'confirm',
                                              style: Theme.of(context)
                                                  .textTheme
                                                  .displayMedium!
                                                  .copyWith(
                                                      color: AppColor.primary),
                                            )),
                                      );
                                    },
                                    child: SizedBox(
                                      width: 90,
                                      child: Row(
                                        mainAxisAlignment:
                                            MainAxisAlignment.spaceAround,
                                        children: [
                                          const Icon(Icons.delete),
                                          Text(
                                            "remove",
                                            style: Theme.of(context)
                                                .textTheme
                                                .displayMedium,
                                          ),
                                        ],
                                      ),
                                    ),
                                  ),
                                ),
                              ];
                            },
                          ),
                        ],
                      ),
                    ),
                  );
                });
          }),
        ),
        floatingActionButton: FloatingActionButton(
            hoverColor: AppColor.primary,
            backgroundColor: AppColor.primary,
            onPressed: () {
              Get.toNamed(AppRoute.maps);
            },
            child: const Icon(Icons.add)),
      ),
    );
  }
}
