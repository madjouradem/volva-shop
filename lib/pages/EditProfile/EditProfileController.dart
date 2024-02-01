import 'dart:convert';
import 'dart:io';

import 'package:crypto/crypto.dart';
import 'package:ecommerce_app/core/calsses/StatusRequest.dart';
import 'package:ecommerce_app/core/calsses/UploadCtr.dart';
import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:ecommerce_app/core/functions/handlingData.dart';
import 'package:ecommerce_app/pages/EditProfile/EditProfileData.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:image_picker/image_picker.dart';

abstract class EditProfileCtrAbs extends GetxController {
  changeUsername();
  changePassword();
  changeImage({required ImageSource imageSource});
  showPassword();
  showPassword2();
}

class EditProfileCtr extends EditProfileCtrAbs {
  StatusRequest statusRequest = StatusRequest.none;
  EditProfileData data = EditProfileData();
  MyServices myServices = Get.find();
  GlobalKey<FormState> formstate = GlobalKey<FormState>();
  GlobalKey<FormState> formstate2 = GlobalKey<FormState>();
  TextEditingController username = TextEditingController();
  TextEditingController currentpassword = TextEditingController();
  TextEditingController password = TextEditingController();
  TextEditingController repassword = TextEditingController();
  bool isshowpassword = true;
  bool isshowpassword2 = true;
  File? image;
  String? imageName;

  @override
  void onInit() {
    username.text = myServices.box.read('user')['user_name'];

    super.onInit();
  }

  @override
  changeUsername() async {
    if (formstate2.currentState!.validate()) {
      if (username.text != myServices.box.read('user')['user_name']) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await data.changeUsername(
            myServices.box.read('user')['user_id'], username.text);
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response['status'] == 'success') {
            myServices.box.read('user')['user_name'] = username.text;

            Get.snackbar('Change Username', 'username changed successfully');
          } else {
            Get.snackbar('Change Username', 'username failed change');
          }
        } else {
          statusRequest = StatusRequest.failure;
        }
        update();
      }
    }
  }

  @override
  changePassword() async {
    if (formstate.currentState!.validate()) {
      if (sha1.convert(utf8.encode(currentpassword.text)).toString() ==
          myServices.box.read('user')['user_password']) {
        statusRequest = StatusRequest.loading;
        update();
        var response = await data.changePassword(
            myServices.box.read('user')['user_id'], username.text);
        statusRequest = handlingData(response);
        if (statusRequest == StatusRequest.success) {
          if (response['status'] == 'success') {
            myServices.box.read('user')['user_password'] =
                sha1.convert(utf8.encode(password.text)).toString();
            Get.snackbar('Change password', 'password changed successfully');
          } else {
            Get.snackbar('Change password', 'password failed change');
          }
        } else {
          statusRequest = StatusRequest.failure;
        }
        update();
      } else {
        Get.defaultDialog(
            title: 'Wrong Password',
            middleText: 'THe current password is wrong');
      }
    }
  }

  @override
  changeImage({required ImageSource imageSource}) async {
    List<String> imageExtensions = ['jpg', 'jpeg', 'png'];
    //List<String> filesExtensions = ['pdf', 'docs'];

    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: imageExtensions,
    );
    if (result != null) {
      image = File(result.files.first.path!);
      if (image == null) {
        return;
      }
      imageName = await Get.put(UploadCtr())
          .uploadFile(File(image!.path), {'dir': "personalImages"});
    }
    print('////////////////////');
    print(imageName);
    print('////////////////////');

    if (imageName != '') {
      // save image name in DB
      statusRequest = StatusRequest.loading;
      update();
      var response = await data.changeImage(
          myServices.box.read('user')['user_id'], imageName);
      statusRequest = handlingData(response);
      if (statusRequest == StatusRequest.success) {
        if (response['status'] == 'success') {
          myServices.box.read('user')['user_image'] = imageName;
          print(
              '///////////////////${myServices.box.read('user')['user_image']}');
          Get.snackbar('Change Image', 'Image changed successfully');
        } else {
          Get.snackbar('Change Image', 'Image failed change');
        }
      } else {
        statusRequest = StatusRequest.failure;
      }
      update();
    }
  }

  @override
  showPassword() {
    isshowpassword = isshowpassword == true ? false : true;
    update();
  }

  @override
  showPassword2() {
    isshowpassword2 = isshowpassword2 == true ? false : true;
    update();
  }
}
