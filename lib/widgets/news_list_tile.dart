import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orel_test/models/common%20_model.dart';
import '../ui_helpers/colors.dart';
import '../ui_helpers/text_styles.dart';
import 'app_image.dart';

class NewsListTile extends StatelessWidget {
  const NewsListTile({Key? key, required this.commonModel, required this.index})
      : super(key: key);

  final CommonModel commonModel;
  final int index;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(8),
          border: Border.all(color: AppColors.colorYellow.withOpacity(0.8))),
      child: Padding(
        padding: EdgeInsets.symmetric(vertical: 12.h),
        child: ListTile(
          leading: AppNetworkImageView(
              width: 60,
              height: 60,
              url: commonModel.data![index].imageUrl.toString(),
              meta: "",
              borderRadius: BorderRadius.circular(30),
              shape: BoxShape.rectangle,
              fit: BoxFit.cover),
          title: SizedBox(
            width: 280,
            child: Text(
                maxLines: 2,
                commonModel.data![index].title.toString(),
                overflow: TextOverflow.ellipsis,
                style: size15BoldStyle(textColor: Colors.black)),
          ),
          subtitle: Padding(
            padding: EdgeInsets.only(top: 8.h),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Icon(
                  Icons.access_time,
                  color: Colors.grey,
                  size: 16,
                ),
                SizedBox(
                  width: 4.w,
                ),
                SizedBox(
                  width: 100,
                  child: Text(commonModel.data![index].author.toString(),
                      overflow: TextOverflow.ellipsis,
                      style: size12Style(
                          textColor: Colors.black.withOpacity(0.4))),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
