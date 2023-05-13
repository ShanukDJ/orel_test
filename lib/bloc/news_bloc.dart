// Created by Lakmalil on 2/7/2022.

import 'dart:async';
import 'package:orel_test/models/common_model.dart';
import '../networks/exception.dart';
import '../networks/response.dart';
import '../repositories/repo.dart';

class NewsBloc {

  late NewsRepository _newsRepository;
  StreamController? _controller;

  //streams handling with model class
  StreamSink<Response<CommonModel>> get sink => _controller!.sink as StreamSink<Response<CommonModel>>;
  Stream<Response<CommonModel>> get stream => _controller!.stream as Stream<Response<CommonModel>>;

  //repositories and controllers initializations
  NewsBloc() {
    _controller = StreamController<Response<CommonModel>>();
    _newsRepository = NewsRepository();
  }

  //bloc call with the API
  newsBloc(String endPoint) async {
    sink.add(Response.loading(''));
    try {
      ApiResponseData<CommonModel?> res = await _newsRepository.getNews(endPoint);
      sink.add(Response.completed(res.data));
    } catch (e) {
      sink.add(Response.error(e.toString()));
    }
  }


  dispose() {
    _controller?.close();
  }
}