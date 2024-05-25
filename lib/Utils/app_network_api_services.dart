// ignore_for_file: unrelated_type_equality_checks, duplicate_ignore

import 'dart:async';
import 'dart:convert';
import 'dart:developer';
import 'dart:io';

import 'package:dio/dio.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart';
// ignore: depend_on_referenced_packages
import 'package:http/http.dart' as http;
import 'app_base_api_services.dart';
import 'app_exceptions.dart';
import 'common_functions.dart';

class NetworkAPIService extends BaseApiService {
  Dio dio = Dio();
  static const _className = 'RemoteDataSourceImpl';

  @override
  Future getGetApiResponse(
    String url,
  ) async {
    dynamic responseJson;

    try {
      final response = await get(
        Uri.parse(url),
        headers: {
          'Content-Type': 'application/json',
          'Accept': 'application/json',
        },
      ).timeout(const Duration(seconds: 30));

      // log(response.body.toString());

      responseJson = _responseParser(response, "GET");
    } on SocketException {
      log('SocketException', name: _className);
      throw const NetworkException('No internet connection', 10061);
    } on FormatException {
      log('FormatException', name: _className);
      throw const DataFormateException('Data format exception', 422);
    } on ClientException {
      ///503 Service Unavailable
      log('http ClientException', name: _className);
      throw const NetworkException('Service unavailable 503', 503);
    } on TimeoutException {
      log('TimeoutException', name: _className);
      throw const NetworkException('Request timeout', 408);
    }
    return responseJson;
  }

  static _responseParser(http.Response response, String fromMethod) {
    switch (response.statusCode) {
      case 200:
        var responseJson = json.decode(response.body);

        return responseJson;

      case 400:
        var responseJson = json.decode(response.body);

        return responseJson;

      // throw ValidationException(list, 400);
      case 401:
        final errorMsg = parsingDoseNotExist(response.body);

        CommonFunctions().sessionTimeOut();

        throw UnauthorisedException(errorMsg, 401);

      case 402:
        final errorMsg = parsingDoseNotExist(response.body);
        throw UnauthorisedException(errorMsg, 402);
      case 403:
        final errorMsg = parsingDoseNotExist(response.body);
        throw UnauthorisedException(errorMsg, 403);
      case 404:
        throw const UnauthorisedException('Request not found', 404);
      case 405:
        throw const UnauthorisedException('Method not allowed', 405);
      case 408:

        ///408 Request Timeout
        throw const NetworkException('Request timeout', 408);
      case 415:

        /// 415 Unsupported Media Type
        throw const DataFormateException('Data format exception');

      case 422:

        ///Unprocessable Entity
        final errorMsg = parsingError(response.body);
        throw InvalidInputException(errorMsg, 422);
      case 500:
        // var heplpl = response.body;
        // print(heplpl);

        ///500 Internal Server Error
        throw const InternalServerException('Internal server error', 500);

      case 429:
        throw const UnknowException('To many Requests', 429);

      default:
        throw FetchDataException(
            'Error occur while communication with Server', response.statusCode);
    }
  }

  static String parsingDoseNotExist(String body) {
    final errorsMap = json.decode(body);
    try {
      if (errorsMap['notification'] != null) {
        return errorsMap['notification'];
      }
      if (errorsMap['message'] != null) {
        return errorsMap['message'];
      }
    } catch (e) {
      log(e.toString(), name: _className);
    }
    return 'Credentials does not match';
  }

  static String parsingError(String body) {
    final errorsMap = json.decode(body);
    try {
      if (errorsMap['errors'] != null) {
        final errors = errorsMap['errors'] as Map;
        final firstErrorMsg = errors.values.first;
        if (firstErrorMsg is List) return firstErrorMsg.first;
        return firstErrorMsg.toString();
      }
      if (errorsMap['message'] != null) {
        return errorsMap['message'];
      }
    } catch (e) {
      log(e.toString(), name: _className);
    }

    return 'Unknown error';
  }
}
