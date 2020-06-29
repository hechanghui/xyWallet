import 'package:flutter/material.dart';

class ThemeColors {
  static const Color accentColor = Color(0xFF00F2FF);
  static const Color primaryColor = Color(0xFF122C50);
  static const Color buttonColor = Color(0xFF003D53);
  static const Color labelLightColor = Color(0xFF3F7591);
}

class ThemeDimens {
  //页面左右边距
  static const double pageLRMargin = 15;
  //页面竖直方向间距
  static const double pageVerticalMargin = 6;
  //底部操作区距离底部边距
  static const double pageBottomMargin = 35;
}

class ThemeStyles{
  static TextStyle getSubtitle1lLight(BuildContext context)
  {
    return Theme.of(context).textTheme.subtitle1.copyWith(color:ThemeColors.labelLightColor);
  }
}
