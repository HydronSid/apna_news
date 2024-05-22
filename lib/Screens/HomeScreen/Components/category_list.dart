import 'package:apna_news/Controllers/home_controller.dart';
import 'package:apna_news/Utils/appcolors.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class HorizontalCategory extends StatelessWidget {
  const HorizontalCategory({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    HomeController controller = Get.find();
    return SizedBox(
      height: 50,
      child: Container(
        padding: const EdgeInsets.symmetric(horizontal: 0, vertical: 5),
        child: ListView.separated(
            padding: const EdgeInsets.only(left: 10, right: 10),
            scrollDirection: Axis.horizontal,
            itemBuilder: (context, index) {
              var data = controller.categoryList[index];
              return InkWell(
                onTap: () {
                  // read.selectIndex(
                  //   context,
                  //   index,
                  //   watch.categoryList[index],
                  // );
                },
                child: Card(
                  elevation: 3,
                  margin: const EdgeInsets.only(bottom: 5),
                  color: controller.selectedIndex.value == index
                      ? primaryColor
                      : Colors.white,
                  shape: RoundedRectangleBorder(
                      side: BorderSide(
                          width: controller.selectedIndex.value == index
                              ? 1.5
                              : 0.7,
                          color: controller.selectedIndex.value == index
                              ? primaryColor
                              : borderColor),
                      borderRadius: BorderRadius.circular(10)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(
                        horizontal: 20.0, vertical: 10.0),
                    child: Row(
                      mainAxisSize: MainAxisSize.min,
                      children: [
                        const SizedBox(
                          width: 10,
                        ),
                        Text(
                          data.catName,
                          textAlign: TextAlign.center,
                          style: GoogleFonts.nunito(
                            fontWeight: FontWeight.bold,
                            color: controller.selectedIndex.value == index
                                ? whiteColor
                                : blackColor,
                          ),
                        ),
                      ],
                    ),
                  ),
                ),
              );
            },
            separatorBuilder: (context, index) {
              return const SizedBox(
                width: 10,
              );
            },
            itemCount: controller.categoryList.length),
      ),
    );
  }
}
