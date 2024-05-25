import 'package:apna_news/Models/attribute_filter_model.dart';
import 'package:apna_news/Models/paginated_model.dart';
import 'package:apna_news/Models/top_headline_model.dart';
import 'package:apna_news/Repositories/home_repository.dart';
import 'package:apna_news/Utils/common_functions.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

enum SortType { relevancy, popularity, publishedat }

class ViewNewsController extends GetxController {
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

  initRefreshData() {
    getArticleList(
      1,
      "init",
      "publishedat",
    );
    initFilter();
    offset = 1;
    checkboxValuesMap.clear();
    finalFilterQuery.value = "";
    selectedOption.value = SortType.publishedat;
  }

  onSubmit() {
    getArticleList(
      1,
      "init",
      selectedOption.value.toString().split('.').last,
    );
  }

  @override
  void onInit() {
    getArticleList(
      1,
      "init",
      "publishedat",
    );
    initFilter();
    super.onInit();
  }

  initFilter() {
    selectedAttributeIndex = 0.obs;
    selectedAttribute.value = attributeList
        .firstWhere((element) => element.attributeName == "Category");
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
    int offset,
    String from,
    String sortBy,
  ) async {
    if (offset == 1) {
      initData(from);
      applyLoadingFun(true);
      loadingFun(true);
    }
    var result = await homeRepository.getNewsChannelHeadlinesPagination(
        offset, sortBy, finalFilterQuery.value);

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

  // ------------------------------------------------------------
  RxInt selectedAttributeIndex = 0.obs;
  Rxn<Attribute> selectedAttribute = Rxn<Attribute>();
  Map<String, List<String>> checkboxValuesMap = {};
  RxString finalFilterQuery = "".obs;

  RxBool btnLoading = false.obs;

  RxList<Attribute> attributeList = <Attribute>[
    Attribute(attributeName: "Category", attributecode: "q", attributeValues: [
      FilterModel(value: "General", code: "general", isSelected: false.obs),
      FilterModel(value: "Business", code: "business", isSelected: false.obs),
      FilterModel(
          value: "Entertainment", code: "entertainment", isSelected: false.obs),
      FilterModel(value: "Health", code: "health", isSelected: false.obs),
      FilterModel(value: "Science", code: "science", isSelected: false.obs),
      FilterModel(value: "Sports", code: "sports", isSelected: false.obs),
      FilterModel(
          value: "Technology", code: "technology", isSelected: false.obs),
    ]),
    Attribute(
        attributeName: "Source",
        attributecode: "source",
        attributeValues: [
          FilterModel(value: "Argentina", code: "ar", isSelected: false.obs),
          FilterModel(
              value: "United States", code: "us", isSelected: false.obs),
          FilterModel(value: "Netherlands", code: "nl", isSelected: false.obs),
          FilterModel(value: "South Africa", code: "za", isSelected: false.obs),
          FilterModel(value: "Australia", code: "au", isSelected: false.obs),
          FilterModel(value: "Hong Kong", code: "hk", isSelected: false.obs),
          FilterModel(value: "New Zealand", code: "nz", isSelected: false.obs),
          FilterModel(value: "South Korea", code: "kr", isSelected: false.obs),
          FilterModel(
              value: "United Kingdom", code: "gb", isSelected: false.obs),
          FilterModel(value: "Russia", code: "ru", isSelected: false.obs),
          FilterModel(value: "Ukraine", code: "ua", isSelected: false.obs),
          FilterModel(value: "India", code: "in", isSelected: false.obs),
          FilterModel(value: "Canada", code: "ca", isSelected: false.obs),
          FilterModel(value: "China", code: "cn", isSelected: false.obs),
          FilterModel(value: "Italy", code: "it", isSelected: false.obs),
          FilterModel(value: "Portugal", code: "pt", isSelected: false.obs),
          FilterModel(value: "Japan", code: "jp", isSelected: false.obs),
          FilterModel(value: "Saudi Arabia", code: "sa", isSelected: false.obs),
        ]),
    Attribute(
        attributeName: "Domains",
        attributecode: "domains",
        attributeValues: [
          FilterModel(
              value: "BBC News", code: "bbc.co.uk", isSelected: false.obs),
          FilterModel(value: "CNN", code: "cnn.com", isSelected: false.obs),
          FilterModel(
              value: "The New York Times",
              code: "nytimes.com",
              isSelected: false.obs),
          FilterModel(
              value: "The Wall Street Journal",
              code: "wsj.com",
              isSelected: false.obs),
          FilterModel(
              value: "The Guardian",
              code: "theguardian.com",
              isSelected: false.obs),
          FilterModel(
              value: "Reuters", code: "reuters.com", isSelected: false.obs),
          FilterModel(
              value: "TechCrunch",
              code: "techcrunch.com",
              isSelected: false.obs),
          FilterModel(value: "Wired", code: "wired.com", isSelected: false.obs),
          FilterModel(
              value: "The Verge", code: "theverge.com", isSelected: false.obs),
          FilterModel(
              value: "Bloomberg", code: "bloomberg.com", isSelected: false.obs),
          FilterModel(
              value: "Financial Times", code: "ft.com", isSelected: false.obs),
          FilterModel(value: "CNBC", code: "cnbc.com", isSelected: false.obs),
          FilterModel(
              value: "The Times of India",
              code: "timesofindia.indiatimes.com",
              isSelected: false.obs),
          FilterModel(
              value: "The Sydney Morning Herald",
              code: "smh.com.au",
              isSelected: false.obs),
          FilterModel(
              value: "Globo (Brazil)",
              code: "globo.com",
              isSelected: false.obs),
          FilterModel(
              value: "Le Monde (France)",
              code: "lemonde.fr",
              isSelected: false.obs),
          FilterModel(
              value: "Der Spiegel (Germany)",
              code: "spiegel.de",
              isSelected: false.obs),
          FilterModel(
              value: "ESPN (Sports)", code: "espn.com", isSelected: false.obs),
          FilterModel(
              value: "Engadget (Technology and Gadgets)",
              code: "engadget.com",
              isSelected: false.obs),
          FilterModel(
              value: "Medical News Today (Health)",
              code: "medicalnewstoday.com",
              isSelected: false.obs),
          FilterModel(
              value: "Science Alert (Science)",
              code: "sciencealert.com",
              isSelected: false.obs),
        ])
  ].obs;

  onChangeAttribute(String name, int index) {
    selectedAttributeIndex.value = index;
    selectedAttribute.value =
        attributeList.firstWhere((element) => element.attributeName == name);
  }

  queryGenerater(FilterModel filterModel) {
    filterModel.isSelected!.value = !filterModel.isSelected!.value;

    var helper = returnSelectedAttribnutes(selectedAttribute.value!);
    checkboxValuesMap.addEntries(helper.entries);
    String helprt = buildQueryStringFromCheckboxValues(checkboxValuesMap);
    finalFilterQuery.value = helprt.replaceAll("%2", ",");

    // var query = finalFilterQuery.value;
    // print(query);
  }

  Map<String, List<String>> returnSelectedAttribnutes(Attribute attribute) {
    return {
      attribute.attributecode!: attribute.attributeValues!
          .where((element) => element.isSelected!.value == true)
          .toList()
          .map(
            (e) => e.code!,
          )
          .toList()
    };
  }

  String buildQueryStringFromCheckboxValues(
      Map<String, List<String>> checkboxValuesMap) {
    String queryString = '';
    checkboxValuesMap.forEach((groupName, values) {
      if (values.isNotEmpty) {
        queryString += '$groupName=${values.join(',')}&';
      }
    });
    return queryString.isEmpty
        ? ""
        : queryString.substring(0, queryString.length - 1);
  }
}
