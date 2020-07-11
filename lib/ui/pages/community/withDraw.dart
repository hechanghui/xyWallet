import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/dialog_helper.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/router/router_manager.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/ui/widgets/common_input_large.dart';

import 'package:xy_wallet/common/extension/widget_ex.dart';
import 'package:xy_wallet/ui/widgets/common_input_minor.dart';
import 'package:xy_wallet/ui/widgets/common_slider.dart';

class WithDrawPage extends BaseWidget {
  @override
  _PageState getState() => _PageState();
}

class _PageState extends BaseWidgetState<WithDrawPage> {
  double _valueFee = 10;
  @override
  String titleLabel(BuildContext context) => S.current.WithDraw;

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
        Expanded(
          child: SingleChildScrollView(
            scrollDirection: Axis.vertical,
            reverse: false,
            padding: EdgeInsets.only(
              // top: ThemeDimens.pageVerticalMargin * 2,
              left: ThemeDimens.pageLRMargin,
              right: ThemeDimens.pageLRMargin,
            ),
            physics: BouncingScrollPhysics(),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Stack(
                  children: <Widget>[
                    iconImg.padding(EdgeInsets.only(left: 20, top: 0)),
                    Text(
                      "USDT",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(fontWeight: FontWeight.bold),
                    ).padding(EdgeInsets.only(left: 55, top: 0)),
                    Container(
                      alignment: Alignment.topRight,
                      padding:EdgeInsets.only(right: 20),
                  
                      child: Text(
                      "可用余额",
                      style: Theme.of(context)
                          .textTheme
                          .headline4
                          .copyWith(color: ThemeColors.labelLightColor),
                      ),
                    ),
                    
                  ],
                ),
                Container(
                  alignment: Alignment.topRight,
                  padding: EdgeInsets.only(
                    top:0,
                    right: 20,
                  ),
              
                  child: Text(
                    
                    "12333.0",
                    style: Theme.of(context).textTheme.headline1.copyWith(fontSize:40,fontWeight: FontWeight.bold),
                  ),
                ),
                Divider(height: ThemeDimens.pageVerticalMargin * 2),
                CommonInputMinor(
                  placeholder: S.current.transferCountTip,
                  right: iconImg,
                ),
                Divider(height: ThemeDimens.pageLRMargin),
                CommonInputMinor(
                  placeholder: S.current.AddAddressInput,
                  right: Image.asset(ImageHelper.wrapAssets('icon_QR.png'),
                          width: 22, color: ThemeColors.primaryFgColor
                          // fit: BoxFit.contain,
                          )
                      .click(onTap: () {
                    print("扫码.....");
                  }),
                ),
                Divider(height: ThemeDimens.pageLRMargin*3),
                // Text(
                //   S.current.addrSend,
                //   style: ThemeStyles.getSubtitle2lLight(context),
                // ),
                Text("手续费（USDT）：5.000USDT")
                    .padding(EdgeInsets.only(top: 4, bottom: 10))
                    .border(Border(
                        bottom: BorderSide(
                            color: ThemeColors.labelLightColor,
                            width: 1,
                            style: BorderStyle.solid))),
                Divider(height: ThemeDimens.pageLRMargin * 0.6),
                Text("到账总额（USDT）：5.000USDT")
                    .padding(EdgeInsets.only(top: 4, bottom: 10))
                    .border(Border(
                        bottom: BorderSide(
                            color: ThemeColors.labelLightColor,
                            width: 1,
                            style: BorderStyle.none))),
                Divider(height: ThemeDimens.pageLRMargin),
                

Container(
          padding: EdgeInsets.only(top:20),
           child: Stack(children: <Widget>[
             Container(
               padding: EdgeInsets.only(left:0,top: 2),
               child:  Image.asset(
                ImageHelper.wrapAssets('icon_tip.png'),
                width: 14,
                height: 14,
                fit: BoxFit.fill,
              ),
             ),
            Container(
              padding: EdgeInsets.only(left:18,right: 0),
                         child: Text(
            '最小提币数量为：2USDT（ERC20）\n 请务必确认设备或浏览器安全，防止信息被篡改或泄露。',
            style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontSize: 12, color:ThemeColors.labelLightColor),
              ),
              )
           ]))
                //
                
              ],
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(
                left: ThemeDimens.pageLRMargin,
                right: ThemeDimens.pageLRMargin,
                bottom: ThemeDimens.pageBottomMargin),
            child: CommonButton(
              child: Text(S.of(context).transferConfirm),
              onPressed: () => showPwdDialog(),
            )),
      ],
    );
  }

  showPwdDialog() {
    DialogHelper.showCommonDialog(
        context: context,
        alignment: Alignment.center,
        title: S.current.inputPwd,
        contentWidget: CommonInputMinor(
          placeholder: S.current.hintPleaseInput,
        ),
        actions: [
          Tuple3(S.current.cannel, null, null),
          Tuple3(S.current.comfirm, () {
            Navigator.of(context).pop();
          }, null)
        ]);
  }
}
