import 'package:apna_news/Models/attribute_filter_model.dart';
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

  List<Attribute> attributeList = [
    Attribute(attributeName: "Category", attributecode: "q", attributeValues: [
      FilterModel(value: "General", code: "general", isSelected: false),
      FilterModel(value: "Business", code: "business", isSelected: false),
      FilterModel(
          value: "Entertainment", code: "entertainment", isSelected: false),
      FilterModel(value: "Health", code: "health", isSelected: false),
      FilterModel(value: "Science", code: "science", isSelected: false),
      FilterModel(value: "Sports", code: "sports", isSelected: false),
      FilterModel(value: "Technology", code: "technology", isSelected: false),
    ]),
    Attribute(
        attributeName: "Source",
        attributecode: "source",
        attributeValues: [
          FilterModel(value: "Argentina", code: "ar", isSelected: false),
          FilterModel(value: "United States", code: "us", isSelected: false),
          FilterModel(value: "Netherlands", code: "nl", isSelected: false),
          FilterModel(value: "South Africa", code: "za", isSelected: false),
          FilterModel(value: "Australia", code: "au", isSelected: false),
          FilterModel(value: "Hong Kong", code: "hk", isSelected: false),
          FilterModel(value: "New Zealand", code: "nz", isSelected: false),
          FilterModel(value: "South Korea", code: "kr", isSelected: false),
          FilterModel(value: "United Kingdom", code: "gb", isSelected: false),
          FilterModel(value: "Russia", code: "ru", isSelected: false),
          FilterModel(value: "Ukraine", code: "ua", isSelected: false),
          FilterModel(value: "India", code: "in", isSelected: false),
          FilterModel(value: "Canada", code: "ca", isSelected: false),
          FilterModel(value: "China", code: "cn", isSelected: false),
          FilterModel(value: "Italy", code: "it", isSelected: false),
          FilterModel(value: "Portugal", code: "pt", isSelected: false),
          FilterModel(value: "Japan", code: "jp", isSelected: false),
          FilterModel(value: "Saudi Arabia", code: "sa", isSelected: false),
        ]),
    Attribute(
        attributeName: "Domains",
        attributecode: "domains",
        attributeValues: [
          FilterModel(value: "BBC News", code: "bbc.co.uk", isSelected: false),
          FilterModel(value: "CNN", code: "cnn.com", isSelected: false),
          FilterModel(
              value: "The New York Times",
              code: "nytimes.com",
              isSelected: false),
          FilterModel(
              value: "The Wall Street Journal",
              code: "wsj.com",
              isSelected: false),
          FilterModel(
              value: "The Guardian",
              code: "theguardian.com",
              isSelected: false),
          FilterModel(value: "Reuters", code: "reuters.com", isSelected: false),
          FilterModel(
              value: "TechCrunch", code: "techcrunch.com", isSelected: false),
          FilterModel(value: "Wired", code: "wired.com", isSelected: false),
          FilterModel(
              value: "The Verge", code: "theverge.com", isSelected: false),
          FilterModel(
              value: "Bloomberg", code: "bloomberg.com", isSelected: false),
          FilterModel(
              value: "Financial Times", code: "ft.com", isSelected: false),
          FilterModel(value: "CNBC", code: "cnbc.com", isSelected: false),
          FilterModel(
              value: "The Times of India",
              code: "timesofindia.indiatimes.com",
              isSelected: false),
          FilterModel(
              value: "The Sydney Morning Herald",
              code: "smh.com.au",
              isSelected: false),
          FilterModel(
              value: "Globo (Brazil)", code: "globo.com", isSelected: false),
          FilterModel(
              value: "Le Monde (France)",
              code: "lemonde.fr",
              isSelected: false),
          FilterModel(
              value: "Der Spiegel (Germany)",
              code: "spiegel.de",
              isSelected: false),
          FilterModel(
              value: "ESPN (Sports)", code: "espn.com", isSelected: false),
          FilterModel(
              value: "Engadget (Technology and Gadgets)",
              code: "engadget.com",
              isSelected: false),
          FilterModel(
              value: "Medical News Today (Health)",
              code: "medicalnewstoday.com",
              isSelected: false),
          FilterModel(
              value: "Science Alert (Science)",
              code: "sciencealert.com",
              isSelected: false),
        ])
  ];
}
