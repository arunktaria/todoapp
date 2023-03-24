import 'package:get/get.dart';

import 'SharedPreferenceHelper.dart';

class LoginEventController extends GetxController{
  final email=false.obs;
  void validateEmailGetx(emailtxt){
    final bool emailValid = RegExp(r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(emailtxt);
    print("login controller email"+emailValid.toString());
    email(emailValid);
  }

  final psswd=false.obs;
  void validatePasswordGetx(psswdTxt){
    final bool psswdValid = RegExp(r"^(?=.*?[A-Z])(?=.*?[a-z])(?=.*?[0-9])(?=.*?[!@#\$&*~]).{8,}$")
        .hasMatch(psswdTxt);
    psswd(psswdValid);
  }

  final emailSharedPref="".obs;
  void insertUserData(String email)
  {
    SharedPreferenceHelper.insertStringValue("email",email);
  }

  Future<String> getUserEmail()async
  {
    var ob=await SharedPreferenceHelper.getStringValue("email");
    print("eventcontroller getemail ob $ob");
    return ob.toString();
  }

}
