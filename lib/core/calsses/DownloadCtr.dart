// ignore_for_file: file_names

import 'dart:io';

import 'package:dio/dio.dart';
import 'package:get/get.dart';
import 'package:path_provider/path_provider.dart';

import '../constant/AppLinkes.dart';

class FileCtr extends GetxController {
  late String filename;
  late String fileUrl;

  Dio dio = Dio();
  double progress = 0.0;
  String filepath = '';
  bool isFull = false;

  // @override
  // void onInit() {

  //   openFile(fileUrl);

  //   super.onInit();
  // }

  Future<String> downloadAndSaveFileTemporary(url, filename) async {
    final directory = await getTemporaryDirectory();
    final file = File('${directory.path}/$filename');
    await dio.download(
      url,
      file.path,
      deleteOnError: true,
      onReceiveProgress: ((count, total) {
        progress = count / total;
        update();
      }),
    );
    return file.path;
  }

  Future<String> downloadAndSaveFile(url, filename, {type}) async {
    // final directory = await getDownloadsDirectory();
    String dir = await getdirpath(filename, type: type);
    File savedFile = File(dir);
    print(url);
    await dio.download(
      url,
      savedFile.path,
      deleteOnError: true,
      onReceiveProgress: ((count, total) {
        progress = count / total;
        update();
      }),
    );
    return savedFile.path;
  }

  getdirpath(fileName, {type}) async {
    if (type == null) {
      Directory? dir = await getTemporaryDirectory();

      print(dir.path);
      return "${dir.path}/$fileName";
    } else if (type == 'file') {
      Directory? dir = await getApplicationDocumentsDirectory();
      // String newPath = "";
      // List<String> folders = dir.path.split("/");
      // for (int x = 1; x < folders.length; x++) {
      //   String folder = folders[x];
      //   if (folder != "Android") {
      //     newPath += "/$folder";
      //   } else {
      //     break;
      //   }
      // }
      // newPath += "/Download/UniChat";
      // dir = Directory(newPath);
      print(dir.path);
      return "${dir.path}/$fileName";
    } else {
      Directory? dir = await getExternalStorageDirectory();
      String newPath = "";
      List<String> folders = dir!.path.split("/");
      for (int x = 1; x < folders.length; x++) {
        String folder = folders[x];
        if (folder != "Android") {
          newPath += "/$folder";
        } else {
          break;
        }
      }
      newPath += "/Download/UniChat";
      dir = Directory(newPath);
      print(dir.path);
      return "${dir.path}/$fileName";
    }
  }

  openFile(filename) async {
    fileUrl = "${AppLink.upload}$filename";
    print(fileUrl);
    filepath = await downloadAndSaveFile(fileUrl, filename);
    print(filepath);
    // await OpenFilex.open(filepath);
  }
}
