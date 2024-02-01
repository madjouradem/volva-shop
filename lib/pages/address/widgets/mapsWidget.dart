import 'package:ecommerce_app/core/calsses/AddressCrt.dart';
import 'package:ecommerce_app/core/constant/AppColor.dart';
import 'package:ecommerce_app/core/constant/AppRoute.dart';
import 'package:ecommerce_app/pages/addressEdit/widgets/CustomButtomAddress.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

class MapsView extends GetView<AddressCtr> {
  const MapsView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(AddressCtr());
    return SafeArea(
      child: Scaffold(
        appBar: AppBar(
          // title: const Text('My Cart'),
          // centerTitle: true,
          backgroundColor: AppColor.primary,
        ),
        body: GetBuilder<AddressCtr>(builder: (_) {
          return controller.kGooglePlex != null
              ? SizedBox(
                  height: double.infinity,
                  width: double.infinity,
                  child: GoogleMap(
                    mapType: MapType.normal,
                    markers: controller.markers.toSet(),
                    onTap: (latlng) {
                      controller.addMarker(latlng);
                    },
                    initialCameraPosition: controller.kGooglePlex!,
                    onMapCreated: (GoogleMapController googleMapController) {
                      controller.completer.complete(googleMapController);
                    },
                  ))
              : const Center(
                  child: CircularProgressIndicator(
                  color: AppColor.primary,
                ));
        }),
        floatingActionButton: GetBuilder<AddressCtr>(builder: (_) {
          return controller.kGooglePlex != null
              ? CustomButtomAddress(
                  text: 'Next',
                  onPressed: () {
                    Get.toNamed(AppRoute.addAddress, arguments: {
                      'placeInfo': {
                        'city': controller.city,
                        'street': controller.street,
                        'lat': controller.lat,
                        'lng': controller.lng
                      }
                    });
                  })
              : Container();
        }),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}
