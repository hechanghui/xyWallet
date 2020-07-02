import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// widget扩展方法
extension WidgetEx on Widget {
  Padding padding(EdgeInsetsGeometry padding) {
    return Padding(padding: padding, child: this);
  }

  InkWell click([Alignment alignment = Alignment.center]) {
    return InkWell(
      child: Align(
        alignment: alignment,
        widthFactor: 1.4,
        heightFactor: 1.4,
        child: this,
      ),
    );
  }

  Center center() {
    return Center(child: this);
  }
  
}