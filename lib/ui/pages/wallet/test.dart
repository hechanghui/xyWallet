import 'package:flutter/material.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/base/widgets/view_loading_shimmer.dart';
import 'package:xy_wallet/ui/widgets/shimmer/transaction_details_shimmer.dart';

class TestPage extends BaseWidget {
  @override
  _TestPageState getState() => _TestPageState();
}

class _TestPageState extends BaseWidgetState<TestPage> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget buildBodyWidget(BuildContext context) {}

  /// Create one series with sample hard coded data.

}

/// Sample linear data type.
class LinearSales {
  final int year;
  final int sales;

  LinearSales(this.year, this.sales);
}
