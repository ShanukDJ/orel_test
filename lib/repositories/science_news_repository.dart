
import '../models/common _model.dart';
import '../networking/api_provider.dart';

class NewsRepository {
  final ApiProvider _provider = ApiProvider();
  var requestHeaders;

  Future<CommonModel> getNews(String endPoint) async {

    //headers assigning
    requestHeaders = <String, String>{
      'Content-Type': 'Application/json',
    };

    //Api call
    final response = await _provider.getData(
        "https://inshorts.deta.dev/news?category=$endPoint", requestHeaders);

    return CommonModel.fromJson(response);
  }
}

// class FacilitiesRepository {
//   Future<dynamic> getFacilitiesData() async {
//     return await MyDio().getData(endPoint: "science");
//   }
// }
