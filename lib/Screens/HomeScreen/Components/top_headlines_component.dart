import 'package:apna_news/Models/top_headline_model.dart';
import 'package:apna_news/Utils/appcolors.dart';
import 'package:apna_news/Utils/common_functions.dart';
import 'package:apna_news/Utils/route_names.dart';
import 'package:apna_news/Widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'package:intl/intl.dart';

class TopHeadLineComponent extends StatelessWidget {
  final ArticleModel model;
  const TopHeadLineComponent({super.key, required this.model});

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('MMMM dd, yyyy');
    var size = MediaQuery.of(context).size;
    DateTime dateTime = DateTime.parse(model.publishedAt.toString());
    return SizedBox(
      height: 320,
      width: size.width * 0.8,
      child: Card(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(12)),
        margin: const EdgeInsets.symmetric(vertical: 10),
        elevation: 4,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.bottomCenter,
              children: [
                SizedBox(
                  height: 180,
                  width: size.width * 0.8,
                  child: ClipRRect(
                    borderRadius:
                        const BorderRadius.vertical(top: Radius.circular(12)),
                    child: CustomImage(
                        image: model.urlToImage ?? "",
                        imgHeight: 180,
                        imgWidth: size.width * 0.6),
                  ),
                ),
                Positioned(
                    top: 10,
                    right: 10,
                    child: Container(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 10, vertical: 4),
                      decoration: BoxDecoration(
                          color: primaryColor,
                          borderRadius: BorderRadius.circular(6)),
                      child: Text(
                        model.source!.name ?? "",
                        maxLines: 2,
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.w500, color: whiteColor),
                      ),
                    )),
              ],
            ),
            Container(
              height: 120,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(12),
                color:
                    CommonFunctions().themeIsDark() ? blackColor : whiteColor,
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    model.title ?? "",
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: CommonFunctions().themeIsDark()
                            ? whiteColor
                            : blackColor),
                  ),
                  const Spacer(),
                  Text(
                    format.format(dateTime),
                    maxLines: 2,
                    overflow: TextOverflow.ellipsis,
                    style: GoogleFonts.poppins(
                        fontWeight: FontWeight.w500,
                        color: CommonFunctions().themeIsDark()
                            ? whiteColor
                            : blackColor),
                  ),
                  const Spacer(),
                  InkWell(
                    onTap: () => Get.toNamed(RouteNames.articleDetail,
                        arguments: {"article": model}),
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      crossAxisAlignment: CrossAxisAlignment.end,
                      children: [
                        Text(
                          "Read Full Article",
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: GoogleFonts.poppins(
                              fontWeight: FontWeight.normal,
                              color: CommonFunctions().themeIsDark()
                                  ? whiteColor
                                  : blackColor),
                        ),
                        Icon(
                          Icons.arrow_right_alt_rounded,
                          color: CommonFunctions().themeIsDark()
                              ? whiteColor
                              : blackColor,
                        )
                      ],
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
