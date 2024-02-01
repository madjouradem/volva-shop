import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

import '../constant/AppImage.dart';
import 'StatusRequest.dart';

class HandlingDataView extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget child;
  const HandlingDataView(
      {Key? key, required this.statusRequest, required this.child})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppImage.loading, width: 250, height: 250))
        : statusRequest == StatusRequest.offline
            ? Center(
                child: Lottie.asset(AppImage.offline, width: 250, height: 250))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child:
                        Lottie.asset(AppImage.server, width: 250, height: 250))
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(AppImage.noData,
                            width: 250, height: 250, repeat: true))
                    : child;
  }
}

class HandlingDataRequest extends StatelessWidget {
  final StatusRequest statusRequest;
  final Widget widget;
  const HandlingDataRequest(
      {Key? key, required this.statusRequest, required this.widget})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return statusRequest == StatusRequest.loading
        ? Center(child: Lottie.asset(AppImage.loading, width: 250, height: 250))
        : statusRequest == StatusRequest.offline
            ? Center(
                child: Lottie.asset(AppImage.offline, width: 250, height: 250))
            : statusRequest == StatusRequest.serverfailure
                ? Center(
                    child:
                        Lottie.asset(AppImage.server, width: 250, height: 250))
                : statusRequest == StatusRequest.failure
                    ? Center(
                        child: Lottie.asset(AppImage.noData,
                            width: 250, height: 250))
                    : widget;
  }
}
