import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferenceHelper {
  static SharedPreferenceHelper? _instance;
  static SharedPreferences? _sharedPref;

  factory SharedPreferenceHelper()
  {
    //_instance=SharedPreferenceHelper();
      //_instance ??= SharedPreferenceHelper();
     print("instance called");
     setInstance();
  return _instance!;
  }

  static void setInstance()  async{
    print("setinstance called");
    _sharedPref = await SharedPreferences.getInstance();
  }

  static void insertStringValue(String key, String value) async {
    _sharedPref=await SharedPreferences.getInstance();
    var isSuccess=await _sharedPref?.setString(key, value);
    print("is insert success $isSuccess");
  }

  static Future<String> getStringValue(String key) async {
    _sharedPref=await SharedPreferences.getInstance();
    var ob=await _sharedPref?.getString(key);
    print("is getstring $ob");
    return ob.toString();
  }
}
