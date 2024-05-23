import 'package:apna_news/Utils/appconstants.dart';

class RemoteUrls {
  static const baseUrl = "https://newsapi.org/v2";

  // https://newsapi.org/v2/everything?q=$category&apiKey=8a5ec37e26f845dcb4c2b78463734448

  static String topHeadLines =
      "$baseUrl/top-headlines?apiKey=${AppConstants.apiKey}";

  static String everythingList =
      "$baseUrl/everything?apiKey=${AppConstants.apiKey}&pageSize=20&page=1";
}
