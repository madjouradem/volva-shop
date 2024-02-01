// import 'package:geocoding/geocoding.dart';
import 'dart:async';

import 'package:ecommerce_app/core/calsses/services.dart';
import 'package:geolocator/geolocator.dart';
import 'package:geocoding/geocoding.dart';
import 'package:get/get.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:location/location.dart' as loc;

abstract class AddressCtrImp extends GetxController {
  determinePosition();
  getPosition();
  addMarker(LatLng latlng);
}

class AddressCtr extends AddressCtrImp {
  MyServices myServices = Get.find();
  List<Placemark> placemarks = [];
  Position? pos;
  double lat = 0.0;
  double lng = 0.0;
  String? city;
  String? street;
  GoogleMapController? gmc;
  final Completer<GoogleMapController> completer =
      Completer<GoogleMapController>();
  CameraPosition? kGooglePlex;
  List<Marker> markers = [];
//==========================================================================

  @override
  void onInit() {
    getPosition();
    super.onInit();
  }

  @override
  addMarker(LatLng latlng) async {
    markers.clear();
    markers.add(Marker(markerId: const MarkerId('1'), position: latlng));
    placemarks =
        await placemarkFromCoordinates(latlng.latitude, latlng.longitude);
    if (placemarks.isNotEmpty) {
      city = '${placemarks[0].administrativeArea}'
          ' ${placemarks[0].subAdministrativeArea}';
      street = placemarks[0].street;
      lat = pos!.latitude;
      lng = pos!.longitude;
    }
    update();
  }

  @override
  getPosition() async {
    pos = await determinePosition();
    placemarks = await placemarkFromCoordinates(pos!.latitude, pos!.longitude,
        localeIdentifier: "en");
    lat = pos!.latitude;
    lng = pos!.longitude;
    city = placemarks[0].administrativeArea;
    street = placemarks[0].street;

    //I use this cond to know from any route I am coming
    //when I come from orders page by clicking trak I will send OrderModel
    //as arguments and When I come from address Page by clicking add address
    //I don't sent any things
    bool isTraking = false;
    if (Get.arguments != null) {
      isTraking = true;
    }

    if (!isTraking) {
      kGooglePlex = CameraPosition(
        target: LatLng(pos!.latitude, pos!.longitude),
        zoom: 14.4746,
      );
      markers.add(
          Marker(markerId: const MarkerId('0'), position: LatLng(lat, lng)));
    }
    update();
  }

  @override
  Future<Position> determinePosition() async {
    bool serviceEnabled;
    LocationPermission permission;
    // Test if location services are enabled.
    serviceEnabled = await Geolocator.isLocationServiceEnabled();
    if (!serviceEnabled) {
      // Location services are not enabled don't continue
      // accessing the position and request users of the
      // App to enable the location services.
      loc.Location location = loc.Location();
      bool isturnedon = await location.requestService();
      if (isturnedon) {
        // print("GPS device is turned ON");
      } else {
        // print("GPS Device is still OFF");
        Get.back();
      }

      // return Future.error('Location services are disabled.');
    }
    permission = await Geolocator.checkPermission();
    if (permission == LocationPermission.denied) {
      permission = await Geolocator.requestPermission();
      if (permission == LocationPermission.denied) {
        // Permissions are denied, next time you could try
        // requesting permissions again (this is also where
        // Android's shouldShowRequestPermissionRationale
        // returned true. According to Android guidelines
        // your App should show an explanatory UI now.
        return Future.error('Location permissions are denied');
      }
    }

    if (permission == LocationPermission.deniedForever) {
      // Permissions are denied forever, handle appropriately.
      return Future.error(
          'Location permissions are permanently denied, we cannot request permissions.');
    }

    // When we reach here, permissions are granted and we can
    // continue accessing the position of the device.
    return await Geolocator.getCurrentPosition();
  }

  // @override
  setMarker(double lat, double lng, String markerId, {String? iconPath}) {
    markers.removeWhere((element) => element.markerId == MarkerId(markerId));
    markers.add(
      Marker(
        markerId: MarkerId(markerId),
        position: LatLng(
          lat,
          lng,
        ),
      ),
    );
    print('===================================......................');

    update();
  }
}
