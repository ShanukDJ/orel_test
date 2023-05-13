import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orel_test/models/common%20_model.dart';

import '../ui_helpers/colors.dart';
import '../ui_helpers/text_styles.dart';
import 'app_image.dart';

class HeaderBar extends StatelessWidget {
  const HeaderBar({Key? key})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      decoration: BoxDecoration(color: AppColors.colorYellow.withOpacity(0.8)),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: EdgeInsets.only(top: 55.h),
            child:
            Text("NEWS", style: size15BoldStyle(textColor: Colors.white)),
          ),
        ],
      ),
    );
  }
}
