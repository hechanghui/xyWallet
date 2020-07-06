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

class _PageState extends BaseWidgetState<TransactionRecordPage>
    with SingleTickerProviderStateMixin {
  @override
  String titleLabel(BuildContext context) => S.current.transferRecord;

  TransactionRecordViewModel _viewModel;

  TabController _tabController;

  @override
  void initState() {
    super.initState();
    _tabController = new TabController(vsync: this, length: 3);
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
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        TabBar(
            labelColor: Theme.of(context).textTheme.subtitle1.color,
            unselectedLabelColor: ThemeStyles.getSubtitle1lLight(context).color,
            indicatorSize: TabBarIndicatorSize.tab,
            indicatorPadding: EdgeInsets.symmetric(horizontal: 16),
            controller: _tabController,
            tabs: tabLabels.map((e) => Tab(text: e)).toList()),
        Expanded(
          child: TabBarView(
            controller: _tabController,
            physics: ScrollPhysics(),
            children: subPages,
          ),
        ),
      ],
    );
  }
}
