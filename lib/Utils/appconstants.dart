import 'package:apna_news/Models/category_model.dart';

import 'images.dart';

class AppConstants {
  static const apiKey = "06237836db4b422b836f38792560f61f";

  static List<CategoryModel> categoryList = [
    CategoryModel(catName: "General", catImage: Images.general),
    CategoryModel(catName: "Business", catImage: Images.business),
    CategoryModel(catName: "Entertainment", catImage: Images.entertainment),
    CategoryModel(catName: "Health", catImage: Images.health),
    CategoryModel(catName: "Science", catImage: Images.science),
    CategoryModel(catName: "Sports", catImage: Images.sports),
    CategoryModel(catName: "Technology", catImage: Images.technology),
  ];

  List sortType = ["Relevancy", "Popularity", "PublishedAt"];

  List<LanguageModel> languageList = [
    LanguageModel(launguage: "Arabic", code: "ar"),
    LanguageModel(launguage: "German", code: "de"),
    LanguageModel(launguage: "English", code: "en"),
    LanguageModel(launguage: "Spanish", code: "es"),
    LanguageModel(launguage: "French", code: "fr"),
    LanguageModel(launguage: "Hebrew", code: "he"),
    LanguageModel(launguage: "Italian", code: "it"),
    LanguageModel(launguage: "Dutch", code: "nl"),
    LanguageModel(launguage: "Norwegian", code: "no"),
    LanguageModel(launguage: "Portuguese", code: "pt"),
    LanguageModel(launguage: "Russian", code: "ru"),
    LanguageModel(launguage: "Swedish", code: "sv"),
    LanguageModel(launguage: "Chinese", code: "zh"),
  ];
}
