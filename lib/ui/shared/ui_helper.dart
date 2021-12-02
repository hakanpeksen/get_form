import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class UIHelper {
  static dynamicHeight(double height) => ScreenUtil().setHeight(height);
  static dynamicWidth(double width) => ScreenUtil().setWidth(width);
  static dynamicSp(double fontsize) => ScreenUtil().setSp(fontsize);

  static const double space0 = 0;
  static const double space5 = 5;
  static const double space10 = 10;
  static const double space14 = 14;
  static const double space15 = 15;
  static const double space20 = 20;
  static const double space25 = 25;
  static const double space30 = 30;
  static const double space35 = 35;
  static const double space40 = 40;
  static const double space50 = 50;

// Height SizedBox
  static Widget get heightSpace5 => SizedBox(height: 5.h);
  static Widget get heightSpace10 => SizedBox(height: 10.h);
  static Widget get heightSpace15 => SizedBox(height: 15.h);
  static Widget get heightSpace18 => SizedBox(height: 18.h);
  static Widget get heightSpace23 => SizedBox(height: 23.h);

// Width SizedBox
  static Widget get widthSpace13 => SizedBox(width: 13.w);

  static Widget get verticalSpace5 => SizedBox(height: dynamicHeight(space5));
  static Widget get verticalSpace => SizedBox(height: dynamicHeight(space10));
  static Widget get verticalSpaceLarge => SizedBox(height: dynamicHeight(space10 * 5));

  static Widget get horizontalSpace => SizedBox(width: dynamicWidth(space10));
}
