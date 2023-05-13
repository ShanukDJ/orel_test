import 'custom_exceptions.dart';
import 'package:http/http.dart' as http;
import 'dart:io';
import 'dart:convert';
import 'dart:async';

class ApiProvider {
  int timeout = 20; //seconds


  // data retrieving and exceptions handling
  Future<dynamic> getData(String url, requestHeaders) async {
    var responseJson;
    try {
      final response = await http
          .get(Uri.parse(url), headers: requestHeaders)
          .timeout(Duration(seconds: timeout), onTimeout: () async {
        throw TimeoutException("Server Time Out");
      });
      responseJson = _response(response);
    } on SocketException {
      throw FetchDataException("No Internet");
    }
    return responseJson;
  }

  dynamic _response(http.Response response) {
    switch (response.statusCode) {
      case 200:
        try {
          var responseJson = json.decode(response.body.toString());
          return responseJson;
        } on FormatException {
          throw ServerError(response.body.toString());
        }
      case 400:
        throw BadRequestException(response.body.toString());
      case 401:
      case 403:
        throw UnauthorisedException(response.body.toString());
      case 500:
      default:
        throw FetchDataException("Error with code${response.statusCode}");
    }
  }
}
