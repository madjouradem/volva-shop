import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LanguageCtr extends GetxController {
  Locale? language;
  MyServices myServices = Get.find();

  changeLang(String langCode) {
    myServices.box.write('langCode', langCode);
    Get.updateLocale(Locale(langCode));
  }

  @override
  void onInit() {
    super.onInit();
    language = Locale(
        myServices.box.read('langCode') ?? 'en');
  }
}
