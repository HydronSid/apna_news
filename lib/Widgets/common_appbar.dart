import 'package:apna_news/Utils/appcolors.dart';
import 'package:apna_news/Utils/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class CommonAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;

  const CommonAppBar({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return Obx(() {
      return AppBar(
        elevation: 0,
        backgroundColor:
            CommonFunctions().themeIsDark() ? blackColor : whiteColor,
        iconTheme: IconThemeData(
            color: CommonFunctions().themeIsDark() ? whiteColor : txtColor),
        title: Text(
          title,
          style: GoogleFonts.poppins(
              color: CommonFunctions().themeIsDark() ? whiteColor : txtColor,
              fontWeight: FontWeight.w500),
        ),
      );
    });
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}
