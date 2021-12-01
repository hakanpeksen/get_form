import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import 'app_color.dart';

class AppTextStyles {
  static const _textStyleLight = TextStyle(
    color: AppColors.black,
  );

  /// Design: subtitle1:Lato,Bold,18
  static final subtitle1 = _textStyleLight.copyWith(
    fontSize: 18.sp,
    fontWeight: FontWeight.w700,
  );

  /// Design: subtitle2:Lato,regular,13, opacity:0.4
  static final subtitle2 = _textStyleLight.copyWith(
    fontSize: 13.sp,
    fontWeight: FontWeight.w400,
  );

  static final h6 = _textStyleLight.copyWith(
    fontSize: 20.sp,
    fontWeight: FontWeight.w700,
  );

  //static final cardSubtitle3 = subtitle2.copyWith(color: AppColors.black.withOpacity(0.8));

  static final circleInputDecoration =
      OutlineInputBorder(borderRadius: BorderRadius.circular(40.r));
}
