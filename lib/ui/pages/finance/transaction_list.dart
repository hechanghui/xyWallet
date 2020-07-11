import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/pages/finance/vm/transaction_record_vm.dart';
import 'package:xy_wallet/ui/widgets/common_input_minor.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';
import 'package:xy_wallet/ui/widgets/item_transaction.dart';

enum TransactionType {
  ALL,
  TRANSFER,
  RECEIPT,
}

class TransactionListPage extends BaseWidget {
  final TransactionType type;
  final TransactionRecordViewModel viewModel;
  TransactionListPage(this.type, this.viewModel);
  @override
  _PageState getState() => _PageState();
}

class _PageState extends BaseLoadListDataWidgetState<TransactionListPage, TransactionRecordListViewModel> {
  @override
  bool get wantKeepAlive => true;
  @override
  bool get hasBackground => false;

  @override
  bool get hasAppBar => false;

  @override
  TransactionRecordListViewModel onCreateViewModel() {
    return widget.viewModel.getListViewModel(widget.type);
  }

  @override
  Widget buildRefreshWidget(BuildContext context) {
    return NestedScrollView(
      headerSliverBuilder: (context, innerBoxIsScrolled) {
        return <Widget>[
          SliverAppBar(
            backgroundColor: Colors.transparent,
            automaticallyImplyLeading: false,
            // floating: true,
            // pinned: false,
            // snap: true,
            flexibleSpace: CommonInputMinor(
              controller: viewModel.keywordController,
              maxLines: 1,
              textInputAction: TextInputAction.search,
              placeholder: S.current.addrOrTxId,
              onSubmitted: (e) {
                viewModel.search();
                viewModel.keywordController.value = TextEditingValue(text: e);
                hideInputKeyboard(context);
              },
              right: Image.asset(ImageHelper.wrapAssets('icon_search.png'), width: 22, color: ThemeColors.primaryFgColor
                      // fit: BoxFit.contain,
                      )
                  .click(onTap: () {
                hideInputKeyboard(context);
                viewModel.search();
              }),
            ),
          ),
        ];
      },
      body: SmartRefresher(
        controller: viewModel.refreshController,
        enablePullUp: true,
        onRefresh: viewModel.refresh,
        onLoading: viewModel.loadMore,
        child: buildBodyWidget(context),
      ).padding(EdgeInsets.only(top: ThemeDimens.pageVerticalMargin * 2)),
    ).padding(EdgeInsets.only(
      left: ThemeDimens.pageLRMargin,
      right: ThemeDimens.pageLRMargin,
      top: ThemeDimens.pageVerticalMargin * 2,
    ));
  }

  @override
  Widget buildBodyWidget(BuildContext context) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var item = viewModel.datas[index];
        return TransactionItem(
          item,
          index: index,
        ).padding(EdgeInsets.only(bottom: ThemeDimens.pageVerticalMargin));
      },
      itemCount: viewModel.datas.length,
    );
  }
}
