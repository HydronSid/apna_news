import 'package:apna_news/Controllers/view_top_headlines_controller.dart';
import 'package:apna_news/Utils/appcolors.dart';
import 'package:apna_news/Utils/appconstants.dart';
import 'package:apna_news/Utils/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HeadLineHorizontalCategory extends StatelessWidget {
  const HeadLineHorizontalCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    ViewTopHeadlinesController controller = Get.find();
    return SizedBox(
      height: 60,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        child: ListView.separated(
            padding: const EdgeInsets.only(left: 10, right: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var data = AppConstants.categoryList[index];
              return InkWell(
                  onTap: () => controller.changeSelectedIndex(index, data),
                  child: Obx(
                    () => Card(
                      elevation: 3,
                      margin: const EdgeInsets.only(bottom: 5),
                      color: (controller.selectedIndex.value == index)
                          ? primaryColor
                          : CommonFunctions().themeIsDark()
                              ? blackColor
                              : Colors.white,
                      shape: RoundedRectangleBorder(
                          side: BorderSide(
                              width: (controller.selectedIndex.value == index)
                                  ? 1.5
                                  : 0.7,
                              color: (controller.selectedIndex.value == index)
                                  ? primaryColor
                                  : CommonFunctions().themeIsDark()
                                      ? whiteColor
                                      : borderColor),
                          borderRadius: BorderRadius.circular(10)),
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 12.0, vertical: 10.0),
                        child: Row(
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            SvgPicture.asset(
                              data.catImage,
                              height: 20,
                              color: (controller.selectedIndex.value == index)
                                  ? whiteColor
                                  : CommonFunctions().themeIsDark()
                                      ? whiteColor
                                      : txtColor,
                            ),
                            const SizedBox(
                              width: 10,
                            ),
                            Text(
                              data.catName,
                              textAlign: TextAlign.center,
                              style: GoogleFonts.nunito(
                                fontWeight: FontWeight.bold,
                                color: (controller.selectedIndex.value == index)
                                    ? whiteColor
                                    : CommonFunctions().themeIsDark()
                                        ? whiteColor
                                        : txtColor,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ));
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 10,
              );
            },
            itemCount: AppConstants.categoryList.length),
      ),
    );
  }
}
