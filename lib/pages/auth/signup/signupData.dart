import '../../../../../core/calsses/Requests.dart';
import '../../../../../core/constant/AppLinkes.dart';

class SignupData extends Crud {
  postdata(String username, String password, String email) async {
    var response = await postRequest(AppLink.signup, {
      "username": username,
      "password": password,
      "email": email,
    });
    return response.fold((l) => l, (r) => r);
  }
}
