import 'package:flutter/material.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/provider/provider_widget.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/base/base_page.dart';
import 'package:xy_wallet/ui/pages/me/kyc/vm/KYCSubmitVM.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/ui/widgets/common_input.dart';
import 'package:xy_wallet/ui/widgets/common_input_large.dart';

class KYCStep1Page extends BaseWidget {
  @override
  _State getState() => _State();
}

class _State extends BaseWidgetState<KYCStep1Page> {
  @override
  String titleLabel(BuildContext context) => S.of(context).walletCreate;
  @override
  bool get wantKeepAlive => true;

  KYCSubmitViewModel _viewModel;
  @override
  void initState() {
    super.initState();
    _viewModel = KYCSubmitViewModel();
  }

  @override
  Widget buildBodyWidget(BuildContext context) {
    return ProviderWidget<KYCSubmitViewModel>(
      model: _viewModel,
      builder: (context, model, child) {
        return Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          mainAxisSize: MainAxisSize.max,
          children: [
            SingleChildScrollView(
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
                    S.of(context).walletConfirmMnemonic,
                    style: Theme.of(context).textTheme.headline1,
                  ),
                  Divider(height: ThemeDimens.pageVerticalMargin * 1.5),
                  Text(
                    S.of(context).walletMnemonicInputTip,
                    style: ThemeStyles.getSubtitle1lLight(context),
                  ),
                  Divider(height: ThemeDimens.pageLRMargin),
                  CommonInput(placeholder: "23333333"),
                  Divider(height: ThemeDimens.pageLRMargin * 1.5),
                ],
              ),
            ),
            Padding(
                padding: EdgeInsets.only(left: ThemeDimens.pageLRMargin, right: ThemeDimens.pageLRMargin, bottom: ThemeDimens.pageBottomMargin),
                child: CommonButton(child: Text(S.of(context).createWallet), onPressed: () async {}))
          ],
        );
      },
    );
  }
}
