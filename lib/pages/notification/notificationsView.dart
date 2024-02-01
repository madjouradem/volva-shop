import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/core/constant/AppImage.dart';
import 'package:ecommerce_app/data/models/NotificationModel.dart';
import 'package:ecommerce_app/pages/1component/BnbAndDrawer/bottomNavigationBar.dart';
import 'package:ecommerce_app/pages/notification/notificationsController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';
import 'package:jiffy/jiffy.dart';

class NotificationsView extends GetView<NotificationsCtr> {
  const NotificationsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(NotificationsCtr());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          title: const Text('Notifications'),
        ),
        body: Container(
          margin: EdgeInsets.all(10.spMin),
          height: double.infinity,
          width: double.infinity,
          child: GetBuilder<NotificationsCtr>(builder: (_) {
            return ListView.builder(
              itemCount: controller.notificationsList.length,
              itemBuilder: (context, index) {
                return Dismissible(
                  key: Key(controller.notificationsList[index].notificationId!),
                  onDismissed: (direction) {
                    NotificationModel notification =
                        controller.notificationsList[index];
                    if (direction == DismissDirection.startToEnd) {
                      ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                        key: const Key('a'),
                        content: const Text('Delete Notification'),
                        duration: const Duration(seconds: 1),
                        action: SnackBarAction(
                            label: 'Undo',
                            onPressed: () {
                              controller.notificationsList
                                  .insert(index, notification);
                              controller.update();
                            }),
                      ));
                    }
                  },
                  background: Container(
                    color: Colors.red,
                    alignment: Alignment.centerLeft,
                    child: SvgPicture.asset(AppImage.trash),
                  ),
                  child: Container(
                    margin: EdgeInsets.only(bottom: 4.spMin),
                    padding: EdgeInsets.all(5.spMin),
                    height: 60.spMin,
                    width: double.infinity,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10.spMin),
                      // border: Border.all(color: AppColor.primary),
                    ),
                    child: Row(
                      children: [
                        Expanded(
                          flex: 3,
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.spaceAround,
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              Text(
                                '${controller.notificationsList[index].notificationTitle}',
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(fontWeight: FontWeight.bold),
                              ),
                              Text(
                                  '${controller.notificationsList[index].notificationBody}',
                                  style: Theme.of(context)
                                      .textTheme
                                      .displayMedium),
                            ],
                          ),
                        ),
                        Expanded(
                          child: Align(
                              alignment: Alignment.center,
                              child: Text(
                                Jiffy.parse(
                                        '${controller.notificationsList[index].notificationDate}')
                                    .fromNow(),
                                style: Theme.of(context)
                                    .textTheme
                                    .displayMedium!
                                    .copyWith(color: AppColor.primary),
                              )),
                        ),
                      ],
                    ),
                  ),
                );
              },
            );
          }),
        ),
        bottomNavigationBar: const BNB(),
      ),
    );
  }
}
