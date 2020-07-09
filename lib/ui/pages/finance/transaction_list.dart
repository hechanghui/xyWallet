import 'dart:async';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:pull_to_refresh/pull_to_refresh.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/provider/provider_widget.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/model/response_beans.dart';
import 'package:xy_wallet/ui/pages/finance/vm/transaction_record_vm.dart';
import 'package:xy_wallet/ui/widgets/common_input_minor.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';
import 'package:xy_wallet/ui/widgets/item_transaction.dart';

enum TransactionType {
  ALL,
  TRANSFER,
  RECEIPT,
}

class TransactionListPage extends StatefulWidget {
  final TransactionType type;
  final TransactionRecordViewModel viewModel;
  TransactionListPage(this.type, this.viewModel);
  @override
  _PageState createState() => _PageState();
}

class _PageState extends State<TransactionListPage>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  RefreshController _refreshController =
      RefreshController(initialRefresh: false);

  @override
  void initState() {
    super.initState();
    switch (widget.type) {
      case TransactionType.RECEIPT:
        widget.viewModel.itemsReceipt.addAll([
          TransactionItemBean(),
          TransactionItemBean(),
          TransactionItemBean(),
          TransactionItemBean(),
          TransactionItemBean(),
          TransactionItemBean(),
        ]);
        break;
      case TransactionType.TRANSFER:
        widget.viewModel.itemsTransfer.addAll([
          TransactionItemBean()..out = true,
          TransactionItemBean()..out = true,
          TransactionItemBean()..out = true,
          TransactionItemBean()..out = true,
          TransactionItemBean()..out = true,
        ]);
        break;
      default:
        widget.viewModel.itemsAll.addAll([
          TransactionItemBean(),
          TransactionItemBean()..out = true,
          TransactionItemBean(),
          TransactionItemBean()..out = true,
          TransactionItemBean(),
          TransactionItemBean(),
          TransactionItemBean()..out = true,
          TransactionItemBean(),
          TransactionItemBean(),
        ]);
        break;
    }
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);
    final datas = widget.type == TransactionType.RECEIPT
        ? widget.viewModel.itemsReceipt
        : widget.type == TransactionType.TRANSFER
            ? widget.viewModel.itemsTransfer
            : widget.viewModel.itemsAll;
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
              controller: widget.viewModel.keywordController,
              maxLines: 1,
              textInputAction: TextInputAction.search,
              placeholder: S.current.addrOrTxId,
              onSubmitted: (e) {
                search();
                widget.viewModel.keywordController.value =
                    TextEditingValue(text: e);
              },
              right: Image.asset(ImageHelper.wrapAssets('icon_search.png'),
                      width: 22, color: ThemeColors.primaryFgColor
                      // fit: BoxFit.contain,
                      )
                  .click(onTap: () {
                print("sdsdsds");
                search();
              }),
            ),
          ),
        ];
      },
      body: SmartRefresher(
        controller: _refreshController,
        enablePullUp: true,
        onRefresh: () async {
          print("下拉刷新ing");
          Timer.periodic(Duration(seconds: 3), (_) {
            datas.insert(0, TransactionItemBean());
            _refreshController.refreshCompleted();
          });
        },
        onLoading: () async {
          print("加载更多ing");
          Timer.periodic(Duration(seconds: 3), (_) {
            _refreshController.loadComplete();
          });
        },
        child: buildItems(datas),
      ).padding(EdgeInsets.only(top: ThemeDimens.pageVerticalMargin * 2)),
    ).padding(EdgeInsets.only(
      left: ThemeDimens.pageLRMargin,
      right: ThemeDimens.pageLRMargin,
      top: ThemeDimens.pageVerticalMargin * 2,
    ));
  }

  search() {
    print("搜索.....");
    // showToast("搜索::${widget.viewModel.keywordController.text}");
  }

  buildItems(List datas) {
    return ListView.builder(
      itemBuilder: (context, index) {
        var item = datas[index];
        return TransactionItem(
          item,
          index: index,
        ).padding(EdgeInsets.only(bottom: ThemeDimens.pageVerticalMargin));
      },
      itemCount: datas.length,
    );
  }
}
