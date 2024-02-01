import 'package:get/get.dart';

validInput(String val, int min, int max, String type) {
  if (type == "username") {
    if (val.isEmpty) {
      return "can't be Empty";
    }

    if (val.length < min) {
      return "can't be less than $min";
    }

    if (val.length > max) {
      return "can't be larger than $max";
    }
  }

  // if (type == "passwor") {
  //   if (!GetUtils.isEmail(val)) {
  //     return "not valid email";
  //   }
  // }

  if (type == "number") {
    if (!GetUtils.isNum(val)) {
      return "not valid value";
    }
  }

  if (val.isEmpty) {
    return "can't be Empty";
  }

  if (val.length < min) {
    return "can't be less than $min";
  }

  if (val.length > max) {
    return "can't be larger than $max";
  }
}

validInputPassword(
  String pass,
  String pass2,
  int min,
  int max,
) {
  if (pass.isEmpty) {
    return "can't be Empty";
  }
  if (pass != pass2) {
    return "incorrect password";
  }

  if (pass.length < min) {
    return "can't be less than $min";
  }

  if (pass.length > max) {
    return "can't be larger than $max";
  }
}
