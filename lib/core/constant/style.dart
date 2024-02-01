import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

TextStyle h1 = GoogleFonts.firaSans(
    fontSize: 48, fontWeight: FontWeight.bold, color: AppColor.black);
TextStyle h2 = GoogleFonts.firaSans(
    fontSize: 40.spMin, fontWeight: FontWeight.w600, color: AppColor.black);
TextStyle h3 = GoogleFonts.firaSans(
    fontSize: 32.spMin, fontWeight: FontWeight.w400, color: AppColor.black);
TextStyle h4 = GoogleFonts.firaSans(
    fontSize: 22.spMin, fontWeight: FontWeight.w400, color: AppColor.black);
TextStyle h5 = GoogleFonts.firaSans(
    fontSize: 16, fontWeight: FontWeight.w400, color: Colors.black);
TextStyle h6 = GoogleFonts.firaSans(
    fontSize: 14, fontWeight: FontWeight.w400, color: Colors.black);

class Themes {
  static final light = ThemeData(
    appBarTheme:
        const AppBarTheme(backgroundColor: AppColor.primary, centerTitle: true),
    bottomNavigationBarTheme:
        const BottomNavigationBarThemeData(backgroundColor: Colors.white),
    drawerTheme:
        const DrawerThemeData(backgroundColor: AppColor.lightbackgroundC),

    textTheme: TextTheme(
      headlineLarge: h1,
      headlineMedium: h2,
      headlineSmall: h3,
      displayLarge: h4,
      displayMedium: h5,
      displaySmall: h6,
    ),
    brightness: Brightness.light,
    primaryColor: AppColor.lightbackgroundC,

    //colorScheme: ColorScheme(background: AppColor.lightbackgroundC, brightness: null),
  );

  static final dark = ThemeData(
    // appBarTheme: const AppBarTheme(backgroundColor: AppColor.darkbackgroundC),
    appBarTheme:
        const AppBarTheme(backgroundColor: AppColor.primary, centerTitle: true),
    bottomNavigationBarTheme: const BottomNavigationBarThemeData(
        backgroundColor: AppColor.darkbackgroundC),
    drawerTheme:
        const DrawerThemeData(backgroundColor: AppColor.darkbackgroundC),
    textTheme: TextTheme(
      headlineLarge:
          h1.copyWith(color: const Color.fromARGB(203, 255, 255, 255)),
      headlineMedium:
          h2.copyWith(color: const Color.fromARGB(203, 255, 255, 255)),
      headlineSmall:
          h3.copyWith(color: const Color.fromARGB(203, 255, 255, 255)),
      displayLarge:
          h4.copyWith(color: const Color.fromARGB(203, 255, 255, 255)),
      displayMedium:
          h5.copyWith(color: const Color.fromARGB(203, 255, 255, 255)),
      displaySmall:
          h6.copyWith(color: const Color.fromARGB(203, 255, 255, 255)),
    ),
    brightness: Brightness.dark,
    primaryColor: AppColor.darkbackgroundC,
    //colorScheme: ColorScheme(background: AppColor.darkbackgroundC),
  );
}
