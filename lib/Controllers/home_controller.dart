import 'package:apna_news/Models/category_model.dart';
import 'package:apna_news/Models/top_headline_model.dart';
import 'package:apna_news/Repositories/home_repository.dart';
import 'package:apna_news/Utils/common_functions.dart';
import 'package:apna_news/Utils/route_names.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  HomeRepository homeRepository = HomeRepository();
  RxBool isLoading = false.obs;

  RxList<ArticleModel> articalList = <ArticleModel>[].obs;
  RxList<ArticleModel> newsArticalList = <ArticleModel>[].obs;

  loadingFun(bool val) {
    isLoading.value = val;
  }

  @override
  void onInit() {
    getTopHeadLineList("general").then((value) => getNewsHeadLineList("general")
        .then((value) => Get.toNamed(RouteNames.homeScreen)));
    super.onInit();
  }

  initData() {
    selectedIndex.value = 0;
    getTopHeadLineList("general")
        .then((value) => getNewsHeadLineList("general").then((value)));
  }

  // late Rx<int?> selectedIndex = Rx<int?>(null);
  RxInt selectedIndex = 0.obs;

  changeSelectedIndex(int index, CategoryModel model) {
    selectedIndex.value = index;
    //getTopHeadLineList(model.catName.toLowerCase());
    getNewsHeadLineList(model.catName.toLowerCase());
  }

  Future getTopHeadLineList(String selectedCat) async {
    loadingFun(true);
    articalList.clear();
    var result = await homeRepository.getTopHeadline(selectedCat);

    result.fold((error) {
      CommonFunctions.showErrorSnackbar(error.message);
      loadingFun(false);
    }, (data) {
      articalList.value = data.articles ?? [];
    });
  }

  Future getNewsHeadLineList(String selectedCat) async {
    loadingFun(true);
    newsArticalList.clear();
    var result = await homeRepository.getNewsChannelHeadlines(selectedCat);

    result.fold((error) {
      CommonFunctions.showErrorSnackbar(error.message);
      loadingFun(false);
    }, (data) {
      newsArticalList.value = data.articles ?? [];
      loadingFun(false);
    });
  }
}
