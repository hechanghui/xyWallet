import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/provider/provider_widget.dart';
import 'package:xy_wallet/common/router/router_manager.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/base/base_page.dart';
import 'package:xy_wallet/ui/pages/me/kyc/vm/KYCSubmitVM.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/ui/widgets/common_input.dart';
import 'package:xy_wallet/ui/widgets/common_input_large.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';

class KYCStep2Page extends BaseWidget {
  @override
  _State getState() => _State();
}

class _State extends BaseWidgetState<KYCStep2Page> {
  @override
  String titleLabel(BuildContext context) => S.of(context).titleKYC;
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
              padding: EdgeInsets.symmetric(horizontal: ThemeDimens.pageLRMargin),
              ////滑动到底部回弹效果
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    S.of(context).subtitleKYC2,
                    style: ThemeStyles.getHeadline4lLight(context),
                  ).padding(EdgeInsets.only(
                    top: ThemeDimens.pageVerticalMargin * 2,
                  )),
                  Divider(height: ThemeDimens.pageVerticalMargin * 1.5),
                  Text("1、上传身份证人像面"),
                  Container(
                    alignment: Alignment.center,
                    height: 170,
                    child: Image.asset(
                      ImageHelper.wrapAssets("img_add.png"),
                    ),
                  ).backImage(),
                  Divider(height: ThemeDimens.pageVerticalMargin * 1.2),
                  Text("2、上传身份证国徽面"),
                  Container(
                    alignment: Alignment.center,
                    height: 170,
                    child: Image.asset(
                      ImageHelper.wrapAssets("img_add.png"),
                    ),
                  ).backImage(),
                  Divider(height: ThemeDimens.pageVerticalMargin * 1.2),
                  Text("3、上传手持证件照片"),
                  Container(
                    alignment: Alignment.center,
                    height: 170,
                    child: Image.asset(
                      ImageHelper.wrapAssets("img_add.png"),
                    ),
                  ).backImage(),
                ],
              ),
            ).expand(),
            CommonButton(child: Text(S.of(context).createWallet), onPressed: () async {}).padding(EdgeInsets.only(
                left: ThemeDimens.pageLRMargin, right: ThemeDimens.pageLRMargin, bottom: ThemeDimens.pageBottomMargin, top: ThemeDimens.pageVerticalMargin)),
          ],
        );
      },
    );
  }
}
