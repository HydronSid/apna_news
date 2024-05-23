import 'package:shared_preferences/shared_preferences.dart';

const country = "COUNTRY";
const language = "LANGUAGE";

class LocalPreferences {
  Future setCountry(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(country, val);
  }

  Future<String?> getCountry() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(country);
  }

  // ----------------------------------------------------------------------
  Future setLanguage(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(language, val);
  }

  Future<String?> getLanguage() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(language);
  }

  // ----------------------------------------------------------------------
}
