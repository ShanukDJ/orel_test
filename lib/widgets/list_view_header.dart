import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import '../ui_helpers/text_styles.dart';

class ListViewHeader extends StatelessWidget {
  const ListViewHeader({Key? key, required this.title}) : super(key: key);

  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        SizedBox(
          height: 40.h,
        ),
        Text(title, style: size15BoldStyle(textColor: Colors.black)),
        SizedBox(height: 6.h),
        Text("Here is your ${title.toLowerCase()} news",
            style: size12Style(textColor: Colors.black.withOpacity(0.4))),
      ],
    );
  }
}
