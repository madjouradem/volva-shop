import 'package:ecommerce_app/core/calsses/Requests.dart';
import 'package:ecommerce_app/core/constant/AppLinkes.dart';

class EditProfileData extends Crud {
  changeUsername(String userId, username) async {
    var response = await postRequest(
        AppLink.changeUsername, {'user_id': userId, 'user_name': username});
    return response.fold((l) => l, (r) => r);
  }

  changePassword(String userId, password) async {
    var response = await postRequest(
        AppLink.changePassword, {'user_id': userId, 'user_password': password});
    return response.fold((l) => l, (r) => r);
  }

  changeImage(String userId, imageName) async {
    var response = await postRequest(
        AppLink.changeImage, {'user_id': userId, 'user_image': imageName});
    return response.fold((l) => l, (r) => r);
  }
}
