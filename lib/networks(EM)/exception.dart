

import 'package:dio/dio.dart';

import '../models/other.dart';

ApiResponseData<T?> onDioError<T>(DioError e) {
  if (e.response != null) {
    return ApiResponseData<T?>(
      success: false,
      error: e.response?.data['message'] ?? '',
      data: null,
    );
  } else {
    return ApiResponseData<T?>(
      success: false,
      error: e.message,
      data: null,
    );
  }
}

ApiResponseData<T?> onError<T>(Object e) {
  return ApiResponseData<T?>(
    success: false,
    error: e.toString(),
    data: null,
  );
}

class ApiResponseData<T> {
  final bool success;
  final String error;
  final String category;
  final T? data;

  ApiResponseData({
    this.success = true,
    this.category = '',
    this.error = '',
    this.data,
  });
}


