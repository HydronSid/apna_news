import 'package:apna_news/Utils/appconstants.dart';

class RemoteUrls {
  static const baseUrl = "https://newsapi.org/v2";

  static String topHeadLines =
      "$baseUrl/top-headlines?apiKey=${AppConstants.apiKey}";

  static String homeEverythingList =
      "$baseUrl/everything?apiKey=${AppConstants.apiKey}&pageSize=20&page=1";

  static String homeEverythingListPagination =
      "$baseUrl/everything?apiKey=${AppConstants.apiKey}";
}
