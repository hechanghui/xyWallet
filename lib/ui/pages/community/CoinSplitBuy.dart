import 'package:flutter/material.dart';
import 'package:tuple/tuple.dart';
import 'package:xy_wallet/common/base/base_widget.dart';
import 'package:xy_wallet/common/helper/dialog_helper.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/ui/widgets/common_cellShow.dart';
import 'package:xy_wallet/ui/widgets/common_input_large.dart';

import 'package:xy_wallet/common/extension/widget_ex.dart';
import 'package:xy_wallet/ui/widgets/common_input_minor.dart';
import 'package:xy_wallet/ui/widgets/common_slider.dart';

class CoinSplitBuy extends BaseWidget {
  @override
  _PageState getState() => _PageState();
}

class _PageState extends BaseWidgetState<CoinSplitBuy> {
  double _valueFee = 10;
  @override
  String titleLabel(BuildContext context) => S.current.tabComTitle2;

  @override
  Widget buildBodyWidget(BuildContext context) {
    var iconImg = Image.asset(
      ImageHelper.wrapAssets('usdt.png'),
      width: 22,
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
                Divider(height: ThemeDimens.pageLRMargin),
                //tabWalletCellBg.png

                Container(
                  // margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
                  height: 50,
                  child: cellShowWidget('当前分裂比例','1X=0.74USDT'),
                  
                ).backImage(image:'tabWalletCellBg.png'),


                Divider(height: ThemeDimens.pageLRMargin*1.5),
                CommonInputMinor(
                  placeholder: S.current.InputMoney,
                  right: Image.asset(ImageHelper.wrapAssets('usdt.png'), width: 22,
                          // fit: BoxFit.contain,
                          ),
                ),
                Divider(height: ThemeDimens.pageLRMargin),
                Text(
                  S.current.coinSplitRule,
                  style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 11,color: ThemeColors.labelLightColor),
                ).padding(EdgeInsets.only(top: 5, right: 15,left: 15)),
                
                Divider(height: ThemeDimens.pageLRMargin * 3),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      S.current.canUse,
                      style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14,color: ThemeColors.labelLightColor),
                    ),
                    Text("100", style: Theme.of(context).textTheme.headline4.copyWith()),
                  ],
                ).padding(EdgeInsets.only(left:20,right:20)),
                CommonSlider(
                  value: _valueFee,
                  onChanged: (double) {
                    setState(() {
                      _valueFee = double.floorToDouble(); //转化成double
                    });
                  },
                ),
                

                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    Text(
                      S.current.willPay,
                      style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14,),
                    ),
                    Text("${_valueFee}", style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.bold, fontSize: 40)),
                  ],
                ).padding(EdgeInsets.only(left:20,right:20)),

                // Divider(height: ThemeDimens.pageLRMargin * 4),

              ],
            ),
          ),
        ),
        Padding(
            padding: EdgeInsets.only(left: ThemeDimens.pageLRMargin, right: ThemeDimens.pageLRMargin, bottom: ThemeDimens.pageBottomMargin),
            child: CommonButton(
              child: Text(S.of(context).CoinSplitNow),
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
