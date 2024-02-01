// // ignore_for_file: unnecessary_null_comparison, avoid_print, must_be_immutable

// import 'package:bac/core/constant/AppColor.dart';
// import 'package:bac/core/functions/fullscreen.dart';
// import 'package:flutter/material.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:get/get.dart';
// import 'package:pdf_viewer_plugin/pdf_viewer_plugin.dart';
// import '../../controllers/AdsController/InterStitialCtr.dart';
// import '../../controllers/DownloadCtr.dart';
// import '../../controllers/pdfCtr.dart';

// class PDFVIEW extends StatelessWidget {
//   const PDFVIEW({
//     Key? key,
//   }) : super(key: key);

//   @override
//   Widget build(BuildContext context) {
//     DownloadCtr dctr = Get.put(DownloadCtr());
//     InterStitialCtr adCtr = Get.put(InterStitialCtr());
//     PdfCtr pdfCtr = Get.put(PdfCtr());

//     return SafeArea(
//       child: WillPopScope(
//         onWillPop: () {
//           adCtr.showInterstitialAd();
//           Get.back();
//           return pdfCtr.isFull == true ? pdfCtr.onTapFull() : null;
//         },
//         child: Scaffold(
//           body: GetBuilder<PdfCtr>(builder: (_) {
//             return Stack(
//               children: [
//                 pdfCtr.pdfFlePath != ''
//                     ? SizedBox(
//                         child: PdfView(
//                           path: pdfCtr.pdfFlePath,
//                         ),
//                       )
//                     : Center(
//                         child: Column(
//                           mainAxisAlignment: MainAxisAlignment.center,
//                           children: [
//                             Material(
//                               child: Container(
//                                 margin: const EdgeInsets.symmetric(
//                                   horizontal: 30,
//                                   vertical: 5,
//                                 ),
//                                 decoration: BoxDecoration(
//                                   borderRadius: BorderRadius.circular(15),
//                                 ),
//                                 child: LinearProgressIndicator(
//                                   value: pdfCtr.progress,
//                                   color: AppColor.primaryC1,
//                                 ),
//                               ),
//                             ),
//                             SizedBox(height: 10.h),
//                             Text(
//                               "الملف في طور التحميل",
//                               style: Theme.of(context).textTheme.headline2,
//                             ),
//                           ],
//                         ),
//                       ),
//                 Container(
//                   alignment: Alignment.topCenter,
//                   margin: const EdgeInsets.symmetric(horizontal: 10),
//                   width: double.infinity,
//                   child: Row(
//                     mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                     children: [
//                       pdfCtr.isFull
//                           ? const SizedBox(height: 10, width: 10)
//                           : IconButton(
//                               icon: const Icon(
//                                 Icons.arrow_back,
//                                 color: AppColor.primaryC1,
//                               ),
//                               onPressed: () {
//                                 adCtr.showInterstitialAd();
//                                 Get.back();
//                               },
//                             ),
//                       Row(
//                         children: [
//                           pdfCtr.isFull
//                               ? const SizedBox(
//                                   height: 10,
//                                   width: 10,
//                                 )
//                               : IconButton(
//                                   icon: const Icon(
//                                     Icons.download_outlined,
//                                     color: AppColor.primaryC1,
//                                   ),
//                                   onPressed: () async {
//                                     await dctr.fileDownload(
//                                       id: int.parse(pdfCtr.pdfid),
//                                       filecontent: pdfCtr.pdfcontent,
//                                       fileName: pdfCtr.pdfname,
//                                     );
//                                   },
//                                 ),
//                           IconButton(
//                             icon: Icon(
//                               pdfCtr.isFull
//                                   ? Icons.fullscreen_exit_rounded
//                                   : Icons.fullscreen_rounded,
//                               color: AppColor.primaryC1,
//                             ),
//                             onPressed: () {
//                               pdfCtr.onTapFull();
//                             },
//                           ),
//                         ],
//                       ),
//                     ],
//                   ),
//                 ),
//               ],
//             );
//           }),
//         ),
//       ),
//     );
//   }
// }
