import 'package:apna_news/Controllers/home_controller.dart';
import 'package:apna_news/Screens/ViewAllHeadLines/Components/article_component.dart';
import 'package:apna_news/Utils/appcolors.dart';
import 'package:apna_news/Utils/common_functions.dart';
import 'package:apna_news/Widgets/shimmer_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class VerticalListCategory extends StatelessWidget {
  final String title;

  const VerticalListCategory({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    HomeController controller = Get.find();

    return Padding(
      padding: const EdgeInsets.only(left: 5.0, right: 5),
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
                            color: txtColor,
                            fontWeight: FontWeight.bold,
                            fontSize: 14),
                      ),
                    ],
                  ),
                ),
          const SizedBox(
            height: 10,
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
                            height: 20,
                          );
                        },
                        physics: const BouncingScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return shimmerCard();
                        },
                      ),
                    )
                  : controller.newsArticalList.isEmpty
                      ? const SizedBox()
                      : ListView.separated(
                          padding: const EdgeInsets.symmetric(horizontal: 10),
                          separatorBuilder: (context, index) {
                            return const SizedBox(
                              height: 20,
                            );
                          },
                          physics: const NeverScrollableScrollPhysics(),
                          shrinkWrap: true,
                          itemCount: controller.newsArticalList.length < 18
                              ? controller.newsArticalList.length
                              : 18,
                          itemBuilder: (context, index) {
                            var article = controller.newsArticalList[index];
                            return ArticleComponent(
                              article: article,
                            );
                          },
                        ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
          Align(
            alignment: Alignment.center,
            child: SizedBox(
              width: double.infinity,
              child: TextButton.icon(
                style: TextButton.styleFrom(
                    shape: const StadiumBorder(),
                    side: const BorderSide(color: accentColor)),
                onPressed: () {},
                icon: const Icon(Icons.add_circle_outline_sharp,
                    color: accentColor),
                label: Text('View More Items',
                    style: GoogleFonts.poppins(
                        color: accentColor,
                        fontSize: 12,
                        fontWeight: FontWeight.bold)),
              ),
            ),
          ),
          const SizedBox(
            height: 10,
          ),
        ],
      ),
    );
  }

  Widget shimmerCard() {
    var size = MediaQuery.of(CommonFunctions.globalContext).size;
    return SizedBox(
      // margin: const EdgeInsets.symmetric(
      //   horizontal: 6,
      // ),
      height: size.height * 0.15,
      width: size.width * 0.4,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ShimmerHelper(
              height: size.height * 0.15,
              width: size.width * 0.4,
              borderRadius: 10,
            ),
            const SizedBox(
              width: 10,
            ),
            Expanded(
              child: SizedBox(
                  height: size.height * 0.15,
                  width: double.infinity,
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const ShimmerHelper(
                        height: 10,
                        width: double.infinity,
                        borderRadius: 4,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const ShimmerHelper(
                        height: 10,
                        width: double.infinity,
                        borderRadius: 4,
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      const ShimmerHelper(
                        height: 10,
                        width: double.infinity,
                        borderRadius: 4,
                      ),
                      const Spacer(),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          ShimmerHelper(
                            height: 10,
                            width: size.width * 0.1,
                            borderRadius: 4,
                          ),
                          ShimmerHelper(
                            height: 10,
                            width: size.width * 0.1,
                            borderRadius: 4,
                          ),
                        ],
                      )
                    ],
                  )),
            )
          ],
        ),
      ),
    );
  }
}
