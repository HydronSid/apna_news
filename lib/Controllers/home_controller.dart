import 'package:apna_news/Models/category_model.dart';
import 'package:apna_news/Utils/images.dart';
import 'package:get/get.dart';

class HomeController extends GetxController {
  List<CategoryModel> categoryList = [
    CategoryModel(catName: "General", catImage: Images.general),
    CategoryModel(catName: "Business", catImage: Images.business),
    CategoryModel(catName: "Entertainment", catImage: Images.entertainment),
    CategoryModel(catName: "Health", catImage: Images.health),
    CategoryModel(catName: "Science", catImage: Images.science),
    CategoryModel(catName: "Sports", catImage: Images.sports),
    CategoryModel(catName: "Technology", catImage: Images.technology),
  ];

  RxInt selectedIndex = 0.obs;

  changeSelectedIndex(int index) {
    selectedIndex.value = index;
  }
}
