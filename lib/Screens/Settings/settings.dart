import 'package:apna_news/Controllers/settings_controller.dart';
import 'package:apna_news/Controllers/theme_controller.dart';
import 'package:apna_news/Utils/appcolors.dart';
import 'package:apna_news/Utils/appconstants.dart';
import 'package:apna_news/Utils/common_functions.dart';
import 'package:apna_news/Widgets/common_appbar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final controller = Get.put(SettingsController());
  ThemeController themeController = Get.find();

  @override
  void dispose() {
    Get.delete<SettingsController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "Settings"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Text(
                "Select Language",
                style: GoogleFonts.poppins(
                    fontWeight: FontWeight.w500, letterSpacing: 0.5),
              ),
              Obx(() {
                return Wrap(
                  spacing: 8.0,
                  children: AppConstants().languageList.map((language) {
                    return ChoiceChip(
                      label: Text(
                        language.launguage,
                        style: GoogleFonts.poppins(
                            color: controller.selectedLanguage.value ==
                                    language.launguage
                                ? whiteColor
                                : CommonFunctions().themeIsDark()
                                    ? whiteColor
                                    : blackColor),
                      ),
                      selectedColor: primaryColor,
                      selected: controller.selectedLanguage.value ==
                          language.launguage,
                      onSelected: (bool selected) {
                        if (selected) {
                          controller.changeSelectedValue(language.launguage);
                        }
                      },
                    );
                  }).toList(),
                );
              }),
              Obx(() {
                return SwitchListTile(
                  title: const Text('Dark Mode'),
                  value: themeController.isDarkMode.value,
                  onChanged: (value) {
                    themeController.toggleTheme();
                  },
                );
              }),
            ],
          ),
        ),
      ),
    );
  }
}
