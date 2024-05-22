import 'package:apna_news/Utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class PinnedAppBar extends SliverPersistentHeaderDelegate {
  @override
  double get minExtent => 60;

  @override
  double get maxExtent => 60;

  @override
  Widget build(
    BuildContext context,
    double shrinkOffset,
    bool overlapsContent,
  ) {
    return Container(
      height: 60,
      padding: const EdgeInsets.only(top: 8, left: 8, right: 8, bottom: 8),
      color: whiteColor,
      child: InkWell(
        // onTap: () => Get.toNamed(RouteName.searchProductField),
        child: Card(
          margin: EdgeInsets.zero,
          elevation: 4,
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
          child: Container(
            decoration: BoxDecoration(
                border: Border.all(color: borderColor),
                color: Colors.white,
                borderRadius: BorderRadius.circular(10)),
            padding: const EdgeInsets.symmetric(vertical: 5, horizontal: 12),
            child: Row(
              children: [
                const Icon(
                  Icons.search,
                  size: 17,
                  color: Color(0xFFA6A6A6),
                ),
                Padding(
                  padding: const EdgeInsets.only(left: 10),
                  child: Text('Search for article or title',
                      style:
                          GoogleFonts.poppins(color: const Color(0xFF909090))),
                )
              ],
            ),
          ),
        ),
      ),
    );
  }

  @override
  bool shouldRebuild(SliverPersistentHeaderDelegate oldDelegate) {
    return false;
  }
}
