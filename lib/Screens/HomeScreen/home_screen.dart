import 'package:apna_news/Controllers/home_controller.dart';
import 'package:apna_news/Utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Components/category_list.dart';
import 'Components/home_custom_bar.dart';
import 'Components/horizontal_headlines.dart';
import 'Components/news_vertical_headlines.dart';
import 'Components/pinnedappbar.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  HomeController controller = Get.find();

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: SafeArea(
          child: RefreshIndicator(
        onRefresh: () async => controller.initData(),
        child: CustomScrollView(
          slivers: [
            HomeCustomAppBar(
              passedWidget: Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Text(
                  "Apna News",
                  style: GoogleFonts.poppins(
                      fontWeight: FontWeight.w500,
                      color: accentColor,
                      fontSize: size.width * 0.05),
                ),
              ),
            ),
            SliverPersistentHeader(
              pinned: true,
              floating: false,
              delegate: PinnedAppBar(),
            ),
            SliverList(
                delegate: SliverChildListDelegate([
              const SizedBox(
                height: 10,
              ),
              const HorizontalCategory(),
              const HorizontalListCategory(
                title: "Top HeadLines",
              ),
              const VerticalListCategory(
                title: "News",
              )
            ]))
          ],
        ),
      )),
    );
  }
}
