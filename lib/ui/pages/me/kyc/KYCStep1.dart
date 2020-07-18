import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
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

class KYCStep1Page extends BaseWidget {
  @override
  _State getState() => _State();
}

class _State extends BaseWidgetState<KYCStep1Page> {
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
              ////滑动到底部回弹效果
              physics: BouncingScrollPhysics(),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.start,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text(
                    S.of(context).subtitleKYC1,
                    style: ThemeStyles.getHeadline4lLight(context),
                  ).padding(EdgeInsets.only(
                    top: ThemeDimens.pageVerticalMargin * 2,
                    left: ThemeDimens.pageLRMargin,
                    right: ThemeDimens.pageLRMargin,
                  )),
                  Divider(height: ThemeDimens.pageVerticalMargin * 1.5),
                  CommonInput(
                    title: "姓",
                    placeholder: "请输入姓氏",
                    controller: model.firstNameController,
                  ),
                  CommonInput(
                    title: "名",
                    placeholder: "请输入名字wwwwwwwwwwww",
                    controller: model.lastNameController,
                  ),
                  CommonInput(
                    title: "国家/地区",
                    placeholder: "请选择",
                    controller: model.countryController,
                    enabled: false,
                    right: Icon(Icons.keyboard_arrow_down, color: ThemeColors.primaryFgColor),
                    style: Theme.of(context).textTheme.headline4.copyWith(color: ThemeColors.primaryFgColor, fontWeight: FontWeight.bold),
                  ).click(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      heightFactor: 1,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        print("国家/地区");
                        Navigator.of(context).pushNamed(RouteName.CountryListPage);
                      }),
                  CommonInput(
                    title: "证件类型",
                    placeholder: "请选择",
                    controller: model.idTypeController,
                    enabled: false,
                    right: Icon(Icons.keyboard_arrow_down, color: ThemeColors.primaryFgColor),
                    style: Theme.of(context).textTheme.headline4.copyWith(color: ThemeColors.primaryFgColor, fontWeight: FontWeight.bold),
                  ).click(
                      focusColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      heightFactor: 1,
                      hoverColor: Colors.transparent,
                      splashColor: Colors.transparent,
                      onTap: () {
                        print("证件类型");
                        showModalBottomSheet(
                            context: context,
                            isScrollControlled: true,
                            builder: (context) {
                              return Column(
                                mainAxisSize: MainAxisSize.min,
                                crossAxisAlignment: CrossAxisAlignment.stretch,
                                children: <Widget>[
                                  Text(
                                    "身份证",
                                    textAlign: TextAlign.center,
                                  ).click(onTap: () {
                                    model.idTypeController.text = "身份证";
                                    Navigator.pop(context);
                                  }),
                                  Text(
                                    "护照",
                                    textAlign: TextAlign.center,
                                  ).click(onTap: () {
                                    model.idTypeController.text = "护照";
                                    Navigator.pop(context);
                                  }).padding(EdgeInsets.symmetric(vertical: ThemeDimens.pageVerticalMargin)),
                                  Text(
                                    "驾驶证",
                                    textAlign: TextAlign.center,
                                  ).click(onTap: () {
                                    model.idTypeController.text = "驾驶证";
                                    Navigator.pop(context);
                                  }),
                                  Text(
                                    "学生证",
                                    textAlign: TextAlign.center,
                                  ).click(onTap: () {
                                    model.idTypeController.text = "学生证";
                                    Navigator.pop(context);
                                  }).padding(EdgeInsets.symmetric(vertical: ThemeDimens.pageVerticalMargin)),
                                  Text(
                                    "狗牌",
                                    textAlign: TextAlign.center,
                                  ).click(onTap: () {
                                    model.idTypeController.text = "狗牌";
                                    Navigator.pop(context);
                                  }),
                                ],
                              ).padding(EdgeInsets.only(top: ThemeDimens.pageVerticalMargin, bottom: ThemeDimens.pageBottomMargin)).bg(
                                  border: Border(top: BorderSide(color: ThemeColors.accentColor.withOpacity(0.2), width: 1, style: BorderStyle.solid)),
                                  color: ThemeColors.accentDartColor);
                            });
                      }),
                  CommonInput(
                    title: "证件号码",
                    placeholder: "请输入证件号码",
                    controller: model.idController,
                  ),
                  CommonInput(
                    title: "邀请码(选填)",
                    placeholder: "请输入邀请码",
                    controller: model.invitationCodeController,
                  ),
                  Divider(height: ThemeDimens.pageLRMargin),
                ],
              ),
            ).expand(),
            CommonButton(
                    child: Text(S.of(context).createWallet),
                    onPressed: () {
                      Navigator.of(context).pushNamed(RouteName.KYCStep2);
                    })
                .padding(EdgeInsets.only(
                    left: ThemeDimens.pageLRMargin,
                    right: ThemeDimens.pageLRMargin,
                    bottom: ThemeDimens.pageBottomMargin,
                    top: ThemeDimens.pageVerticalMargin)),
          ],
        );
      },
    );
  }
}
