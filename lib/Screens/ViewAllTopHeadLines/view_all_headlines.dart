import 'package:apna_news/Controllers/view_top_headlines_controller.dart';
import 'package:apna_news/Screens/ViewAllTopHeadLines/Components/article_component.dart';
import 'package:apna_news/Utils/common_functions.dart';
import 'package:apna_news/Widgets/common_appbar.dart';
import 'package:apna_news/Widgets/no_data_found.dart';
import 'package:apna_news/Widgets/paginated_list_view.dart';
import 'package:apna_news/Widgets/shimmer_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

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
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CommonAppBar(title: "Top HeadLines"),
      body: RefreshIndicator(
        onRefresh: () async => controller.initRefreshData(),
        child: CustomScrollView(
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
                    ? ListView.separated(
                        shrinkWrap: true,
                        padding: const EdgeInsets.symmetric(
                            horizontal: 10, vertical: 10),
                        separatorBuilder: (context, index) {
                          return const SizedBox(
                            height: 20,
                          );
                        },
                        physics: const NeverScrollableScrollPhysics(),
                        itemCount: 5,
                        itemBuilder: (context, index) {
                          return shimmerCard();
                        },
                      )
                    : controller.articalList.isEmpty
                        ? const NoDataFoundScreen(
                            passedData: "No Article Found.")
                        : PaginatedListView(
                            scrollController: controller.scrollController,
                            enabledPagination: true,
                            offset: controller.paginatedModel.value!.offset,
                            onPaginate: (int? offset) async {
                              await controller.getArticleList(
                                  offset!,
                                  "viewmore",
                                  controller.selectedCat.toString());
                            },
                            reverse: false,
                            totalSize:
                                controller.paginatedModel.value!.totalSize,
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
