import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:orel_test/ui_helpers/colors.dart';

TextStyle? size15BoldStyle({
  Color? textColor,
  double? letterSpacing = 0.0,
}) =>
    TextStyle(
        color: textColor ?? AppColors.colorWhite,
        fontSize: 15.sp,
        letterSpacing: letterSpacing,
        fontWeight: FontWeight.bold);

TextStyle? size12Style({
  Color? textColor,
  double? letterSpacing = 0.0,
}) =>
    TextStyle(
      color: textColor ?? AppColors.colorBlack,
      fontSize: 12.sp,
      fontWeight: FontWeight.w600,
      letterSpacing: letterSpacing,
    );
