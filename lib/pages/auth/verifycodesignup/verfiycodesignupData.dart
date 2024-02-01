import '../../../../../core/calsses/Requests.dart';
import '../../../../../core/constant/AppLinkes.dart';

class VerfiyCodeSignUpData extends Crud {
  postdata(String email, String verifycode) async {
    print('e.ail ===== $email');
    print('code ===== $verifycode');
    var response = await postRequest(
        AppLink.verifycodessignup, {"email": email, "verfiycode": verifycode});
    return response.fold((l) => l, (r) => r);
  }
}
