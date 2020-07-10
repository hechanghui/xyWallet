import 'package:flutter/material.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/base/widgets/view_loading_shimmer.dart';
import 'package:xy_wallet/ui/widgets/shimmer/transaction_details_shimmer.dart';

class TestPage extends BaseWidget {
  @override
  _TestPageState getState() => _TestPageState();

}

class _TestPageState extends BaseWidgetState<TestPage> {
  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(
  //       title: const Text('Loading List'),
  //     ),
  //     body: LoadingViewShimmer(
  //       child: TransactionDetailsShimmer(),
  //     ),
  //   );
  // }

  @override
  Widget buildBodyWidget(BuildContext context) {
    return LoadingViewShimmer(
        child: TransactionDetailsShimmer(),
      );
  }
}
