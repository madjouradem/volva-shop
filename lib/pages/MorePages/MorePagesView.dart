import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/core/constant/AppImage.dart';
import 'package:ecommerce_app/core/constant/AppLinkes.dart';
import 'package:ecommerce_app/core/constant/AppRoute.dart';
import 'package:ecommerce_app/data/models/MorePagesModel.dart';
import 'package:ecommerce_app/pages/1component/BnbAndDrawer/bottomNavigationBar.dart';
import 'package:ecommerce_app/pages/MorePages/MorePagesController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

class MorePagesView extends GetView<MorePagesCtr> {
  const MorePagesView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(MorePagesCtr());

    List<MorePagesModel> morePagesList = [
      MorePagesModel(
        name: 'Edit Profile',
        route: AppRoute.editprofile,
        widget: GestureDetector(child: SvgPicture.asset(AppImage.profile)),
      ),
      MorePagesModel(
        name: 'Notification',
        route: AppRoute.orders,
        widget: GestureDetector(child: SvgPicture.asset(AppImage.notification)),
      ),
      MorePagesModel(
        name: 'Language',
        route: AppRoute.orders,
        widget: GestureDetector(child: SvgPicture.asset(AppImage.language)),
      ),
      MorePagesModel(
        name: 'Orders',
        route: AppRoute.orders,
        widget: GestureDetector(child: SvgPicture.asset(AppImage.order)),
      ),
      MorePagesModel(
        name: 'Address',
        route: AppRoute.address,
        widget: GestureDetector(child: SvgPicture.asset(AppImage.gps)),
      ),
      MorePagesModel(
          name: 'Payments',
          route: AppRoute.favorite,
          widget:
              GestureDetector(child: SvgPicture.asset(AppImage.creditCard))),
      MorePagesModel(
        name: 'Dark Mode',
        route: AppRoute.orders,
        widget: Switch(
          value: false,
          onChanged: (value) {},
        ),
      )
    ];

    List<MorePagesModel> morePagesList2 = [
      MorePagesModel(
          name: 'Privacy policy',
          route: AppRoute.favorite,
          widget:
              GestureDetector(child: const Icon(Icons.privacy_tip_outlined))),
      MorePagesModel(
          name: 'Contact Us',
          route: AppRoute.favorite,
          widget: GestureDetector(child: const Icon(Icons.call))),
    ];

    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
          flexibleSpace: Stack(
            children: [
              Column(
                children: [
                  Container(
                    height: 120.spMin,
                    decoration: BoxDecoration(
                      color: AppColor.primary,
                      borderRadius: BorderRadius.only(
                        bottomLeft: Radius.circular(30.spMin),
                        bottomRight: Radius.circular(30.spMin),
                      ),
                    ),
                  ),
                  Container(
                    height: 80.spMin,
                    width: double.infinity,
                    color: AppColor.white,
                  )
                ],
              ),
              Container(
                alignment: Alignment.center,
                margin: EdgeInsets.only(top: 50.spMin),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Container(
                      height: 90.spMin,
                      width: 90.spMin,
                      margin: EdgeInsets.only(bottom: 5.spMin),
                      decoration: BoxDecoration(
                          color: AppColor.breaker,
                          image: controller.myServices.box
                                      .read('user')['user_image'] ==
                                  ''
                              ? const DecorationImage(
                                  image: AssetImage(AppImage.image))
                              : DecorationImage(
                                  fit: BoxFit.cover,
                                  image: NetworkImage(
                                      "${AppLink.upload}personalImages/${controller.myServices.box.read('user')['user_image']}")),
                          borderRadius: BorderRadius.circular(90.spMin)),
                    ),
                    Text(
                      controller.myServices.box.read('user')['user_name'],
                      style: Theme.of(context)
                          .textTheme
                          .displayMedium!
                          .copyWith(fontWeight: FontWeight.w600),
                    )
                  ],
                ),
              ),
              Positioned(
                  top: 10.spMin,
                  right: 10.spMin,
                  child: InkWell(
                    onTap: () {
                      showDialog(
                        context: context,
                        builder: (context) {
                          return AlertDialog(
                            title: SvgPicture.asset(
                              AppImage.question,
                              height: 35,
                              width: 35,
                            ),
                            content: Text(
                              '41'.tr,
                              textAlign: TextAlign.center,
                              style: Theme.of(context).textTheme.displayMedium,
                            ),
                            actions: [
                              Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Get.back();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.spMin,
                                          vertical: 8.spMin),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        color: AppColor.primary,
                                        border: Border.all(
                                          color: AppColor.primary,
                                        ),
                                      ),
                                      child: Text(
                                        '43'.tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      controller.logOut();
                                    },
                                    child: Container(
                                      padding: EdgeInsets.symmetric(
                                          horizontal: 16.spMin,
                                          vertical: 8.spMin),
                                      decoration: BoxDecoration(
                                        borderRadius:
                                            BorderRadius.circular(10.r),
                                        border: Border.all(
                                          color: AppColor.primary,
                                        ),
                                      ),
                                      child: Text(
                                        '42'.tr,
                                        style: Theme.of(context)
                                            .textTheme
                                            .displayMedium,
                                      ),
                                    ),
                                  )
                                ],
                              )
                            ],
                          );
                        },
                      );
                    },
                    child: CircleAvatar(
                      backgroundColor: AppColor.breaker,
                      maxRadius: 20.spMin,
                      child: SvgPicture.asset(AppImage.logout),
                    ),
                  )),
            ],
          ),
          toolbarHeight: 201.spMin,
        ),
        body: Container(
            margin: EdgeInsets.all(10.spMin),
            height: double.infinity,
            width: double.infinity,
            child: ListView(
              children: [
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: morePagesList.length,
                  itemBuilder: (context, index) {
                    return MorePagesBar(
                      name: morePagesList[index].name,
                      widget: morePagesList[index].widget,
                      route: morePagesList[index].route,
                    );
                  },
                ),
                Container(
                  height: 1,
                  width: double.infinity,
                  color: AppColor.black,
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const NeverScrollableScrollPhysics(),
                  itemCount: morePagesList2.length,
                  itemBuilder: (context, index) {
                    return MorePagesBar(
                      name: morePagesList2[index].name,
                      widget: morePagesList2[index].widget,
                      route: morePagesList2[index].route,
                    );
                  },
                ),
              ],
            )),
        bottomNavigationBar: const BNB(),
      ),
    );
  }
}

class MorePagesBar extends StatelessWidget {
  const MorePagesBar({
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
