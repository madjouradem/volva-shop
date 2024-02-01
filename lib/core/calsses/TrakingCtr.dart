import 'dart:async';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:ecommerce_app/core/calsses/AddressCrt.dart';
import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:ecommerce_app/core/constant/AppImage.dart';
import 'package:ecommerce_app/data/models/OrderModel.dart';
import 'package:flutter/painting.dart';
import 'package:geolocator/geolocator.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';

abstract class TrakingCtrImp extends GetxController {
  setMarker(double lat, double lng, String markerId, {BitmapDescriptor? icon});
  customMarkerIcon(String iconPath);
}

class TrakingCtr extends TrakingCtrImp {
  late double endLat;
  late double endLng;
  MyServices myServices = Get.find();
  AddressCtr addressCtr = Get.find();
  Set<Polyline> polylineSet = {};
  StreamSubscription<Position>? positionStream;
  late OrderModel orderModel;
  BitmapDescriptor? customIcon;

  @override
  void onInit() {
    orderModel = Get.arguments['orderModel'];
    customMarkerIcon(AppImage.markerDelivery);
    getPositionsStream();
    super.onInit();
  }

  //get position stream
  getPositionsStream() async {
    //used for addressCtr.kGooglePlex
    bool isCameraControlled = false;
    FirebaseFirestore.instance
        .collection('delivery')
        .doc(orderModel.orderId)
        .snapshots()
        .listen((event) {
      //it work's just the first one
      if (!isCameraControlled) {
        isCameraControlled = true;
        addressCtr.kGooglePlex = CameraPosition(
          target: LatLng(event.get('lat'), event.get('lng')),
          zoom: 14.4746,
        );
      }
      setMarker(double.parse(orderModel.addressLat!),
          double.parse(orderModel.addressLng!), 'orderAddress');
      setMarker(event.get('lat'), event.get('lng'), 'deliveryAddress',
          icon: customIcon);
    });
  }

  @override
  setMarker(double lat, double lng, String markerId, {BitmapDescriptor? icon}) {
    addressCtr.markers
        .removeWhere((element) => element.markerId == MarkerId(markerId));
    addressCtr.markers.add(
      Marker(
        markerId: MarkerId(markerId),
        position: LatLng(
          lat,
          lng,
        ),
        icon: icon ?? BitmapDescriptor.defaultMarker,
      ),
    );
    addressCtr.update();
  }

  @override
  customMarkerIcon(String iconPath) async {
    BitmapDescriptor.fromAssetImage(
            const ImageConfiguration(size: Size(50, 50)), iconPath)
        .then((icon) {
      customIcon = icon;
      update();
    });
  }
}
