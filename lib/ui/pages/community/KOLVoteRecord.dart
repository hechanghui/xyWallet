import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/dialog_helper.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/ui/widgets/common_input_large.dart';

import 'package:xy_wallet/common/extension/widget_ex.dart';
import 'package:xy_wallet/ui/widgets/common_input_minor.dart';
import 'package:xy_wallet/ui/widgets/common_slider.dart';

class KOLVoteRecord extends BaseWidget {
  @override
  _PageState getState() => _PageState();
}

class _PageState extends BaseWidgetState<KOLVoteRecord> {
  double _valueFee = 10;
  @override
  String titleLabel(BuildContext context) => S.current.vote;

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
                    
                    Text(
                      "可用余额",
                      style: Theme.of(context).textTheme.headline4.copyWith(color: ThemeColors.labelLightColor),
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
                    style: Theme.of(context).textTheme.headline1.copyWith(fontSize:30),
                  ),
                ),
                Divider(height: ThemeDimens.pageVerticalMargin * 2),
                       Container(
          padding: EdgeInsets.only(top:10),
           child: Stack(children: <Widget>[
             Container(
               padding: EdgeInsets.only(left:10),
               child:  Image.asset(
                ImageHelper.wrapAssets('icon_tip.png'),
                width: 14,
                height: 14,
                fit: BoxFit.fill,
              ),
             ),
            Container(
              padding: EdgeInsets.only(left:30,right: 30),
                         child: Text(
            S.of(context).KOLTip,
            style: Theme.of(context)
                        .textTheme
                        .headline4
                        .copyWith(fontSize: 12, color:ThemeColors.labelLightColor),
              ),
              ),
           ])),
                
                Divider(height: ThemeDimens.pageVerticalMargin * 2),
                CommonInputMinor(
                  placeholder: S.current.transferCountTip,
                  controller: TextEditingController(text:'1'),
                  right: iconImg,
                ),
                Divider(height: ThemeDimens.pageLRMargin),
                CommonInputMinor(
                  placeholder: S.current.AddAddressInput,
                  controller: TextEditingController(text:'0xdac17f958d2ee523a2206206994597c1'),
                  right: Image.asset(ImageHelper.wrapAssets('icon_QR.png'), width: 22, color: ThemeColors.primaryFgColor
                          // fit: BoxFit.contain,
                          )
                      .click(onTap: () {
                    print("扫码.....");
                  }),
                ),
                Divider(height: ThemeDimens.pageLRMargin),
                Text(
                  S.current.addrSend,
                  style: ThemeStyles.getSubtitle2lLight(context),
                ),
                Text("0xdac17f958d2ee523a2206206994597c1").padding(EdgeInsets.only(top: 4, bottom: 18)).border(Border(bottom: BorderSide(color: ThemeColors.labelLightColor, width: 1, style: BorderStyle.solid))),
                Divider(height: ThemeDimens.pageLRMargin * 1.5),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      S.current.fee,
                      style: ThemeStyles.getSubtitle2lLight(context),
                    ),
                    Text("${_valueFee}", style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.bold)),
                  ],
                ),
                CommonSlider(
                  value: _valueFee,
                  onChanged: (double) {
                    setState(() {
                      _valueFee = double.floorToDouble(); //转化成double
                    });
                  },
                ),
                Divider(height: ThemeDimens.pageLRMargin),
                CommonInputLarge(
                  title: S.current.transferLabelTitle,
                  placeholder: S.current.transferLabelTip,
                  // controller:
                  //     TextEditingController(text: S.current.transferLabelTip),
                ),
                Divider(height: ThemeDimens.pageLRMargin * 1.5),
              ],
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: ThemeDimens.pageLRMargin, right: ThemeDimens.pageLRMargin, bottom: ThemeDimens.pageBottomMargin),
            child: CommonButton(
              child: Text(S.of(context).vote),
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
