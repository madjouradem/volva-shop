import 'dart:convert';
import 'dart:io';
import 'package:path/path.dart';

import 'package:dartz/dartz.dart';
import 'package:http/http.dart' as http;

import '../functions/checkInternet.dart';
import 'StatusRequest.dart';

class Crud {
  Future<Either<StatusRequest, Map>> postRequest(String linkurl, Map data,
      {Map<String, String>? headers}) async {
    if (await checkInternet()) {
      var response =
          await http.post(Uri.parse(linkurl), body: data, headers: headers);
      // print(response.body);
      if (response.statusCode == 200 || response.statusCode == 201) {
        Map responsebody = jsonDecode(response.body);
        return Right(responsebody);
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offline);
    }
  }

  Future<Either<StatusRequest, Map>> postRequestWithFile(String url, File file,
      {Map? data}) async {
    if (await checkInternet()) {
      var requestTypeLink = http.MultipartRequest('POST', Uri.parse(url));
      //for file
      var fileLength = await file.length();
      var fileStream = http.ByteStream(file.openRead());
      var multiPartFile = http.MultipartFile('file', fileStream, fileLength,
          filename: basename(file.path));
      // requestTypeLink.headers.addAll(myheaders);
      requestTypeLink.files.add(multiPartFile);
      if (data != null) {
        data.forEach((key, value) {
          requestTypeLink.fields[key] = value;
        });
      }

      var requestSend = await requestTypeLink.send();
      var response = await http.Response.fromStream(requestSend);
      if (requestSend.statusCode == 200 || requestSend.statusCode == 201) {
        return Right(jsonDecode(response.body));
      } else {
        return const Left(StatusRequest.serverfailure);
      }
    } else {
      return const Left(StatusRequest.offline);
    }
  }
}
