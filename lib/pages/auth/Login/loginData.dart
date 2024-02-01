import '../../../../../core/calsses/Requests.dart';
import '../../../../../core/constant/AppLinkes.dart';

class LoginData extends Crud {
  postdata(String email, String password) async {
    print(password);
    var response = await postRequest(
        AppLink.login, {"email": email, "password": password});
    return response.fold((l) => l, (r) => r);
  }
}
