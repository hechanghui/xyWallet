import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
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
  List<String> _tabLabels;
  List<Widget> _subPages;

  @override
  void initState() {
    super.initState();
    _viewModel = TransactionRecordViewModel();
    _tabLabels = List.of([S.current.all, S.current.transfer, S.current.receipt]);
    _subPages = List.of([
      TransactionListPage(TransactionType.ALL, _viewModel),
      TransactionListPage(TransactionType.TRANSFER, _viewModel),
      TransactionListPage(TransactionType.RECEIPT, _viewModel),
    ]);
  }

  @override
  Widget buildBodyWidget(BuildContext context) {
    return DefaultTabController(
      length: _tabLabels.length,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        mainAxisSize: MainAxisSize.max,
        children: [
          TabBar(
              labelColor: Theme.of(context).textTheme.subtitle1.color,
              unselectedLabelColor: ThemeStyles.getSubtitle1lLight(context).color,
              indicatorSize: TabBarIndicatorSize.tab,
              indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
              tabs: _tabLabels.map((e) => Tab(text: e)).toList()),
          Expanded(
            child: TabBarView(
              physics: ScrollPhysics(),
              children: _subPages,
            ),
          ),
        ],
      ),
    );
  }
}
