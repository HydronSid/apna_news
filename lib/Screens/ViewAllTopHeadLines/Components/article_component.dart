import 'package:apna_news/Models/top_headline_model.dart';
import 'package:apna_news/Utils/appcolors.dart';
import 'package:apna_news/Widgets/custom_image.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:intl/intl.dart';

class ArticleComponent extends StatelessWidget {
  final ArticleModel article;
  const ArticleComponent({super.key, required this.article});

  @override
  Widget build(BuildContext context) {
    final format = DateFormat('MMMM dd, yyyy');
    var size = MediaQuery.of(context).size;
    DateTime dateTime = DateTime.parse(article.publishedAt.toString());
    return Row(
      children: [
        SizedBox(
          height: size.height * 0.15,
          width: size.width * 0.4,
          child: ClipRRect(
            borderRadius: BorderRadius.circular(6),
            child: CustomImage(
              image: article.urlToImage.toString(),
              boxFit: BoxFit.fill,
              imgHeight: size.height * 0.15,
              imgWidth: size.width * 0.4,
            ),
          ),
        ),
        Expanded(
          child: Container(
            height: size.height * 0.15,
            padding: const EdgeInsets.only(left: 15),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  article.title.toString(),
                  maxLines: 3,
                  style: GoogleFonts.poppins(
                      fontSize: 13,
                      color: txtColor,
                      fontWeight: FontWeight.w700),
                ),
                const Spacer(),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  crossAxisAlignment: CrossAxisAlignment.end,
                  children: [
                    Expanded(
                      child: Text(
                        article.source!.name.toString(),
                        style: GoogleFonts.poppins(
                            fontSize: 12,
                            color: primaryColor,
                            fontWeight: FontWeight.w600),
                      ),
                    ),
                    const SizedBox(
                      width: 10,
                    ),
                    Text(
                      format.format(dateTime),
                      style: GoogleFonts.poppins(
                          fontSize: 12, fontWeight: FontWeight.w500),
                    ),
                  ],
                )
              ],
            ),
          ),
        )
      ],
    );
  }
}
