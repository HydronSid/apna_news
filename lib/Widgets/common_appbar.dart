import 'package:apna_news/Utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

AppBar commonAppBar({required String title}) {
  return AppBar(
    elevation: 0,
    backgroundColor: whiteColor,
    iconTheme: const IconThemeData(color: txtColor),
    title: Text(
      title,
      style: GoogleFonts.poppins(color: txtColor, fontWeight: FontWeight.w500),
    ),
  );
}
