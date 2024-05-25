import 'package:apna_news/Controllers/home_controller.dart';
import 'package:apna_news/Utils/appcolors.dart';
import 'package:apna_news/Utils/common_functions.dart';
import 'package:apna_news/Utils/route_names.dart';
import 'package:apna_news/Widgets/shimmer_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'top_headlines_component.dart';

class HorizontalListCategory extends StatelessWidget {
  final String title;

  const HorizontalListCategory({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    HomeController controller = Get.find();

    return Padding(
      padding: const EdgeInsets.only(left: 5.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.start,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          title.isEmpty
              ? const SizedBox()
              : Padding(
                  padding:
                      const EdgeInsets.only(top: 12.0, left: 10, right: 10),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text(
                        title,
                        style: GoogleFonts.poppins(
                            letterSpacing: 0.7,
                            color: CommonFunctions().themeIsDark()
                                ? whiteColor
                                : txtColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                      const SizedBox(
                        height: 5,
                      ),
                      InkWell(
                        onTap: () => Get.toNamed(RouteNames.viewAllHeadLines),
                        child: Text(
                          "view all",
                          style: GoogleFonts.poppins(
                            letterSpacing: 0.7,
                            decoration: TextDecoration.underline,
                            color: CommonFunctions().themeIsDark()
                                ? whiteColor
                                : txtColor,
                            fontWeight: FontWeight.normal,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
          Obx(
            () => SizedBox(
              child: controller.isLoading.value
                  // child: true
                  ? SizedBox(
                      height: 320,
                      child: ListView.separated(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            width: 20,
                          );
                        },
                        physics: const BouncingScrollPhysics(),
                        scrollDirection: Axis.horizontal,
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return shimmerCard();
                        },
                      ),
                    )
                  : controller.articalList.isEmpty
                      ? const SizedBox()
                      : SizedBox(
                          height: 320,
                          child: ListView.separated(
                            padding: const EdgeInsets.symmetric(horizontal: 10),
                            separatorBuilder: (context, index) {
                              return const SizedBox(
                                width: 20,
                              );
                            },
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: controller.articalList.length < 8
                                ? controller.articalList.length
                                : 8,
                            itemBuilder: (context, index) {
                              var article = controller.articalList[index];
                              return TopHeadLineComponent(
                                model: article,
                              );
                            },
                          ),
                        ),
            ),
          ),
        ],
      ),
    );
  }

  Widget shimmerCard() {
    var size = MediaQuery.of(CommonFunctions.globalContext).size;
    return Container(
      margin: const EdgeInsets.symmetric(
        horizontal: 6,
      ),
      height: 320,
      width: size.width * 0.8,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerHelper(
              height: 180,
              width: size.width * 0.8,
              borderRadius: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            const ShimmerHelper(
              height: 10,
              width: double.infinity,
              borderRadius: 10,
            ),
            const SizedBox(
              height: 10,
            ),
            const ShimmerHelper(
              height: 10,
              width: 100,
              borderRadius: 10,
            ),
          ],
        ),
      ),
    );
  }
}
