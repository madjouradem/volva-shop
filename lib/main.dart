import 'package:ecommerce_app/core/bindings/MyBinding.dart';
import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:ecommerce_app/core/constant/style.dart';
import 'package:ecommerce_app/core/constant/theme%20services.dart';
import 'package:ecommerce_app/core/translations/LanguageCtr.dart';
import 'package:ecommerce_app/core/translations/MyTranslation.dart';
import 'package:ecommerce_app/routes.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await initialServices();
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ScreenUtilInit(
      builder: (context, _) => GetMaterialApp(
        getPages: routes,
        debugShowCheckedModeBanner: false,
        title: 'Ecommerce',
        theme: Themes.light,
        initialBinding: MyBinding(),
        themeMode: ThemeServices().theme,
        locale: Get.put<LanguageCtr>(LanguageCtr()).language,
        translations: MyTranslation(),
      ),
    );
  }
}
