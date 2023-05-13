import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orel_test/bloc/news_bloc.dart';
import 'package:orel_test/models/common_model.dart';
import '../networks/response.dart';
import '../widgets/list_view_header.dart';
import '../widgets/news_list_tile.dart';

class ScienceScreen extends StatefulWidget {
  const ScienceScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QualificationsScreenState();
}

class _QualificationsScreenState extends State<ScienceScreen> {
  late NewsBloc _bloc;
  late ScrollController _scrollController;

  @override
  void initState() {
    super.initState();
    _bloc = NewsBloc();
    _scrollController = ScrollController();
    _bloc.newsBloc("science");
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return _bodyContent();
  }

  Widget _bodyContent() {
    return Padding(
      padding: EdgeInsets.only(top: 90.h),
      child: Container(
        decoration: const BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.only(
            topLeft: Radius.circular(30.0),
            topRight: Radius.circular(30.0),
          ),
        ),
        child: Padding(
          padding: EdgeInsets.symmetric(
            horizontal: 16.h,
          ),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const ListViewHeader(title: 'Science'),
              Expanded(
                child: Stack(children: [
                  Positioned(
                    child: StreamBuilder<Response<CommonModel>>(
                      stream: _bloc.stream,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          switch (snapshot.data!.status) {
                            case Status.LOADING:
                              return const Center(
                                  child: CircularProgressIndicator());
                            case Status.COMPLETED:
                              return ListView.separated(
                                padding: EdgeInsets.symmetric(vertical: 22.h),
                                itemCount: snapshot.data!.data == null
                                    ? 0
                                    : snapshot.data!.data!.data!.length,
                                controller: _scrollController,
                                scrollDirection: Axis.vertical,
                                shrinkWrap: true,
                                separatorBuilder:
                                    (BuildContext context, int index) {
                                  return SizedBox(
                                    height: 14.h,
                                  );
                                },
                                itemBuilder: (context, index) {
                                  return NewsListTile(
                                      commonModel: snapshot.data!.data!,
                                      index: index);
                                },
                              );
                            case Status.ERROR:
                              break;
                            default:
                              break;
                          }
                        }
                        return Container();
                      },
                    ),
                  ),
                ]),
              ),
              SizedBox(
                height: 4.h,
              ),
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    // Clean up the controller when the Widget is removed from the Widget tree
    _scrollController.dispose();
    super.dispose();
  }
}
