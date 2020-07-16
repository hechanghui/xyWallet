import 'package:flutter/material.dart';
import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:xy_wallet/common/router/router_manager.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';
import 'package:xy_wallet/ui/widgets/common_button.dart';

class PowByPower extends BaseWidget {
  @override
  BaseWidgetState getState() => Page();
}

class Page extends BaseWidgetState<PowByPower> {
  String titleLabel(BuildContext context) => S.of(context).PowByPower;

  @override
  Widget buildBodyWidget(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return ListView(children: <Widget>[
      //head
      Container(
          child: Stack(children: <Widget>[
        Image.asset(
          ImageHelper.wrapAssets('input_large_bg.png'),
          fit: BoxFit.fill,
          width: width - 30,
          height: 220,
        ).padding(EdgeInsets.only(top: 10, left: 15, right: 15)),
        Text(
          S.of(context).personPow,
          style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14),
        ).padding(EdgeInsets.only(top: 25, left: 35, right: 30)),
        Text('100',
                style: Theme.of(context).textTheme.headline4.copyWith(
                    fontSize: 50,
                    color: Color(0xff00ffaa),
                    fontWeight: FontWeight.bold))
            .padding(EdgeInsets.only(top: 45, left: 30, right: 30)),

        Container(
          padding: EdgeInsets.only(top: 110, left: 17, right: 17),
          child: Container(
            height: 1,
            color: ThemeColors.labelLightColor,
          ),
        ),


       Text(
          S.of(context).Powpercentage,
          style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14),
        ).padding(EdgeInsets.only(top: 122, left: 35, right: 30)),
        Container(
          alignment: Alignment.topRight,
          child: Text(
            '0.001%',
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14),
          ).padding(EdgeInsets.only(top: 122,  right: 30)),
        ),

       Text(
          S.of(context).PowBase,
          style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14),
        ).padding(EdgeInsets.only(top: 147, left: 35, right: 30)),
        Container(
          alignment: Alignment.topRight,
          child: Text(
            '0',
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14),
          ).padding(EdgeInsets.only(top: 147,  right: 30)),
        ),

        Text(
          S.of(context).PowInvite,
          style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14),
        ).padding(EdgeInsets.only(top: 170, left: 35, right: 30)),
        Container(
          alignment: Alignment.topRight,
          child: Text(
            '0',
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14),
          ).padding(EdgeInsets.only(top: 170,  right: 30)),
        ),
        
        Container(
          alignment: Alignment.topRight,
          
          child: Text(
            S.of(context).moreData,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 13),
          ).click(onTap:(){
            Navigator.of(context).pushNamed(RouteName.Power_Invite);
          }).padding(EdgeInsets.only( top: 200, right: 30)),
        )

      ])),

      //center
      Container(
          child: Stack(children: <Widget>[
        Image.asset(
          ImageHelper.wrapAssets('input_large_bg.png'),
          fit: BoxFit.fill,
          width: width - 30,
          height: 155,
        ).padding(EdgeInsets.only(top: 10, left: 15, right: 15)),

        Image.asset(
          ImageHelper.wrapAssets('usdt.png'),
          fit: BoxFit.fill,
          width: 28,
          height: 28,
        ).padding(EdgeInsets.only(top: 25, left: 35)),

        Text(
          S.of(context).PowrewardToday,
          style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14),
        ).padding(EdgeInsets.only(top: 65, left: 35, right: 30)),
        Text('80',
                style: Theme.of(context).textTheme.headline4.copyWith(
                    fontSize: 50,
                    color: Color(0xff00ffaa),
                    fontWeight: FontWeight.bold))
            .padding(EdgeInsets.only(top: 80, left: 30, right: 30)),
        
          Container(
          alignment: Alignment.topRight,
          
          child: Text(
            S.of(context).moreData,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 13),
          ).click(onTap:(){
            Navigator.of(context).pushNamed(RouteName.DropRecord);
          }).padding(EdgeInsets.only( top: 135, right: 30)),
        ),


        
      ])),
               CommonButton(
              child: Text(S.of(context).PowActivate),
              onPressed: () {
  
                //KYC
                // Navigator.of(context).pop();
              },
      ).padding(EdgeInsets.only(top: 80, left: 15, right: 15))
    ]);
  }
}
