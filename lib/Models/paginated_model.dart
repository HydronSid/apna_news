import 'package:apna_news/Models/top_headline_model.dart';

class TopHeadLinePaginatedModel {
  final int? totalSize;
  final int? limit;
  final int? offset;
  final List<ArticleModel>? data;

  TopHeadLinePaginatedModel({
    this.totalSize,
    this.limit,
    this.offset,
    this.data,
  });

  factory TopHeadLinePaginatedModel.fromJson(
          Map<String, dynamic> json, int offset) =>
      TopHeadLinePaginatedModel(
        data: json["articles"] == null
            ? []
            : List<ArticleModel>.from(
                json["articles"]!.map((x) => ArticleModel.fromJson(x))),
        offset: offset,
        limit: 20,
        totalSize: json["totalResults"],
      );
}
