import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:url_launcher/url_launcher.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/provider/provider_widget.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/model/response_beans.dart';
import 'package:xy_wallet/ui/pages/finance/transaction_list.dart';
import 'package:xy_wallet/ui/pages/finance/vm/transaction_record_vm.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';

class TransactionDetailsPage extends BaseWidget {
  final TransactionItemBean data;
  TransactionDetailsPage(this.data);

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
      children: [
        Expanded(
            child: SingleChildScrollView(
                scrollDirection: Axis.vertical,
                reverse: false,
                physics: BouncingScrollPhysics(),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: <Widget>[
                    Image.asset(ImageHelper.wrapAssets('icon_success.png'),
                        width: 66, color: ThemeColors.primaryFgColor
                        // fit: BoxFit.contain,
                        ),
                    Text(
                      "USDT",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontWeight: FontWeight.bold),
                    ).padding(EdgeInsets.symmetric(
                        vertical: ThemeDimens.pageVerticalMargin * 3)),
                    Text("${widget.data.out ? "-" : "+"}84.9",
                        style: Theme.of(context).textTheme.headline4.copyWith(
                              fontWeight: FontWeight.bold,
                              fontSize: 30,
                              color: widget.data.out
                                  ? ThemeColors.red
                                  : ThemeColors.green,
                            )),
                    Column(
                      children: buildLabelAndContent(),
                    ).padding(EdgeInsets.only(
                        top: ThemeDimens.pageVerticalMargin * 4,
                        bottom: ThemeDimens.pageVerticalMargin)),
                  ],
                ))),
        CommonButton(
          child: Text(S.of(context).goBlockExplorer),
          onPressed: () => launch("https://www.blockchain.com/explorer"),
        )
      ],
    ).padding(EdgeInsets.only(
        left: ThemeDimens.pageLRMargin,
        right: ThemeDimens.pageLRMargin,
        top: ThemeDimens.pageVerticalMargin * 1.5,
        bottom: ThemeDimens.pageBottomMargin));
  }

  buildLabelAndContent() {
    var labels = [
      S.current.confirmDate,
      S.current.txId,
      S.current.includedInBlock,
      S.current.confirmations,
      S.current.fees,
      S.current.addrFrom,
      S.current.addrTo,
    ];

    var widgets = List<Widget>();
    for (var label in labels) {
      widgets.add(Flex(
              direction: Axis.horizontal,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
            Expanded(
                flex: 2,
                child: Text(
                  label,
                  style: ThemeStyles.getSubtitle1lLight(context),
                )),
            Expanded(
                flex: 5,
                child: Text(
                  "sssssssssssssssssssssssssssssssssssdsdsdwewewewewesdwewsadwerdasdwereeeeeeeeeeeesssssssss",
                  style: Theme.of(context).textTheme.subtitle1,
                )),
          ])
          .padding(
              EdgeInsets.symmetric(vertical: ThemeDimens.pageVerticalMargin))
          .border(Border(
              bottom: BorderSide(
                  color: ThemeColors.labelLightColor,
                  width: 1,
                  style: BorderStyle.solid))));
    }
    return widgets;
  }
}
