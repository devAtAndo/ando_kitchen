import 'package:ando_kitchen_order/utils/theme/theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class AndoTextStyle {
  static TextStyle headingLMedium(
      {double fontSize = 28,
      FontWeight fontWeight = FontWeight.w500,
      Color color = AndoColors.neutral100}) {
    return TextStyle(
        fontSize: fontSize.sp, fontWeight: fontWeight, color: color);
  }

  static TextStyle textLRegular(
      {double fontSize = 16,
      FontWeight fontWeight = FontWeight.w400,
      Color color = AndoColors.neutral100}) {
    return TextStyle(
        fontSize: fontSize.sp, fontWeight: fontWeight, color: color);
  }

  static TextStyle textMRegular(
      {double fontSize = 14,
      FontWeight fontWeight = FontWeight.w400,
      Color color = AndoColors.neutral100}) {
    return TextStyle(
        fontSize: fontSize.sp, fontWeight: fontWeight, color: color);
  }
}
