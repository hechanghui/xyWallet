import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/provider/provider_widget.dart';
import 'package:xy_wallet/common/router/router_manager.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/pages/wallet/vm/create_vm.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/ui/widgets/common_input.dart';
import 'package:xy_wallet/ui/widgets/common_input_large.dart';

class CreateWithMnemonicGeneratePage extends BaseWidget {
  final CreateViewModel viewModel;

  CreateWithMnemonicGeneratePage(this.viewModel);
  @override
  _PageState getState() => _PageState();
}

class _PageState extends BaseWidgetState<CreateWithMnemonicGeneratePage> {
  @override
  String titleLabel(BuildContext context) => S.of(context).walletCreate;

  @override
  Widget buildBodyWidget(BuildContext context) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      mainAxisSize: MainAxisSize.max,
      children: [
        SingleChildScrollView(
          //滑动的方向 Axis.vertical为垂直方向滑动，Axis.horizontal 为水平方向
          scrollDirection: Axis.vertical,
          //true 滑动到底部
          reverse: false,
          padding: EdgeInsets.only(
            top: ThemeDimens.pageVerticalMargin * 2,
            left: ThemeDimens.pageLRMargin,
            right: ThemeDimens.pageLRMargin,
          ),
          ////滑动到底部回弹效果
          physics: BouncingScrollPhysics(),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
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
              onPressed: () => Navigator.pushReplacementNamed(
                  context, RouteName.WALLET_CREATE_WITH_MNEMONIC_INPUT,
                  arguments: widget.viewModel),
            ))
      ],
    );
  }
}
