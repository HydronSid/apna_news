import 'package:apna_news/Models/category_model.dart';

import 'images.dart';

class AppConstants {
  static const apiKey = "06237836db4b422b836f38792560f61f";

  List<CategoryModel> categoryList = [
    CategoryModel(catName: "General", catImage: Images.general),
    CategoryModel(catName: "Business", catImage: Images.business),
    CategoryModel(catName: "Entertainment", catImage: Images.entertainment),
    CategoryModel(catName: "Health", catImage: Images.health),
    CategoryModel(catName: "Science", catImage: Images.science),
    CategoryModel(catName: "Sports", catImage: Images.sports),
    CategoryModel(catName: "Technology", catImage: Images.technology),
  ];
}
