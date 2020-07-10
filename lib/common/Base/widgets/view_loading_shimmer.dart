import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';
import 'package:xy_wallet/common/themes.dart';

class LoadingViewShimmer extends StatelessWidget {
  final Widget child;

  LoadingViewShimmer({@required this.child});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      physics: const NeverScrollableScrollPhysics(),
      child: Shimmer.fromColors(
        baseColor: ThemeColors.accentColor,
        highlightColor: ThemeColors.labelLightColor,
        child: child,
      ),
    );
  }
}
