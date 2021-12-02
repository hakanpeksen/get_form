import 'package:flutter/material.dart';

import 'text_style.dart';

/// NAME         SIZE  WEIGHT  SPACING
/// headline1    96.0  light   -1.5
/// headline2    60.0  light   -0.5
/// headline3    48.0  regular  0.0
/// headline4    34.0  regular  0.25
/// headline5    24.0  regular  0.0
/// headline6    20.0  medium   0.15
/// subtitle1    16.0  regular  0.15
/// subtitle2    14.0  medium   0.1
/// body1        16.0  regular  0.5   (bodyText1)
/// body2        14.0  regular  0.25  (bodyText2)
/// button       14.0  medium   1.25
/// caption      12.0  regular  0.4
/// overline     10.0  regular  1.5

const String fontFamily = 'Lato';

class AppTheme {
  static ThemeData get lightTheme {
    return ThemeData.light().copyWith(
      textTheme: ThemeData.light()
          .textTheme
          .copyWith(
            subtitle1: AppTextStyles.subtitle1,
            subtitle2: AppTextStyles.subtitle2,
            headline6: AppTextStyles.h6,
            button: AppTextStyles.button,
          )
          .apply(fontFamily: fontFamily),
    );
  }
}
