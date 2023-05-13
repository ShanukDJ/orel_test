import 'package:dio/dio.dart';
import 'package:orel_test/models/common%20_model.dart';

import '../interceptors/dio_logger.dart';
import '../models/other.dart';
import '../networks(EM)/base.dart';
import '../networks(EM)/exception.dart';


class ChallengesRepo extends BaseApi {
  ChallengesRepo()
      : super(interceptors: [
    QueuedInterceptor(),
    PrettyDioLogger()
  ]);

  Future<ApiResponseData<CommonModel?>> getNews(
      String category) async {
    try {
      Response response = await get('/news', queryParameters: {
        "category" : category
      });
      CommonModel newsResponse =
      CommonModel.fromJson(response.data);
      if (newsResponse.success != null && newsResponse.success!) {
        print("data::::::");
        print(newsResponse.data);
        print(newsResponse.success);
        return ApiResponseData<CommonModel?>(
          success: true,
          category: newsResponse.category!,
          data: newsResponse,
          error: ''
        );
      } else {
        return ApiResponseData<CommonModel?>(
          success: false,
          category: newsResponse.category!,
          data: newsResponse,
          error: newsResponse.error ?? "Something went wrong! Please try again later."
        );
      }
    } on DioError catch (e) {
      return onDioError<CommonModel?>(e);
    } catch (e) {
      return onError<CommonModel?>(e);
    }
  }
}
