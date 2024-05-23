import 'package:apna_news/Models/paginated_model.dart';
import 'package:apna_news/Models/top_headline_model.dart';
import 'package:apna_news/Utils/app_base_api_services.dart';
import 'package:apna_news/Utils/app_exceptions.dart';
import 'package:apna_news/Utils/app_failure.dart';
import 'package:apna_news/Utils/app_network_api_services.dart';
import 'package:apna_news/Utils/local_shared_preferences.dart';
import 'package:apna_news/Utils/remote_urls.dart';
import 'package:dartz/dartz.dart';

class HomeRepository {
  BaseApiService apiService = NetworkAPIService();
  Future<Either<Failure, TopHeadLineModel>> getTopHeadline(
      String selectedCat) async {
    String country = await LocalPreferences().getCountry() ?? "in";
    try {
      var response = await apiService.getGetApiResponse(
        "${RemoteUrls.topHeadLines}&category=$selectedCat&country=$country",
      );

      return right(TopHeadLineModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  Future<Either<Failure, TopHeadLinePaginatedModel>>
      getTopHeadlineWithPagination(
    String selectedCat,
    int offset,
  ) async {
    String country = await LocalPreferences().getCountry() ?? "in";
    try {
      var response = await apiService.getGetApiResponse(
        "${RemoteUrls.topHeadLines}&category=$selectedCat&country=$country&pageSize=20&page=$offset",
      );

      return right(TopHeadLinePaginatedModel.fromJson(response, offset));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }

  Future<Either<Failure, TopHeadLineModel>> getNewsChannelHeadlines(
      String selectedCat) async {
    String country = await LocalPreferences().getCountry() ?? "in";
    try {
      var response = await apiService.getGetApiResponse(
        "${RemoteUrls.everythingList}&q=$selectedCat",
      );

      return right(TopHeadLineModel.fromJson(response));
    } on ServerException catch (e) {
      return Left(ServerFailure(e.message, e.statusCode));
    }
  }
}
