import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/core/functions/validinput.dart';
import 'package:ecommerce_app/pages/addressAdd/widgets/CustomButtomAddress.dart';
import 'package:ecommerce_app/pages/addressAdd/widgets/CustomTextFormFieldAddress.dart';
import 'package:ecommerce_app/pages/addressEdit/AddressEditController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddressEditView extends GetView<AddressEditViewCtr> {
  const AddressEditView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressEditViewCtr());

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Address'),
          centerTitle: true,
          backgroundColor: AppColor.primary,
        ),
        body: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: GetBuilder<AddressEditViewCtr>(builder: (_) {
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
                  hinttext: "city",
                  iconData: Icons.edit_location_alt_outlined,
                  labeltext: "city",
                ),
                CustomTextFormAddress(
                  isNumber: false,
                  onFieldSubmitted: (p0) {
                    // controller.addAddress();
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
            controller.editAddress();
          },
          text: 'Next',
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
