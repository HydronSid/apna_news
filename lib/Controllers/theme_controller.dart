import 'package:apna_news/Utils/appcolors.dart';
import 'package:apna_news/Utils/local_shared_preferences.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

class ThemeController extends GetxController {
  // Observable variable for the theme mode
  RxBool isDarkMode = false.obs;

  @override
  void onInit() {
    super.onInit();
    loadTheme();
  }

  void loadTheme() async {
    isDarkMode.value = await LocalPreferences().getisDarkMode() ?? false;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    updateTheme();
  }

  void saveTheme(bool isDarkMode) async {
    await LocalPreferences().isDarkMode(isDarkMode);
  }

  void updateTheme() {
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    SystemChrome.setSystemUIOverlayStyle(
      SystemUiOverlayStyle(
        statusBarColor: isDarkMode.value ? blackColor : Colors.white,
        statusBarIconBrightness:
            isDarkMode.value ? Brightness.light : Brightness.dark,
      ),
    );
    saveTheme(isDarkMode.value);
  }

  void toggleTheme() {
    isDarkMode.value = !isDarkMode.value;
    Get.changeThemeMode(isDarkMode.value ? ThemeMode.dark : ThemeMode.light);
    saveTheme(isDarkMode.value);
  }

  // Optional: Load the saved theme from persistent storage if needed
  // For example, using GetStorage or SharedPreferences
}
