import 'package:apna_news/Controllers/view_top_headlines_controller.dart';
import 'package:apna_news/Screens/ViewAllHeadLines/Components/article_component.dart';
import 'package:apna_news/Utils/appcolors.dart';
import 'package:apna_news/Widgets/paginated_list_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

import 'Components/top_category.dart';

class ViewAllHeadLines extends StatefulWidget {
  const ViewAllHeadLines({super.key});

  @override
  State<ViewAllHeadLines> createState() => _ViewAllHeadLinesState();
}

class _ViewAllHeadLinesState extends State<ViewAllHeadLines> {
  final controller = Get.put(ViewTopHeadlinesController());

  @override
  void dispose() {
    Get.delete<ViewTopHeadlinesController>();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: whiteColor,
        iconTheme: const IconThemeData(color: txtColor),
        title: Text(
          "Top HeadLines",
          style:
              GoogleFonts.poppins(color: txtColor, fontWeight: FontWeight.w500),
        ),
      ),
      body: CustomScrollView(
        controller: controller.scrollController,
        slivers: [
          SliverList(
              delegate: SliverChildListDelegate([
            const SizedBox(
              height: 10,
            ),
            const HeadLineHorizontalCategory(),
            Obx(
              () => controller.isLoading.value
                  ? const SizedBox()
                  : PaginatedListView(
                      scrollController: controller.scrollController,
                      enabledPagination: true,
                      offset: controller.paginatedModel.value!.offset,
                      onPaginate: (int? offset) async {
                        await controller.getArticleList(offset!, "viewmore",
                            controller.selectedCat.toString());
                      },
                      reverse: false,
                      totalSize: controller.paginatedModel.value!.totalSize,
                      itemView: ListView.separated(
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                        physics: const NeverScrollableScrollPhysics(),
                        padding: const EdgeInsets.symmetric(
                            horizontal: 5, vertical: 5),
                        itemCount: controller.articalList.length,
                        shrinkWrap: true,
                        itemBuilder: (context, index) {
                          var article = controller.articalList[index];
                          return ArticleComponent(article: article);
                        },
                      ),
                    ),
            )
          ]))
        ],
      ),
    );
  }
}
