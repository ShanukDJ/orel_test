// Created by Lakmalil on 2/7/2022.

import 'dart:async';
import 'package:orel_test/models/common%20_model.dart';
import 'package:orel_test/networks(EM)/exception.dart';
import 'package:orel_test/repositories/science_news_repository.dart';

import '../models/other.dart';
import '../network/api_result_handler.dart';
import '../networking/response.dart' as response;
import '../networking/response.dart';
import '../repositories/repo.dart';

class NewsBloc {
  // late FacilitiesRepository _repository;
  late NewsRepository _reposi;
  late ChallengesRepo _repo;
  StreamController? _controller;

  StreamSink<Response<CommonModel>> get sink => _controller!.sink as StreamSink<Response<CommonModel>>;
  Stream<Response<CommonModel>> get stream => _controller!.stream as Stream<Response<CommonModel>>;

  NewsBloc() {
    _controller = StreamController<Response<CommonModel>>();
    // _repository = FacilitiesRepository();
    _reposi =   NewsRepository();
    // _repo = ChallengesRepo();
  }

  newsBloc(String endPoint) async {
    sink.add(Response.loading(''));
    try {
      CommonModel res = await _reposi.getNews(endPoint);
      sink.add(Response.completed(res));
    } catch (e) {
      sink.add(Response.error(e.toString()));
    }
  }


  dispose() {
    _controller?.close();
  }
}