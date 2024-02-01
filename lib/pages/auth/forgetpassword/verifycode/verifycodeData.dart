import '../../../../../../core/calsses/Requests.dart';
import '../../../../../../core/constant/AppLinkes.dart';

class VerifyCodeForgetPasswordData extends Crud {
  postdata(String email, String verifycode) async {
    var response = await postRequest(AppLink.verifycodeforgetpassword,
        {"email": email, "verfiycode": verifycode});
    return response.fold((l) => l, (r) => r);
  }
}
