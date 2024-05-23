import 'package:apna_news/Utils/appcolors.dart';
import 'package:apna_news/Utils/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCustomAppBar extends StatelessWidget {
  final Widget passedWidget;
  const HomeCustomAppBar({super.key, required this.passedWidget});

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
        toolbarHeight: 40,
        automaticallyImplyLeading: false,
        pinned: false,
        floating: false,
        iconTheme: const IconThemeData(color: blackColor),
        backgroundColor: whiteColor,
        flexibleSpace: Container(
          padding: const EdgeInsets.only(
            top: 4,
            left: 8,
            right: 18,
          ),
          decoration: const BoxDecoration(
              // color: backGroundColor,
              ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  passedWidget,
                  const Spacer(),
                  InkWell(
                      onTap: () => Get.toNamed(RouteNames.settingsScreen),
                      child: const Icon(
                        Icons.settings,
                        color: txtColor,
                        size: 28,
                      )),
                ],
              ),
            ],
          ),
        ));
  }
}
