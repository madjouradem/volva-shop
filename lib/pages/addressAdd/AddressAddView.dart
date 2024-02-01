import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/core/functions/validinput.dart';
import 'package:ecommerce_app/pages/addressAdd/AddressAddController.dart';
import 'package:ecommerce_app/pages/addressAdd/widgets/CustomButtomAddress.dart';
import 'package:ecommerce_app/pages/addressAdd/widgets/CustomTextFormFieldAddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressAddView extends GetView<AddressAddViewCtr> {
  const AddressAddView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressAddViewCtr());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Add Address'),
          centerTitle: true,
          backgroundColor: AppColor.primary,
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: GetBuilder<AddressAddViewCtr>(builder: (_) {
            return ListView(
              children: [
                const SizedBox(
                  height: 60,
                  width: double.infinity,
                ),
                CustomTextFormAddress(
                  isNumber: false,
                  onFieldSubmitted: (p0) {
                    FocusScope.of(context)
                        .requestFocus(controller.field2FocusNode);
                  },
                  textInputAction: TextInputAction.next,
                  focusNode: controller.field1FocusNode,
                  keyboardType: TextInputType.text,
                  valid: (val) {
                    return validInput(val!, 2, 100, "");
                  },
                  mycontroller: controller.city,
                  hinttext: "city".tr,
                  iconData: Icons.edit_location_alt_outlined,
                  labeltext: "city".tr,
                ),
                CustomTextFormAddress(
                  isNumber: false,
                  onFieldSubmitted: (p0) {
                    controller.addAddress();
                  },
                  textInputAction: TextInputAction.next,
                  focusNode: controller.field2FocusNode,
                  keyboardType: TextInputType.text,
                  valid: (val) {
                    return validInput(val!, 2, 100, "");
                  },
                  mycontroller: controller.street,
                  hinttext: "street",
                  iconData: Icons.edit_location_alt_outlined,
                  labeltext: "street",
                ),
              ],
            );
          }),
        ),
        floatingActionButton: CustomButtomAddress(
          onPressed: () {
            controller.addAddress();
          },
          text: 'Next',
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
