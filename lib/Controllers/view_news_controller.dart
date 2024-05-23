import 'package:apna_news/Models/paginated_model.dart';
import 'package:apna_news/Models/top_headline_model.dart';
import 'package:apna_news/Repositories/home_repository.dart';
import 'package:apna_news/Utils/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SortType { relevancy, popularity, publishedat }

class ViewHeadlinesController extends GetxController {
  HomeRepository homeRepository = HomeRepository();
  RxBool isLoading = false.obs;
  RxBool applyLoading = false.obs;
  final ScrollController scrollController = ScrollController();
  RxList<ArticleModel> articalList = <ArticleModel>[].obs;

  Rxn<TopHeadLinePaginatedModel> paginatedModel =
      Rxn<TopHeadLinePaginatedModel>();

  var selectedOption = SortType.publishedat.obs;

  void setSelectedOption(SortType option) {
    selectedOption.value = option;
  }

  onSubmit() {
    getArticleList(
        1, "init", selectedOption.value.toString().split('.').last, "general");
  }

  @override
  void onInit() {
    getArticleList(1, "init", "publishedat", "general");
    super.onInit();
  }

  loadingFun(bool val) {
    isLoading.value = val;
  }

  applyLoadingFun(bool val) {
    applyLoading.value = val;
  }

  int offset = 1;

  initData(String from) {
    offset = 1;
    articalList.clear();
  }

  Future getArticleList(
      int offset, String from, String sortBy, String catType) async {
    if (offset == 1) {
      initData(from);
      applyLoadingFun(true);
      loadingFun(true);
    }
    var result = await homeRepository.getNewsChannelHeadlinesPagination(
        offset, sortBy, catType);

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
