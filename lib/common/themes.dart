import 'package:flutter/material.dart';

class ThemeColors {
  //前景色
  static const Color accentColor = Color(0xFF00F2FF);
  //
  static const Color primaryColor = Color(0xFF122C50);
  //按钮颜色
  static const Color buttonColor = Color(0xFF003D53);
  //label高亮
  static const Color labelLightColor = Color(0xFF3F7591);
  //次级标题背景
  static const Color accentDartColor = Color(0xFF082E41);
    //次级标题前景
  static const Color accentDartFgColor = Color(0xFF3FA0B3);

}

class ThemeDimens {
  //页面左右边距
  static const double pageLRMargin = 15;
  //页面竖直方向间距
  static const double pageVerticalMargin = 6;
  //底部操作区距离底部边距
  static const double pageBottomMargin = 35;
}

class ThemeStyles {
  static TextStyle getSubtitle1lLight(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .subtitle1
        .copyWith(color: ThemeColors.labelLightColor);
  }
  static TextStyle getSubtitle2lLight(BuildContext context) {
    return Theme.of(context)
        .textTheme
        .subtitle1
        .copyWith(color: ThemeColors.accentDartFgColor);
  }
}
