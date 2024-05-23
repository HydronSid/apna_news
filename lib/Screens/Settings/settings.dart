import 'package:apna_news/Controllers/settings_controller.dart';
import 'package:apna_news/Utils/appconstants.dart';
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

  @override
  void dispose() {
    Get.delete<SettingsController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: commonAppBar(title: "Settings"),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              Obx(() {
                return Wrap(
                  // list of length 3
                  children: List.generate(
                    AppConstants().languageNameList.length,
                    (int index) {
                      // choice chip allow us to
                      // set its properties.
                      return ChoiceChip(
                        padding: const EdgeInsets.all(8),
                        label: Text('Item $index'),
                        // color of selected chip
                        selectedColor: Colors.green,
                        // selected chip value
                        selected: controller.selectedValue.value == index,
                        // onselected method
                        onSelected: (bool selected) {
                          // setState(() {
                          //   _value = selected ? index : null;
                          // });
                        },
                      );
                    },
                  ).toList(),
                );
              }),
              Row(
                children: [
                  Text(
                    "Select Language",
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500, letterSpacing: 0.5),
                  ),
                ],
              )
            ],
          ),
        ),
      ),
    );
  }
}
