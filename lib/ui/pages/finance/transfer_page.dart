import 'package:flutter/material.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/router/router_manager.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/ui/widgets/common_input_large.dart';

import 'package:xy_wallet/common/extension/widget_ex.dart';
import 'package:xy_wallet/ui/widgets/common_input_minor.dart';

class TransferPage extends BaseWidget {
  @override
  _PageState getState() => _PageState();
}

class _PageState extends BaseWidgetState<TransferPage> {
  @override
  String titleLabel(BuildContext context) => S.current.transfer;

  @override
  Widget buildBodyWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        SingleChildScrollView(
          scrollDirection: Axis.vertical,
          reverse: false,
          padding: EdgeInsets.only(
            top: ThemeDimens.pageVerticalMargin * 2,
            left: ThemeDimens.pageLRMargin,
            right: ThemeDimens.pageLRMargin,
          ),
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: <Widget>[
              Row(
                mainAxisAlignment: MainAxisAlignment.end,
                children: <Widget>[
                  Image.asset(
                    ImageHelper.wrapAssets('usdt.png'),
                    width: 26,
                    // fit: BoxFit.contain,
                  ),
                  Text(
                    "USDT",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontWeight: FontWeight.bold),
                  ).padding(EdgeInsets.only(left: 6, right: 8)),
                  Text(
                    "可用余额",
                    style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(color: ThemeColors.labelLightColor),
                  )
                ],
              ),
              Container(
                alignment: Alignment.topRight,
                padding: EdgeInsets.only(
                  top: 6,
                ),
                child: Text(
                  "12333.0",
                  style: Theme.of(context).textTheme.headline1,
                ),
              ),
              Divider(height: ThemeDimens.pageVerticalMargin * 2),
              CommonInputMinor(
                placeholder: "请输入转账数量（最小单位为小数点后6位）",
              ),
              Divider(height: ThemeDimens.pageLRMargin),
              CommonInputMinor(
                placeholder: "请输入地址",
              ),
              CommonInputLarge(
                enabled: false,
                title: S.of(context).longPressedMnemonicCopy,
                controller: TextEditingController(
                    text:
                        "hello  pay   sonw  mom  prpper limb   bleak  merit  step  believe industry  artwork"),
              ),
              Divider(height: ThemeDimens.pageLRMargin * 1.5),
              Row(
                mainAxisSize: MainAxisSize.min,
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Padding(
                    padding: EdgeInsetsDirectional.only(top: 3, end: 3),
                    child: Image.asset(
                      ImageHelper.wrapAssets('icon_tip.png'),
                      width: 15,
                      // fit: BoxFit.contain,
                    ),
                  ),
                  Expanded(
                    child: Text(
                      S.of(context).walletMnemonicTip,
                      style: ThemeStyles.getSubtitle1lLight(context),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
                left: ThemeDimens.pageLRMargin,
                right: ThemeDimens.pageLRMargin,
                bottom: ThemeDimens.pageBottomMargin),
            child: CommonButton(
              child: Text(S.of(context).nextStep),
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, RouteName.tab),
            ))
      ],
    );
  }
}
