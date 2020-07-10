import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:xy_wallet/common/themes.dart';

class LoadingViewShimmerList extends StatelessWidget {
  final EdgeInsetsGeometry padding;
  final int length;
  final IndexedWidgetBuilder builder;

  LoadingViewShimmerList(
      {this.length: 6, //一般屏幕长度够用
      this.padding = const EdgeInsets.all(7),
      @required this.builder});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Shimmer.fromColors(
          period: Duration(milliseconds: 1200),
          baseColor: ThemeColors.accentColor,
          highlightColor: ThemeColors.labelLightColor,
          child: Padding(
              padding: padding,
              child: Column(
                children: List.generate(length, (index) => builder(context, index)),
              ))),
    );
  }
}
