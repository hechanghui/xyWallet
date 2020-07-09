import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class LoadingViewShimmer extends StatelessWidget {
  final Widget child;

  LoadingViewShimmer(
      this.child);

  @override
  Widget build(BuildContext context) {
    var theme = Theme.of(context);
    bool isDark = theme.brightness == Brightness.dark;

    return SingleChildScrollView(
      physics: NeverScrollableScrollPhysics(),
      child: Shimmer.fromColors(
          period: Duration(milliseconds: 1200),
          baseColor: isDark ? Colors.grey[700] : Colors.grey[350],
          highlightColor: isDark ? Colors.grey[500] : Colors.grey[200],
          child: child),
    );
  }
}
