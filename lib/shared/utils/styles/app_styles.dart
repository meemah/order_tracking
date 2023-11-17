import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:order_tracking/shared/utils/theme/app_colors.dart';

class AppStyle {
  static TextStyle largeTextRegular(
      {double fontSize = 30,
      FontWeight fontWeight = FontWeight.w400,
      Color color = AppColors.blackText1}) {
    return TextStyle(
        fontSize: fontSize.sp, fontWeight: fontWeight, color: color);
  }

  static TextStyle normalTextRegular(
      {double fontSize = 14,
      FontWeight fontWeight = FontWeight.w400,
      Color color = AppColors.blackText1}) {
    return TextStyle(
        fontSize: fontSize.sp, fontWeight: fontWeight, color: color);
  }

  static TextStyle mediumTextRegular(
      {double fontSize = 16,
      FontWeight fontWeight = FontWeight.w400,
      Color color = AppColors.blackText1}) {
    return TextStyle(
        fontSize: fontSize.sp, fontWeight: fontWeight, color: color);
  }

  static TextStyle mediumTextMedium(
      {double fontSize = 16,
      FontWeight fontWeight = FontWeight.w600,
      Color color = AppColors.blackText1}) {
    return TextStyle(
        fontSize: fontSize.sp, fontWeight: fontWeight, color: color);
  }

  static TextStyle smallTextRegular(
      {double fontSize = 12,
      FontWeight fontWeight = FontWeight.w400,
      Color color = AppColors.blackText1}) {
    return TextStyle(
        fontSize: fontSize.sp, fontWeight: fontWeight, color: color);
  }
}
