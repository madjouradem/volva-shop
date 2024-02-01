// ignore_for_file: file_names

// import 'package:dio/dio.dart';

import 'dart:io';
import 'package:dio/dio.dart' as dios;
import 'package:ecommerce_app/core/constant/AppLinkes.dart';
import 'package:get/get.dart';
import 'package:path/path.dart';

class UploadCtr extends GetxController {
  late String filename;
  late String fileUrl;
  dios.Dio dio = dios.Dio();
  double progress = 0.0;

  Future<String?> uploadFile(File file, Map data,
      {url = "${AppLink.upload}/upload.php"}) async {
    try {
      dios.Dio dio = dios.Dio();
      // File file = File('filePath');

      var formData = dios.FormData.fromMap({
        "file": await dios.MultipartFile.fromFile(file.path,
            filename: basename(file.path)),
        // "dir": dirTosave,
      });

      data.forEach((key, value) {
        formData.fields.add(
          MapEntry(key, value),
        );
      });

      var response = await dio.post(
        url,
        data: formData,
        onSendProgress: (count, total) {
          progress = count / total;
          update();
        },
      );
      print("response ;;$response");
      return response.data['name'];
    } catch (e) {
      print(e);
    }
    return '';
  }
}
