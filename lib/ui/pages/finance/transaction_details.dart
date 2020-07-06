import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/provider/provider_widget.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/pages/finance/transaction_list.dart';
import 'package:xy_wallet/ui/pages/finance/vm/transaction_record_vm.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';

class TransactionDetailsPage extends BaseWidget {
  @override
  _PageState getState() => _PageState();
}

class _PageState extends BaseWidgetState<TransactionDetailsPage> {
  @override
  String titleLabel(BuildContext context) => S.current.transferRecord;

  @override
  Widget buildBodyWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [],
    ).padding(EdgeInsets.only(
        left: ThemeDimens.pageLRMargin,
        right: ThemeDimens.pageLRMargin,
        top: ThemeDimens.pageVerticalMargin * 1.5,
        bottom: ThemeDimens.pageBottomMargin));
  }
}
