import 'package:apna_news/Models/category_model.dart';
import 'package:apna_news/Models/paginated_model.dart';
import 'package:apna_news/Models/top_headline_model.dart';
import 'package:apna_news/Repositories/home_repository.dart';
import 'package:apna_news/Utils/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class ViewTopHeadlinesController extends GetxController {
  HomeRepository homeRepository = HomeRepository();
  RxBool isLoading = false.obs;
  RxBool applyLoading = false.obs;
  final ScrollController scrollController = ScrollController();
  RxList<ArticleModel> articalList = <ArticleModel>[].obs;

  Rxn<TopHeadLinePaginatedModel> paginatedModel =
      Rxn<TopHeadLinePaginatedModel>();

  loadingFun(bool val) {
    isLoading.value = val;
  }

  applyLoadingFun(bool val) {
    applyLoading.value = val;
  }

  RxString selectedCat = "general".obs;

  @override
  void onInit() {
    getArticleList(1, "init", "general");
    super.onInit();
  }

  initRefreshData() {
    selectedIndex.value = 0;
    getArticleList(1, "init", "general");
  }

  // late Rx<int?> selectedIndex = Rx<int?>(null);
  RxInt selectedIndex = 0.obs;

  changeSelectedIndex(int index, CategoryModel model) {
    selectedIndex.value = index;
    selectedCat.value = model.catName;
    getArticleList(1, "init", selectedCat.value);
  }

  int offset = 1;

  initData(String from) {
    offset = 1;
    articalList.clear();
  }

  Future getArticleList(
    int offset,
    String from,
    String selectedCat,
  ) async {
    if (offset == 1) {
      initData(from);
      applyLoadingFun(true);
      loadingFun(true);
    }
    var result = await homeRepository.getTopHeadlineWithPagination(
      selectedCat.toLowerCase(),
      offset,
    );

    result.fold((error) {
      CommonFunctions.showErrorSnackbar(error.message);

      if (offset == 1) {
        loadingFun(false);
        applyLoadingFun(false);
      }
    }, (data) {
      paginatedModel.value = data;
      articalList.addAll(data.data!);
      if (offset == 1) {
        loadingFun(false);
        applyLoadingFun(false);
      }
    });
  }
}
