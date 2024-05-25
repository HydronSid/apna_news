import 'package:shared_preferences/shared_preferences.dart';

const country = "COUNTRY";
const language = "LANGUAGE";
const darkMode = "ISDARKMODE";

class LocalPreferences {
  Future isDarkMode(bool val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setBool(darkMode, val);
  }

  Future<bool?> getisDarkMode() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(darkMode);
  }

  // ----------------------------------------------------------------------
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
