import '../../../../../../core/calsses/Requests.dart';
import '../../../../../../core/constant/AppLinkes.dart';

class ResetPasswordData extends Crud {
  postdata(String email, String password) async {
    var response = await postRequest(
        AppLink.resetPassword, {"email": email, "password": password});
    return response.fold((l) => l, (r) => r);
  }
}
