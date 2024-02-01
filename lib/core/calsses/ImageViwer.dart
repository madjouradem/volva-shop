import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ImageViwer extends StatelessWidget {
  const ImageViwer({super.key, this.image});

  final Widget? image;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: InteractiveViewer(
        panEnabled: true,
        minScale: 0.3,
        maxScale: 5,
        child: SizedBox(
          height: double.infinity,
          width: double.infinity,
          child: Center(
            child: Get.arguments['image'],
          ),
        ),
      ),
    );
  }
}
