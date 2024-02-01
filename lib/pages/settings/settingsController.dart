import 'package:ecommerce_app/core/calsses/StatusRequest.dart';
import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:ecommerce_app/pages/settings/settingsData.dart';
import 'package:get/get.dart';

abstract class SettingsCtrAbs extends GetxController {}

class SettingsCtr extends SettingsCtrAbs {
  StatusRequest statusRequest = StatusRequest.none;
  SettingsData data = SettingsData();
  MyServices myServices = Get.find();
}
