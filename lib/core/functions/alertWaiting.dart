import 'package:flutter/material.dart';
import 'package:get/get.dart';

alertWaiting() {
  return Get.defaultDialog(
    title: '',
    content: const CircularProgressIndicator(),
  );
}
