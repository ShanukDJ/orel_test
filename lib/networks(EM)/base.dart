import 'dart:async';

import 'package:dio/dio.dart';

import '../constant/urls.dart';

abstract class BaseApi {
  late final Dio _dio;

  BaseApi({List<Interceptor> interceptors = const []}) {
    _dio = Dio(BaseOptions(
      baseUrl: AppUrls.apiEndpoint.toString(),
      connectTimeout: 10000,
      receiveTimeout: 15000,
      headers: {
        'Accept': 'application/json',
      },
      contentType: "application/x-www-form-urlencoded",
      responseType: ResponseType.json,
    ))
      ..interceptors.addAll(interceptors);
  }

  Future<Response<Map<String, dynamic>>> get(String path,
      {Map<String, dynamic>? queryParameters,
      Map<String, dynamic>? headers}) async {
    Response response = await _dio.get(path,
        queryParameters: queryParameters, options: Options(headers: headers));
    if (response.statusCode == 204) {
      return Response(
          data: <String, dynamic>{
            'success': true,
            'data': null,
          },
          statusCode: response.statusCode,
          requestOptions: response.requestOptions,
          statusMessage: response.statusMessage);
    } else {
      return Response(
          data: response.data,
          statusCode: response.statusCode,
          requestOptions: response.requestOptions,
          statusMessage: response.statusMessage);
    }
  }
}
