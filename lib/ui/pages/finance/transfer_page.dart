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
import 'package:xy_wallet/ui/widgets/common_slider.dart';

class TransferPage extends BaseWidget {
  @override
  _PageState getState() => _PageState();
}

class _PageState extends BaseWidgetState<TransferPage> {
  double _value = 0;
  @override
  String titleLabel(BuildContext context) => S.current.transfer;

  @override
  Widget buildBodyWidget(BuildContext context) {
    var iconImg = Image.asset(
      ImageHelper.wrapAssets('usdt.png'),
      width: 22,
      // fit: BoxFit.contain,
    );
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
                  iconImg,
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
                right: iconImg,
              ),
              Divider(height: ThemeDimens.pageLRMargin),
              CommonInputMinor(
                placeholder: "请输入地址",
                right: Image.asset(ImageHelper.wrapAssets('icon_QR.png'),
                        width: 22, color: ThemeColors.primaryFgColor
                        // fit: BoxFit.contain,
                        )
                    .click(onTap: () {
                  print("扫码.....");
                }),
              ),
              Divider(height: ThemeDimens.pageLRMargin),
              Text(
                "发送地址",
                style: ThemeStyles.getSubtitle2lLight(context),
              ),
              Text("0xdac17f958d2ee523a2206206994597c1")
                  .padding(EdgeInsets.only(top: 4, bottom: 18))
                  .border(Border(
                      bottom: BorderSide(
                          color: ThemeColors.labelLightColor,
                          width: 1,
                          style: BorderStyle.solid))),
              Divider(height: ThemeDimens.pageLRMargin * 1.5),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: <Widget>[
                  Text(
                    "手续费",
                    style: ThemeStyles.getSubtitle2lLight(context),
                  ),
                  Text("0.001",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontWeight: FontWeight.bold)),
                ],
              ),
              CommonSlider(),
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
