import 'package:apna_news/Controllers/view_top_headlines_controller.dart';
import 'package:apna_news/Utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Components/top_category.dart';

class ViewAllHeadLines extends StatefulWidget {
  const ViewAllHeadLines({super.key});

  @override
  State<ViewAllHeadLines> createState() => _ViewAllHeadLinesState();
}

class _ViewAllHeadLinesState extends State<ViewAllHeadLines> {
  final controller = Get.put(ViewTopHeadlinesController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        iconTheme: const IconThemeData(color: txtColor),
        title: Text(
          "Top HeadLines",
          style:
              GoogleFonts.poppins(color: txtColor, fontWeight: FontWeight.w500),
        ),
      ),
      body: CustomScrollView(
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(
              height: 10,
            ),
            const HeadLineHorizontalCategory(),
          ]))
        ],
      ),
    );
  }
}
