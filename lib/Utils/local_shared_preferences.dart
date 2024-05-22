import 'package:shared_preferences/shared_preferences.dart';

const selectedCountry = "SELECTEDCOUNTRY";

class LocalPreferences {
  Future setCountry(String val) async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    prefs.setString(selectedCountry, val);
  }

  Future<String?> getCountry() async {
    SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getString(selectedCountry);
  }

  // ----------------------------------------------------------------------
}
