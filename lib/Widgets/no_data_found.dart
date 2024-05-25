import 'package:apna_news/Utils/images.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class NoDataFoundScreen extends StatelessWidget {
  final String passedData;
  const NoDataFoundScreen({super.key, required this.passedData});

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.bottomCenter,
      children: [
        Image.asset(Images.emptyData),
        Positioned(
          bottom: 20,
          child: Text(
            passedData,
            style: GoogleFonts.poppins(
                fontWeight: FontWeight.bold,
                color: const Color(0xFF5B358D),
                fontSize: 16),
          ),
        ),
      ],
    );
  }
}
