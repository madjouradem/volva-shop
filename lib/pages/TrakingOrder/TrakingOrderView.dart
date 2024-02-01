import 'package:ecommerce_app/core/calsses/AddressCrt.dart';
import 'package:ecommerce_app/core/calsses/TrakingCtr.dart';
import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/pages/TrakingOrder/widgets/ButtomSheetInfo.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class TrakingOrder extends GetView<AddressCtr> {
  const TrakingOrder({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressCtr());
    // work when the user want to trak
    // if (controller.myServices.box.read('isTrak') != null) {
    //   if (controller.myServices.box.read('isTrak') == '1') {
    Get.put(TrakingCtr());
    //   }
    // }
    return SafeArea(
      child: Scaffold(
          // extendBodyBehindAppBar: true,
          // appBar: AppBar(
          //   backgroundColor: Colors.transparent,
          //   leading:
          // ),

          body: Stack(
        children: [
          LayoutBuilder(
            builder: (context, constraints) => SizedBox(
              height: constraints.maxHeight,
              child: GetBuilder<AddressCtr>(builder: (_) {
                return controller.kGooglePlex != null
                    ? GoogleMap(
                        mapType: MapType.normal,
                        myLocationEnabled: true,
                        markers: controller.markers.toSet(),
                        onTap: (latlng) {
                          controller.addMarker(latlng);
                        },
                        initialCameraPosition: controller.kGooglePlex!,
                        onMapCreated:
                            (GoogleMapController googleMapController) {
                          // controller.completer.complete(googleMapController);
                          controller.gmc = googleMapController;
                        },
                      )
                    : const Center(
                        child: CircularProgressIndicator(
                        color: AppColor.primary,
                      ));
              }),
            ),
          ),
          Positioned(
            top: 10.spMin,
            left: 5.spMin,
            child: InkWell(
              onTap: () {
                Get.back();
              },
              child: Container(
                // margin: EdgeInsets.all(5.spMin),
                child: CircleAvatar(
                  backgroundColor: AppColor.primary,
                  child: Icon(
                    Icons.arrow_back,
                    color: Theme.of(context).primaryColor,
                  ),
                ),
              ),
            ),
          ),
          MapDraggableScrollableSheet(controller: controller)
        ],
      )),
    );
  }
}
