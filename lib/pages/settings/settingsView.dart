import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class SettingsView extends StatelessWidget {
  const SettingsView({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
            appBar: AppBar(
              title: const Text('settings'),
            ),
            body: Container(
              margin: EdgeInsets.all(10.spMin),
              height: double.infinity,
              width: double.infinity,
            )));
  }
}

class SettingBar extends StatelessWidget {
  const SettingBar({
    super.key,
    required this.name,
    required this.widget,
    this.route,
  });
  final Widget widget;
  final String name;
  final String? route;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0.spMin),
      child: GestureDetector(
        onTap: route == null
            ? () {}
            : () {
                Get.toNamed(route!);
              },
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              name,
              style: Theme.of(context)
                  .textTheme
                  .displayMedium!
                  .copyWith(fontWeight: FontWeight.w600),
            ),
            widget,
          ],
        ),
      ),
    );
  }
}
