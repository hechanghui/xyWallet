import 'package:flutter/material.dart';
import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:xy_wallet/common/router/router_manager.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';


import 'package:xy_wallet/common/helper/resource_helper.dart';

import 'package:xy_wallet/common/extension/widget_ex.dart';

class PowBySplitInfo extends BaseWidget {
  @override
  BaseWidgetState getState() => Page();
}

class Page extends BaseWidgetState<PowBySplitInfo> {
  String titleLabel(BuildContext context) => S.of(context).rewardRecord;

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
          height: 110,
        ).padding(EdgeInsets.only(top: 10, left: 15, right: 15)),
        Text(
          S.of(context).rewardTotal,
          style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14),
        ).padding(EdgeInsets.only(top: 25, left: 35, right: 30)),
        Text('10000',
                style: Theme.of(context).textTheme.headline4.copyWith(
                    fontSize: 50,
                    color: Color(0xff00ffaa),
                    fontWeight: FontWeight.bold))
            .padding(EdgeInsets.only(top: 45, left: 30, right: 30)),
      ])),

//center
      Container(
          child: Stack(children: <Widget>[
          Image.asset(
          ImageHelper.wrapAssets('input_large_bg.png'),
          fit: BoxFit.fill,
          width: width - 30,
          height: 265,
        ).padding(EdgeInsets.only(top: 10, left: 15, right: 15)),



      Column(children: <Widget>[
        createCell('总算力值','0'),
        createCell('持币算力','0'),
        createCell('双轨算力','0'),
        createCell('邀请算力','0'),
        createCell('币龄算力','0'),
        createCell('占总算力比','0%'),
        
        createCell('奖励值','0'),
        createCell('结算日期','2020.10.21'),
      ]).padding(EdgeInsets.only(top: 15, left: 15, right: 15))

      ])),

            Container(
          child: Stack(children: <Widget>[
          Image.asset(
          ImageHelper.wrapAssets('input_large_bg.png'),
          fit: BoxFit.fill,
          width: width - 30,
          height: 265,
        ).padding(EdgeInsets.only(top: 10, left: 15, right: 15)),
      Column(children: <Widget>[
        createCell('总算力值','0'),
        createCell('持币算力','0'),
        createCell('双轨算力','0'),
        createCell('邀请算力','0'),
        createCell('币龄算力','0'),
        createCell('占总算力比','0%'),
        
        createCell('奖励值','0'),
        createCell('结算日期','2020.10.21'),
      ]).padding(EdgeInsets.only(top: 15, left: 15, right: 15))

      ]))




    ]);
  }

  createCell(String title, String context) {
    return Container(
      height: 32,
      child: Stack(children: <Widget>[
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 25),
          child: Text(title),
        ),
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 25),
          child: Text(context),
        ),
        Container(
          alignment: Alignment.bottomCenter,
          child: Container(
            color: ThemeColors.labelLightColor,
            height: 1,
          ),
        )
      ]),
    );
  }
}
