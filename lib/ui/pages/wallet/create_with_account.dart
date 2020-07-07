import 'package:flutter/material.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/dialog_helper.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/provider/provider_widget.dart';
import 'package:xy_wallet/common/router/router_manager.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/pages/wallet/vm/create_vm.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/ui/widgets/common_input.dart';
import 'package:xy_wallet/ui/widgets/common_input_large.dart';
// import 'package:bitcoin_flutter/bitcoin_flutter.dart';



class CreateWithAccountPage extends BaseWidget {
  @override
  _PageState getState() => _PageState();
}

class _PageState extends BaseWidgetState<CreateWithAccountPage> {
  @override
  String titleLabel(BuildContext context) => S.of(context).walletCreate;

  @override
  Widget buildBodyWidget(BuildContext context) {
    final viewModel = CreateViewModel();
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
          ),
          ////滑动到底部回弹效果
          physics: BouncingScrollPhysics(),
          child: Column(
            children: <Widget>[
              Container(
                padding:
                    EdgeInsets.symmetric(horizontal: ThemeDimens.pageLRMargin),
                child: Row(
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
                        S.of(context).walletCreateAccountTip,
                        style: ThemeStyles.getSubtitle1lLight(context),
                      ),
                    ),
                  ],
                ),
              ),
              CommonInput(
                title: S.of(context).accountName,
                placeholder: S.of(context).hintInputAccountName,
                // controller: widget.viewModel.mnemonicAccountController,
              ),
              CommonInput(
                title: S.of(context).setPwd,
                placeholder: S.of(context).hintInputPwd,
                // controller: widget.viewModel.mnemonicSetPwdController,
              ),
              CommonInput(
                title: S.of(context).confirmPwd,
                placeholder: S.of(context).hintInputPwd,
                // controller: widget.viewModel.mnemonicConfirmPwdController,
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
              child: Text(S.of(context).startCreate),
              onPressed: () => Navigator.pushReplacementNamed(
                  context, RouteName.WALLET_CREATE_WITH_MNEMONIC_GENERATE,
                  arguments: viewModel),
            ))
      ],
    );
  }
}
