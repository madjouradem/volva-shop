import 'package:ecommerce_app/data/static/static.dart';
import 'package:ecommerce_app/pages/1component/BnbAndDrawer/BNBandDarwerCtr.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:get/get.dart';

import '../../../core/constant/AppColor.dart';

class BNB extends StatelessWidget {
  const BNB({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    BNBandDarwerCtr bnbCtr = Get.put(BNBandDarwerCtr(), permanent: true);
    return Container(
      height: 55.h,
      width: double.infinity,
      // padding: EdgeInsets.all(4.spMin),
      decoration: BoxDecoration(
          // color: Theme.of(context).primaryColor,
          borderRadius: BorderRadius.only(
              topLeft: Radius.circular(10.r), topRight: Radius.circular(10.r))),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 30.h),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...bnblist.map((e) => GestureDetector(
                  onTap: () {
                    bnbCtr.goTo(e.route);
                    bnbCtr.changeNum(e.defaultNum);
                    print('object');
                  },
                  child: GetBuilder<BNBandDarwerCtr>(builder: (_) {
                    return Container(
                      height: 45.h,
                      padding: EdgeInsets.symmetric(
                        horizontal: 10.spMin,
                      ),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.r),
                        color: bnbCtr.currentNum.isEqual(e.defaultNum)
                            ? AppColor.primary
                            : Colors.transparent,
                      ),
                      child: Container(
                        padding: EdgeInsets.symmetric(horizontal: 3.spMin),
                        child: SvgPicture.asset(e.icon),
                      ),
                    );
                  }),
                )),
          ],
        ),
      ),
    );
  }
//  Row(
//         mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//         children: [
//           ...bnblist.map((e) => GestureDetector(
//                 onTap: () {
//                   bnbCtr.goTo(e.route);
//                   bnbCtr.changeNum(e.defaultNum);
//                 },
//                 child: GetBuilder<BNBandDarwerCtr>(builder: (_) {
//                   return Container(
//                     height: 50.h,
//                     // width: 150.w,
//                     padding: EdgeInsets.symmetric(horizontal: 5.spMin),
//                     margin: EdgeInsets.symmetric(horizontal: 5.spMin),
//                     decoration: BoxDecoration(
//                       borderRadius: BorderRadius.circular(30.r),
//                       color: bnbCtr.currentNum.isEqual(e.defaultNum)
//                           ? AppColor.primaryC1.withOpacity(0.4)
//                           : AppColor.primaryC1.withOpacity(0.2),
//                     ),
//                     child: Row(
//                       mainAxisAlignment: MainAxisAlignment.spaceEvenly,
//                       children: [
//                         SvgPicture.asset(e.icon),
//                         SizedBox(width: 5.spMin),
//                         // SizedBox(
//                         //   child: Text(
//                         //     e.name,
//                         //     textAlign: TextAlign.center,
//                         //     style: Theme.of(context).textTheme.displayMedium,
//                         //   ),
//                         // ),
//                       ],
//                     ),
//                   );
//                 }),
//               )),
//         ],
//       ),
//   buildAnimatedIcon({
//     required BuildContext ctx,
//     required String path,
//     required String text,
//     required int defaultNum,
//     required Widget page,
//     required int numofPage,
//   }) {
//     return GestureDetector(
//       onTap: () {
//         Get.offAll(page);
//       },
//       child: Container(
//         height: 40.h,
//         padding: EdgeInsets.symmetric(horizontal: 10.h),
//         decoration: BoxDecoration(
//           borderRadius: BorderRadius.circular(15.r),
//           color: numofPage.isEqual(defaultNum)
//               ? AppColor.primaryC1.withOpacity(0.2)
//               : Colors.transparent,
//         ),
//         child: Row(
//           mainAxisAlignment: MainAxisAlignment.spaceBetween,
//           children: [
//             Padding(
//               padding: numofPage.isEqual(defaultNum)
//                   ? EdgeInsets.only(right: 8.h)
//                   : const EdgeInsets.only(right: 0),
//               child: SvgPicture.asset(path),
//             ),
//             numofPage.isEqual(defaultNum)
//                 ? Padding(
//                     padding: EdgeInsets.only(top: 4.h),
//                     child: Text(text, textAlign: TextAlign.center),
//                   )
//                 : Container(),
//           ],
//         ),
//       ),
//     );
//   }
}
