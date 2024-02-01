// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:get_storage/get_storage.dart';
import 'package:get/get.dart';

class ThemeServices {
  final GetStorage box = GetStorage();
  final key = 'dark';
  saveThemeToBox(bool isDark) => box.write(key, isDark);

  bool leodThemeFromBox() => box.read(key) ?? false;

  ThemeMode get theme => leodThemeFromBox() ? ThemeMode.dark : ThemeMode.light;

  switchTheme() {
    Get.changeThemeMode(leodThemeFromBox() ? ThemeMode.light : ThemeMode.dark);
    saveThemeToBox(!leodThemeFromBox());
  }
}
