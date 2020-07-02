import 'package:flutter/material.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/router/router_manager.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/ui/widgets/common_input_large.dart';

import 'package:xy_wallet/common/extension/widget_ex.dart';

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
                children: <Widget>[
                  Image.asset(
                    ImageHelper.wrapAssets('usdt.png'),
                    width: 26,
                    // fit: BoxFit.contain,
                  ),
                  Text("USDT").padding(EdgeInsets.only(left: 4)),
                ],
              ),
              Text(
                S.of(context).yourWalletMnemonic,
                style: Theme.of(context).textTheme.headline1,
              ),
              Divider(height: ThemeDimens.pageVerticalMargin * 1.5),
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
                      S.of(context).yourWalletMnemonicTip,
                      style: ThemeStyles.getSubtitle1lLight(context),
                    ),
                  ),
                ],
              ),
              Divider(height: ThemeDimens.pageLRMargin),
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
