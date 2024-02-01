import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/pages/Home/HomeController.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';

class DiscoutWidget extends GetView<HomeCtr> {
  const DiscoutWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 170,
      child: PageView.builder(
        itemCount: controller.settingsList.length,
        itemBuilder: (ctx, index) => Container(
          margin: EdgeInsets.only(
            top: 10.h,
            left: 10.h,
            right: 10.h,
          ),
          height: 150.h,
          width: double.infinity,
          decoration: BoxDecoration(
              image: controller.settingsList[index].settingsCardImage == null
                  ? null
                  : const DecorationImage(
                      image: NetworkImage(
                        'https://img.freepik.com/free-psd/special-deal-super-offer-upto-60-parcent-off-isolated-3d-render-with-editable-text_47987-15330.jpg?w=900&t=st=1699715734~exp=1699716334~hmac=abbd3ce0bc30080eeff2b6324a8a6940a5eb170dfe1cb2b21592151ef40f2502',
                      ),
                      fit: BoxFit.fill),
              borderRadius: BorderRadius.circular(10),
              color: AppColor.primary),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Container(
                padding: EdgeInsets.all(20.spMin),
                // height: 60,
                width: 120,
                child: controller.settingsList[index].settingsCardTitle == null
                    ? null
                    : Text(
                        'Title',
                        style: Theme.of(context)
                            .textTheme
                            .displayLarge!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
              ),
              Container(
                padding: EdgeInsets.all(20.spMin),
                // height: 60,
                width: 120,
                child: controller.settingsList[index].settingsCardBody == null
                    ? null
                    : Text(
                        'Body',
                        style: Theme.of(context)
                            .textTheme
                            .displayMedium!
                            .copyWith(fontWeight: FontWeight.bold),
                      ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
