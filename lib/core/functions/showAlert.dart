import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../constant/AppColor.dart';

Future<bool> showAlert(
    {required String title, required String content, List<Widget>? action}) {
  Get.defaultDialog(
    title: title,
    titleStyle:
        const TextStyle(color: AppColor.primaryC1, fontWeight: FontWeight.bold),
    middleText: content,
    actions: action,
  );
  return Future.value(true);
}
