import 'package:apna_news/Utils/appconstants.dart';

class RemoteUrls {
  static const baseUrl = "https://newsapi.org/v2";

  // https://newsapi.org/v2/everything?q=$category&apiKey=8a5ec37e26f845dcb4c2b78463734448

  static String categoryList =
      "$baseUrl/everything?apiKey=${AppConstants.apiKey}&q=";
}
