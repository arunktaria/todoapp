import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static SharedPreferenceHelper? _instance=SharedPreferenceHelper.initialze();
  static SharedPreferences? _sharedPref;

  factory SharedPreferenceHelper()
  {
  return _instance!;
  }

  SharedPreferenceHelper.initialze()
  {
    setInstance();
  }

   setInstance()  async{
    print("setinstance called");
    _sharedPref = await SharedPreferences.getInstance();
  }

  static void insertStringValue(String key, String value) async {
    var isSuccess=await _sharedPref?.setString(key, value);
    print("is insert success $isSuccess");
  }

  static Future<String> getStringValue(String key) async {
    var ob=await _sharedPref?.getString(key);
    print("is getstring $ob");
    return ob.toString();
  }
}
