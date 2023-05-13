import 'package:dio/dio.dart';
import 'package:orel_test/models/common_model.dart';
import '../interceptors/dio_logger.dart';
import '../networks/base.dart';
import '../networks/exception.dart';


class NewsRepository extends BaseApi {
  NewsRepository()
      : super(interceptors: [
    QueuedInterceptor(),
    PrettyDioLogger()
  ]);


  //parameters assigning and error handling with API call
  Future<dynamic> getNews(
      String category) async {
    try {
      Response response = await get('/news', queryParameters: {
        "category" : category
      });
      CommonModel newsResponse =
      CommonModel.fromJson(response.data);
      if (newsResponse.success != null && newsResponse.success!) {
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
