// import 'dart:io';
// import 'package:flutter/material.dart';

// import '../constant/AppColor.dart';

// Future<bool> alertExitApp() {
//   Get.defaultDialog(
//       title: "تنبيه",
//       titleStyle: const TextStyle(
//           color: AppColor.primaryC1, fontWeight: FontWeight.bold),
//       middleText: "هل تريد الخروج من التطبيق",
//       actions: [
//         ElevatedButton(
//             style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(AppColor.primaryC1)),
//             onPressed: () {
//               exit(0);
//             },
//             child: const Text("تاكيد")),
//         ElevatedButton(
//             style: ButtonStyle(
//                 backgroundColor: MaterialStateProperty.all(AppColor.primaryC1)),
//             onPressed: () {
//               Get.back();
//             },
//             child: const Text("الغاء"))
//       ]);
//   return Future.value(true);
// }
