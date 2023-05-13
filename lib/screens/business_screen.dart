import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../bloc/science_news_bloc.dart';
import '../models/common _model.dart';
import '../networking/response.dart';
import '../ui_helpers/colors.dart';
import '../ui_helpers/text_styles.dart';
import '../widgets/app_image.dart';
import '../widgets/header_bar.dart';
import '../widgets/list_view_header.dart';
import '../widgets/news_list_tile.dart';

class BusinessScreen extends StatefulWidget {
  const BusinessScreen({Key? key}) : super(key: key);

  @override
  State<StatefulWidget> createState() => _QualificationsScreenState();
}

class _QualificationsScreenState extends State<BusinessScreen> {
  late NewsBloc _bloc;
  late ScrollController _scrollController;
  int? nextPage;
  bool all = true;

  @override
  void initState() {
    // WidgetsBinding.instance.addPostFrameCallback((timeStamp) => getData());
    _bloc = NewsBloc();
    super.initState();
    _scrollController = ScrollController();
    _bloc.newsBloc("business");
  }

  @override
  Widget build(BuildContext context) {
    ScreenUtil.init(context);
    return Scaffold(
      primary: true,
      body: Stack(
        children: [
          //heading bar with title
          const HeaderBar(),
          //list view integration
          _bodyContent()
        ],
      ),
    );
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
              const ListViewHeader(title: 'Business'),

//data assigning inside the stream builder
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
                                itemCount: snapshot.data!.data!.data!.length,
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
            ],
          ),
        ),
      ),
    );
  }

  @override
  void dispose() {
    _scrollController.dispose();
    super.dispose();
  }
}
