import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';

/// widget扩展方法
extension WidgetEx on Widget {
  Padding padding(EdgeInsetsGeometry padding) {
    return Padding(padding: padding, child: this);
  }

  InkWell click({Alignment alignment = Alignment.center,GestureTapCallback onTap}) {
    return InkWell(
      onTap: onTap,
      child: Align(
        alignment: alignment,
        widthFactor: 1.1,
        heightFactor: 1.1,
        child: this,
      ),
    );
  }

  Center center() {
    return Center(child: this);
  }
  
}
