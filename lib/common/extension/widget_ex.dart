import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';

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

  DecoratedBox bgColor({
    Color color,
    DecorationImage image,
    BoxBorder border,
    BorderRadiusGeometry borderRadius,
    List<BoxShadow> boxShadow,
    Gradient gradient,
    BlendMode backgroundBlendMode,
    BoxShape shape = BoxShape.rectangle,
  }) {
    return DecoratedBox(
      decoration: BoxDecoration(
        color: color,
        image: image,
        border: border,
        borderRadius: borderRadius,
        boxShadow: boxShadow,
        gradient: gradient,
        backgroundBlendMode: backgroundBlendMode,
        shape: shape,
      ),
      child: this,
    );
  }

  Container backImage({String image, EdgeInsetsGeometry padding}) {
    return Container(
      padding: padding,
      decoration: BoxDecoration(
          image: DecorationImage(
        image: AssetImage(
          ImageHelper.wrapAssets(image ?? 'input_large_bg.png'),
        ),
        fit: BoxFit.fill,
      )),
      child: this,
    );
  }
}
