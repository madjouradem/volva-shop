import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/core/constant/AppImage.dart';
import 'package:ecommerce_app/core/constant/AppLinkes.dart';
import 'package:ecommerce_app/core/functions/validinput.dart';
import 'package:ecommerce_app/pages/1component/CustomTextFormField.dart';
import 'package:ecommerce_app/pages/EditProfile/EditProfileController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

class EditProfileView extends GetView<EditProfileCtr> {
  const EditProfileView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(EditProfileCtr());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Edit Profile'),
        ),
        body: Container(
          margin: EdgeInsets.all(8.spMin),
          height: double.infinity,
          width: double.infinity,
          child: GetBuilder<EditProfileCtr>(builder: (_) {
            return ListView(
              children: [
                Container(
                  height: 120.spMin,
                  width: 120.spMin,
                  margin: EdgeInsets.symmetric(horizontal: 130.spMin),
                  decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.circular(90.spMin),
                      image: controller.myServices.box
                                  .read('user')['user_image'] ==
                              ''
                          ? const DecorationImage(
                              image: AssetImage(AppImage.image))
                          : DecorationImage(
                              fit: BoxFit.cover,
                              image: NetworkImage(
                                  "${AppLink.upload}personalImages/${controller.myServices.box.read('user')['user_image']}"))),
                  child: Align(
                    alignment: Alignment.bottomCenter,
                    child: GestureDetector(
                      onTap: () {
                        controller.changeImage(imageSource: ImageSource.camera);
                      },
                      child: Container(
                        height: 30.spMin,
                        width: 40.spMin,
                        decoration: BoxDecoration(
                            color: AppColor.breaker,
                            borderRadius: BorderRadius.circular(10.spMin)),
                        child: const Icon(Icons.edit),
                      ),
                    ),
                  ),
                ),
                SizedBox(
                  height: 40.spMin,
                ),
                Form(
                  key: controller.formstate2,
                  child: CustomTextForm(
                    hinttext: '39'.tr,
                    labeltext: '39'.tr,
                    iconData: Icons.edit,
                    mycontroller: controller.username,
                    valid: (p0) {
                      return validInput(p0!, 2, 50, 'username');
                    },
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    controller.changeUsername();
                  },
                  child: Container(
                    height: 45.spMin,
                    margin: EdgeInsets.symmetric(horizontal: 130.spMin),
                    decoration: BoxDecoration(
                        color: AppColor.primary,
                        borderRadius: BorderRadius.circular(10.spMin)),
                    child: Center(
                      child: Text(
                        'save',
                        style: Theme.of(context).textTheme.displayMedium,
                      ),
                    ),
                  ),
                ),
                Container(
                  height: 1,
                  margin: EdgeInsets.symmetric(vertical: 30.spMin),
                  width: double.infinity,
                  color: AppColor.black,
                ),
                Form(
                  key: controller.formstate,
                  child: Column(children: [
                    CustomTextForm(
                      hinttext: '40'.tr,
                      labeltext: '40'.tr,
                      iconData: controller.isshowpassword2
                          ? Icons.lock_outline
                          : Icons.lock_open_outlined,
                      onTapIcon: () {
                        controller.showPassword2();
                      },
                      obscureText: controller.isshowpassword2,
                      mycontroller: controller.currentpassword,
                      valid: (p0) {
                        return validInput(p0!, 2, 50, '');
                      },
                    ),
                    CustomTextForm(
                      hinttext: '25'.tr,
                      labeltext: '25'.tr,
                      mycontroller: controller.password,
                      iconData: controller.isshowpassword
                          ? Icons.lock_outline
                          : Icons.lock_open_outlined,
                      obscureText: controller.isshowpassword,
                      onTapIcon: () {
                        controller.showPassword();
                      },
                      valid: (p0) {
                        return validInputPassword(
                            p0!, controller.repassword.text, 2, 50);
                      },
                    ),
                    CustomTextForm(
                      hinttext: '14'.tr,
                      labeltext: '14'.tr,
                      iconData: controller.isshowpassword
                          ? Icons.lock_outline
                          : Icons.lock_open_outlined,
                      onTapIcon: () {
                        controller.showPassword();
                      },
                      mycontroller: controller.repassword,
                      obscureText: controller.isshowpassword,
                      valid: (p0) {
                        return validInputPassword(
                            p0!, controller.password.text, 2, 50);
                      },
                    ),
                    GestureDetector(
                      onTap: () {
                        controller.changePassword();
                      },
                      child: Container(
                        height: 45.spMin,
                        margin: EdgeInsets.symmetric(horizontal: 130.spMin),
                        decoration: BoxDecoration(
                            color: AppColor.primary,
                            borderRadius: BorderRadius.circular(10.spMin)),
                        child: Center(
                          child: Text(
                            'save',
                            style: Theme.of(context).textTheme.displayMedium,
                          ),
                        ),
                      ),
                    ),
                  ]),
                )
              ],
            );
          }),
        ),
      ),
    );
  }
}
