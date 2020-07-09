import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/provider/provider_widget.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/pages/finance/transaction_list.dart';
import 'package:xy_wallet/ui/pages/finance/vm/transaction_record_vm.dart';

class TransactionRecordPage extends BaseWidget {
  @override
  _PageState getState() => _PageState();
}

class _PageState extends BaseWidgetState<TransactionRecordPage> {
  @override
  String titleLabel(BuildContext context) => S.current.transferRecord;
  @override
  bool get wantKeepAlive => true;

  TransactionRecordViewModel _viewModel;

  @override
  void initState() {
    super.initState();
    _viewModel = TransactionRecordViewModel();
  }

  @override
  Widget buildBodyWidget(BuildContext context) {
    var tabLabels = List.of(
        [S.of(context).all, S.of(context).transfer, S.of(context).receipt]);
    var subPages = List.of([
      TransactionListPage(TransactionType.ALL, _viewModel),
      TransactionListPage(TransactionType.TRANSFER, _viewModel),
      TransactionListPage(TransactionType.RECEIPT, _viewModel),
    ]);
    return DefaultTabController(
      length: tabLabels.length,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          TabBar(
              labelColor: Theme.of(context).textTheme.subtitle1.color,
              unselectedLabelColor:
                  ThemeStyles.getSubtitle1lLight(context).color,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
              tabs: tabLabels.map((e) => Tab(text: e)).toList()),
          Expanded(
            child: TabBarView(
              physics: ScrollPhysics(),
              children: subPages,
            ),
          ),
        ],
      ),
    );
  }
}
