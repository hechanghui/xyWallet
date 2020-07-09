import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';

import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';
import 'package:xy_wallet/ui/widgets/common_input_minor.dart';

class PowByAttraction extends BaseWidget {
  @override
  getState() {
    return new Pages();
  }
}

class Pages extends BaseWidgetState<PowByAttraction> {
  @override
  String titleLabel(BuildContext context) => S.of(context).PowByAttraction;
  var controller = TextEditingController();
  
  Widget buildBodyWidget(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return ListView(children: <Widget>[
//head
      Container(
          child: Stack(children: <Widget>[
        Container(
          padding: EdgeInsets.only(top: 20, left: 15, right: 15),
          child: Container(
            height: 38,
            color: ThemeColors.accentDartColor,
          ),
        ),
        Image.asset(
          ImageHelper.wrapAssets('input_large_bg.png'),
          fit: BoxFit.fill,
          width: width - 30,
          height: 155,
        ).padding(EdgeInsets.only(top: 20, left: 15, right: 15)),
        Text(
          S.of(context).libWallet,
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(fontWeight: FontWeight.bold),
        ).padding(EdgeInsets.only(top: 30, left: 35, right: 30)),
        Text(S.of(context).libWalletFeeTitle,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontSize: 14))
            .padding(EdgeInsets.only(top: 70, left: 35, right: 30)),
        Text(S.of(context).libWalletFee,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontSize: 14))
            .padding(EdgeInsets.only(top: 95, left: 35, right: 30)),
        Text(S.of(context).libWalletAsset,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontSize: 14))
            .padding(EdgeInsets.only(top: 135, left: 35, right: 30)),
        Container(
          padding: EdgeInsets.only(top: 120, left: 17, right: 17),
          child: Container(
            height: 1,
            color: ThemeColors.labelLightColor,
          ),
        ),
      ])),
    
    //
    CommonInputMinor(placeholder: S.of(context).AddressTitleInput,controller:controller).padding(EdgeInsets.only(top: 35, left: 15, right: 15)),
    
        Text(
          S.of(context).libWallet,
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(fontSize: 15,color:Color(0xff3FA0B3))).padding(EdgeInsets.only(top: 30, left: 25, right: 25)),
    Text(
          S.of(context).libWalletTip,
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(fontSize: 14,color:Color(0xff3FA0B3))).padding(EdgeInsets.only(top: 5, left: 25, right: 25)),

      CommonButton(
              child: Text(S.of(context).PowByAttraction),
              onPressed: () {
                if (controller.text == null || controller.text.isEmpty) {
                  showToast(S.of(context).AddAddressInput);
                  return;
                }
       
                Navigator.of(context).pop();
              },
      ).padding(EdgeInsets.only(top: 60, left: 15, right: 15))
    ]);
  }
}
