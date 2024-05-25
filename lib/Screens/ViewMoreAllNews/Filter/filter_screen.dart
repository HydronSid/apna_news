import 'package:apna_news/Controllers/view_news_controller.dart';
import 'package:apna_news/Utils/appcolors.dart';
import 'package:apna_news/Utils/common_functions.dart';
import 'package:apna_news/Widgets/common_appbar.dart';
import 'package:apna_news/Widgets/common_button_loader.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class FilterScreen extends StatefulWidget {
  const FilterScreen({super.key});

  @override
  State<FilterScreen> createState() => _FilterScreenState();
}

class _FilterScreenState extends State<FilterScreen> {
  ViewNewsController controller = Get.find();
  @override
  Widget build(BuildContext context) {
    controller.initFilter();
    var size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: const CommonAppBar(title: "Filter"),
      body: Column(
        children: [
          Expanded(
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                SizedBox(
                  width: size.width * 0.35,
                  child: SingleChildScrollView(
                    child: ListView.separated(
                        shrinkWrap: true,
                        physics: const NeverScrollableScrollPhysics(),
                        itemBuilder: (context, index) {
                          return InkWell(
                            onTap: () {
                              controller.onChangeAttribute(
                                  controller
                                          .attributeList[index].attributeName ??
                                      "",
                                  index);
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 8.0, vertical: 8.0),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  Obx(
                                    () => Text(
                                      controller.attributeList[index]
                                              .attributeName ??
                                          "",
                                      style: TextStyle(
                                          fontWeight: controller
                                                      .selectedAttributeIndex
                                                      .value ==
                                                  index
                                              ? FontWeight.bold
                                              : FontWeight.normal,
                                          color: controller
                                                      .selectedAttributeIndex
                                                      .value ==
                                                  index
                                              ? Colors.green
                                              : CommonFunctions().themeIsDark()
                                                  ? whiteColor
                                                  : blackColor),
                                    ),
                                  ),
                                  Icon(
                                    Icons.chevron_right_rounded,
                                    size: 14,
                                    color: controller
                                                .selectedAttributeIndex.value ==
                                            index
                                        ? Colors.green
                                        : CommonFunctions().themeIsDark()
                                            ? whiteColor
                                            : blackColor,
                                  )
                                ],
                              ),
                            ),
                          );
                        },
                        separatorBuilder: (context, index) {
                          return Container();
                        },
                        itemCount: controller.attributeList.length),
                  ),
                ),
                Expanded(
                    child: SizedBox(
                  height: size.height * 0.85,
                  child: Obx(() => ListView.separated(
                      itemBuilder: (context, index) {
                        var data = controller
                            .selectedAttribute.value!.attributeValues![index];
                        return Obx(() => CheckboxListTile(
                              visualDensity: VisualDensity.compact,
                              dense: true,
                              title: Text(data.value ?? ""),
                              value: data.isSelected!.value,
                              onChanged: (bool? value) {
                                controller.queryGenerater(data);
                              },
                              controlAffinity: ListTileControlAffinity.leading,
                              contentPadding: EdgeInsets.zero,
                            ));
                      },
                      separatorBuilder: (context, index) {
                        return Container();
                      },
                      itemCount: controller
                          .selectedAttribute.value!.attributeValues!.length)),
                ))
              ],
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Row(
              children: [
                const Spacer(),
                Obx(
                  () => ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 50, vertical: 10),
                      ),
                      onPressed: controller.applyLoading.value
                          ? null
                          : () {
                              controller
                                  .getArticleList(
                                    1,
                                    "init",
                                    controller.selectedOption.value
                                        .toString()
                                        .split('.')
                                        .last,
                                  )
                                  .then((value) => Get.back());
                            },
                      child: controller.applyLoading.value
                          ? const CommonButtonLoader(indicatorColor: whiteColor)
                          : const Text("Apply")),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
