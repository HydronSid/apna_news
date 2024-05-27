import 'package:apna_news/Models/top_headline_model.dart';
import 'package:apna_news/Utils/appcolors.dart';
import 'package:apna_news/Utils/common_functions.dart';
import 'package:apna_news/Widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart' as nb;

class ArticleDetail extends StatefulWidget {
  const ArticleDetail({super.key});

  @override
  State<ArticleDetail> createState() => _ArticleDetailState();
}

class _ArticleDetailState extends State<ArticleDetail> {
  final format = DateFormat('MMMM dd,yyyy');

  ArticleModel articleModel = ArticleModel();
  @override
  void initState() {
    nb.setStatusBarColor(Colors.transparent);
    var data = Get.arguments;
    articleModel = data['article'] as ArticleModel;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    DateTime dateTime = DateTime.parse(articleModel.publishedAt.toString());
    return Scaffold(
      body: Stack(
        children: [
          SingleChildScrollView(
            child: Column(
              children: [
                CustomImage(
                    image: articleModel.urlToImage ?? '',
                    imgHeight: size.height * 0.4,
                    imgWidth: double.infinity),
                Container(
                  padding: const EdgeInsets.only(top: 10, right: 10, left: 10),
                  child: Column(
                    children: [
                      Text('${articleModel.title}',
                          style: GoogleFonts.poppins(
                              fontSize: 16,
                              color: CommonFunctions().themeIsDark()
                                  ? whiteColor
                                  : txtColor,
                              fontWeight: FontWeight.w700)),
                      const SizedBox(
                        height: 10,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Expanded(
                            child: Text(
                              '${articleModel.source!.name}',
                              softWrap: true,
                              overflow: TextOverflow.ellipsis,
                              style: GoogleFonts.poppins(
                                  fontSize: 13,
                                  color: primaryColor,
                                  fontWeight: FontWeight.w600),
                            ),
                          ),
                          Text(
                            format.format(dateTime),
                            softWrap: true,
                            overflow: TextOverflow.ellipsis,
                            style: GoogleFonts.poppins(
                                fontSize: 12,
                                color: CommonFunctions().themeIsDark()
                                    ? whiteColor
                                    : Colors.black87,
                                fontWeight: FontWeight.w500),
                          ),
                        ],
                      ),
                      const SizedBox(
                        height: 10,
                      ),
                      Text('${articleModel.description}',
                          style: GoogleFonts.poppins(
                              fontSize: 15,
                              color: CommonFunctions().themeIsDark()
                                  ? whiteColor
                                  : Colors.black87,
                              fontWeight: FontWeight.w500)),
                    ],
                  ),
                )
              ],
            ),
          ),
          Positioned(
            left: 20,
            child: SafeArea(
              child: InkWell(
                onTap: () => Get.back(),
                child: Container(
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: whiteColor),
                  child: const Icon(
                    Icons.chevron_left_rounded,
                    color: blackColor,
                    size: 35,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
