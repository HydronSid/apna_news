import 'package:apna_news/Controllers/home_controller.dart';
import 'package:apna_news/Utils/appcolors.dart';
import 'package:apna_news/Utils/common_functions.dart';
import 'package:apna_news/Utils/route_names.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeCustomAppBar extends StatelessWidget {
  final Widget passedWidget;
  const HomeCustomAppBar({super.key, required this.passedWidget});

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();

    return Obx(() => SliverAppBar(
        toolbarHeight: 40,
        automaticallyImplyLeading: false,
        pinned: false,
        floating: false,
        iconTheme: const IconThemeData(color: blackColor),
        backgroundColor:
            CommonFunctions().themeIsDark() ? blackColor : whiteColor,
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
                      onTap: () {
                        controller.selectedIndex.value = 0;
                        Get.toNamed(RouteNames.settingsScreen)!.then((value) =>
                            controller.getTopHeadLineList("general").then(
                                (value) => controller
                                    .getNewsHeadLineList("general")
                                    .then((value))));
                      },
                      child: Icon(
                        Icons.settings,
                        color: CommonFunctions().themeIsDark()
                            ? whiteColor
                            : txtColor,
                        size: 28,
                      )),
                ],
              ),
            ],
          ),
        )));
  }
}
