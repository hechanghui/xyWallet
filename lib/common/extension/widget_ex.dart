import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';

/// widget扩展方法
extension WidgetEx on Widget {
  Padding padding(EdgeInsetsGeometry padding) {
    return Padding(padding: padding, child: this);
  }

  InkWell click({
    Alignment alignment = Alignment.center,
    GestureTapCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      child: Align(
        alignment: alignment,
        widthFactor: 1.2,
        heightFactor: 1.2,
        child: this,
      ),
    );
  }

  Center center() {
    return Center(child: this);
  }

  DecoratedBox border(
    BoxBorder border,
    /**  {
    Color color,
    DecorationImage image,
    BorderRadiusGeometry borderRadius,
    Gradient gradient,
    BlendMode backgroundBlendMode,
    BoxShape shape = BoxShape.rectangle,
  } */
  ) {
    return DecoratedBox(
      decoration: BoxDecoration(
        border: border,
      ),
      child: this,
    );
  }
}
