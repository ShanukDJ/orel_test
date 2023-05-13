import 'dart:io';
import 'package:dio/dio.dart';
import 'api_result_handler.dart';

class MyDio {
  late Dio dio;

  MyDio() {
    BaseOptions baseOptions = BaseOptions(
      baseUrl: 'https://inshorts.deta.dev',
      receiveDataWhenStatusError: true,
      connectTimeout: 30 * 1000,
      receiveTimeout: 30 * 1000,
    );
    dio = Dio(baseOptions);
  }

  Future<ApiResults> getData({
    required String endPoint,
    String? token,
  }) async {
    dio.options.headers = {
      "Content-Type": "application/json",
    };

    try {
      var response = await dio.get(endPoint,
          queryParameters: {
          'category': endPoint,
          }
      );
      // printResponse(response.statusCode.toString());
      // printResponse('base:    ${dio.options.baseUrl}');
      // printResponse('url:    $endPoint');
      // printResponse('header:    ${dio.options.headers}');
      // printResponse('queryParameters:    $queryParameters');
      // printResponse('response:    $response');
      return ApiSuccess(response.data, response.statusCode);
    } on SocketException {
      return ApiFailure("There is no internet connection!");
    } on FormatException {
      return ApiFailure("An error occurred in the data format!");
    } on DioError catch (e) {
      if (e.type == DioErrorType.response) {
        return ApiFailure(e.message);
      } else if (e.type == DioErrorType.connectTimeout) {
        return ApiFailure("Make sure you are connected to the internet");
      } else if (e.type == DioErrorType.receiveTimeout) {
        return ApiFailure("Unable to connect to the server!");
      } else {
        return ApiFailure("An error occurred, try again!");
      }
    } catch (e) {
      return ApiFailure("An error occurred, try again!");
    }
  }}