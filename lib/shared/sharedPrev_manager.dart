import 'package:shared_preferences/shared_preferences.dart';

class SharedPreferencesManager {
  static const String IS_FRESHLY_INSTALLED_PREFERENCE_KEY = "is_freshly_installed";
  SharedPreferencesManager();

  Future<bool> isFreshInstalled() async {
    var pref = await SharedPreferences.getInstance();

    bool? isFreshlyInstalled = pref.getBool(IS_FRESHLY_INSTALLED_PREFERENCE_KEY);
    if (isFreshlyInstalled == null) {
      return await pref.setBool(IS_FRESHLY_INSTALLED_PREFERENCE_KEY, false);
    } else {
      return isFreshlyInstalled;
    }
  }

  ///Add Value
  Future addStringValue(String key, String value) async {
    print("add String value to shared");

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setString(key, value);
  }

  Future addIntValue(String key, int value) async {
    print("add Int value to shared");

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setInt(key, value);
  }

  Future addBooleanValue(String key, bool value) async {
    print("add Boolean value to shared");

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setBool(key, value);
  }

  Future addDoubleValue(String key, double value) async {
    print("add Double value to shared");

    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.setDouble(key, value);
  }

  ///Read Value
  Future<String?> readStringValue(String key) async {
    print("read String value");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    String? value = sharedPreferences.getString(key);
    return value;
  }

  Future<bool?> readBoolValue(String key) async {
    print("read Bool value");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool? value = sharedPreferences.getBool(key);
    return value;
  }

  Future<double?> readDoubleValue(String key) async {
    print("read Double value");
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    double? value = sharedPreferences.getDouble(key);
    return value;
  }

  ///Delete Value
  removeValues(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    sharedPreferences.remove(key);
  }

  ///Check value
  Future<bool> checkValue(String key) async {
    SharedPreferences sharedPreferences = await SharedPreferences.getInstance();
    bool status = sharedPreferences.containsKey(key);
    return status;
  }
}
