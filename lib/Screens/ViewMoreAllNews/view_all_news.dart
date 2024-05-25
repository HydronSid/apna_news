import 'package:apna_news/Controllers/view_news_controller.dart';
import 'package:apna_news/Screens/ViewAllTopHeadLines/Components/article_component.dart';
import 'package:apna_news/Utils/appcolors.dart';
import 'package:apna_news/Utils/common_functions.dart';
import 'package:apna_news/Utils/route_names.dart';
import 'package:apna_news/Widgets/common_appbar.dart';
import 'package:apna_news/Widgets/no_data_found.dart';
import 'package:apna_news/Widgets/paginated_list_view.dart';
import 'package:apna_news/Widgets/shimmer_helper.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';

class ViewAllNews extends StatefulWidget {
  const ViewAllNews({super.key});

  @override
  State<ViewAllNews> createState() => _ViewAllNewsState();
}

class _ViewAllNewsState extends State<ViewAllNews> {
  final controller = Get.put(ViewNewsController());
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CommonAppBar(title: "News"),
      body: RefreshIndicator(
        onRefresh: () async => controller.initRefreshData(),
        child: CustomScrollView(
          controller: controller.scrollController,
          slivers: [
            SliverList(
                delegate: SliverChildListDelegate([
              Container(
                padding: const EdgeInsets.symmetric(vertical: 10),
                color:
                    CommonFunctions().themeIsDark() ? blackColor : whiteColor,
                child: Row(
                  children: [
                    Expanded(
                        child: InkWell(
                      onTap: () => Get.toNamed(RouteNames.filterScreen),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.filter_alt_outlined,
                            color: CommonFunctions().themeIsDark()
                                ? whiteColor
                                : txtColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Filter",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: CommonFunctions().themeIsDark()
                                  ? whiteColor
                                  : txtColor,
                            ),
                          ),
                        ],
                      ),
                    )),
                    Expanded(
                        child: InkWell(
                      onTap: () {
                        Get.bottomSheet(
                            Container(
                              decoration: BoxDecoration(
                                  color: CommonFunctions().themeIsDark()
                                      ? blackColor
                                      : whiteColor,
                                  borderRadius: BorderRadius.circular(12)),
                              padding: const EdgeInsets.all(8.0),
                              child: Column(
                                mainAxisSize: MainAxisSize.min,
                                children: [
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  Text(
                                    "Sort By",
                                    style: GoogleFonts.poppins(
                                      fontWeight: FontWeight.w500,
                                      fontSize: 16,
                                      color: CommonFunctions().themeIsDark()
                                          ? whiteColor
                                          : txtColor,
                                    ),
                                  ),
                                  const SizedBox(
                                    height: 10,
                                  ),
                                  ListView.separated(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 10, vertical: 10),
                                      physics:
                                          const NeverScrollableScrollPhysics(),
                                      shrinkWrap: true,
                                      itemBuilder: (context, index) {
                                        final option = SortType.values[index];
                                        return Obx(() => RadioListTile(
                                            dense: true,
                                            visualDensity:
                                                VisualDensity.compact,
                                            contentPadding: EdgeInsets.zero,
                                            title: Text(
                                              index == 0
                                                  ? "Relevent"
                                                  : index == 1
                                                      ? "Popularity"
                                                      : "Published At",
                                              style: GoogleFonts.poppins(
                                                  fontSize: 13,
                                                  color: CommonFunctions()
                                                          .themeIsDark()
                                                      ? whiteColor
                                                      : blackColor,
                                                  fontWeight: FontWeight.w500),
                                            ),
                                            value: option,
                                            groupValue:
                                                controller.selectedOption.value,
                                            onChanged: (value) {
                                              if (value != null) {
                                                controller
                                                    .setSelectedOption(value);
                                              }
                                            }));
                                      },
                                      separatorBuilder: (context, index) {
                                        return const SizedBox(
                                          height: 10,
                                        );
                                      },
                                      itemCount: SortType.values.length),
                                  SizedBox(
                                    width: double.infinity,
                                    child: ElevatedButton(
                                        onPressed: () {
                                          Get.back();
                                          controller.onSubmit();
                                        },
                                        child: const Text("Submit")),
                                  )
                                ],
                              ),
                            ),
                            isScrollControlled: true,
                            shape: const RoundedRectangleBorder(
                                borderRadius: BorderRadius.vertical(
                                    top: Radius.circular(12))));
                      },
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.sort,
                            color: CommonFunctions().themeIsDark()
                                ? whiteColor
                                : txtColor,
                          ),
                          const SizedBox(
                            width: 10,
                          ),
                          Text(
                            "Sort",
                            style: GoogleFonts.poppins(
                              fontWeight: FontWeight.w500,
                              color: CommonFunctions().themeIsDark()
                                  ? whiteColor
                                  : txtColor,
                            ),
                          ),
                        ],
                      ),
                    ))
                  ],
                ),
              ),
              const SizedBox(
                height: 10,
              ),
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
                                controller.selectedOption.value
                                    .toString()
                                    .split('.')
                                    .last,
                              );
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
