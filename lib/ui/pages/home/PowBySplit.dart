import 'package:flutter/material.dart';
import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:xy_wallet/common/router/router_manager.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/service/bus.dart';
import 'package:xy_wallet/service/httpService/http_server.dart';
import 'package:xy_wallet/service/httpService/result_data.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/ui/pages/home/widget/inViteInfoCell.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';

class PowBySplit extends BaseWidget {
  @override
  BaseWidgetState getState() => Page();
}

class Page extends BaseWidgetState<PowBySplit> {
  String titleLabel(BuildContext context) => S.of(context).PowBySplit;

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
          S.of(context).personPower,
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
          height: 175,
        ).padding(EdgeInsets.only(top: 10, left: 15, right: 15)),
        Text(
          S.of(context).PowerrewardToday,
          style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14),
        ).padding(EdgeInsets.only(top: 25, left: 35, right: 30)),
        Text('80',
                style: Theme.of(context).textTheme.headline4.copyWith(
                    fontSize: 50,
                    color: Color(0xff00ffaa),
                    fontWeight: FontWeight.bold))
            .padding(EdgeInsets.only(top: 45, left: 30, right: 30)),
        Text(
          S.of(context).PowerPpercentage,
          style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14),
        ).padding(EdgeInsets.only(top: 115, left: 35, right: 30)),
        Container(
          alignment: Alignment.topRight,
          child: Text(
            '0.001%',
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14),
          ).padding(EdgeInsets.only(top: 115,  right: 30)),
        ),

          Container(
          alignment: Alignment.topRight,
          
          child: Text(
            S.of(context).moreData,
            textAlign: TextAlign.right,
            style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 13),
          ).padding(EdgeInsets.only( top: 155, right: 30)),
        )

       
        
      ])),

//foot
        Container(
          child: Stack(children: <Widget>[
          Image.asset(
          ImageHelper.wrapAssets('input_large_bg.png'),
          fit: BoxFit.fill,
          width: width - 30,
          height: 314,
        ).padding(EdgeInsets.only(top: 10, left: 15, right: 15)),

        Container(
          alignment: Alignment.topCenter,
          padding: EdgeInsets.only(top:46),
          child:Image.asset(
          ImageHelper.wrapAssets('linkPoW.png'),
          fit: BoxFit.fill,
          width: 102,
          height: 93,
        )),
        // 
        Container(
          alignment: Alignment.topCenter,
          child:Text('双轨算力',
        textAlign: TextAlign.center,
                style: Theme.of(context).textTheme.headline4.copyWith(
                    fontSize: 12,))
            .padding(EdgeInsets.only(top: 25,)),
        ),
        Container(
          alignment: Alignment.topCenter,
        child:Text('X-2算力\n0',
        textAlign: TextAlign.left,
                style: Theme.of(context).textTheme.headline4.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold))
            .padding(EdgeInsets.only(top: 96, left: 150)),
        ),
        Container(
        alignment: Alignment.topCenter,
        child:Text('X-1算力\n0',
        textAlign: TextAlign.right,
                style: Theme.of(context).textTheme.headline4.copyWith(
                    fontSize: 12,
                    fontWeight: FontWeight.bold))
            .padding(EdgeInsets.only(top: 96, right: 150)),
        ),

        Container(
          padding: EdgeInsets.only(top: 170, left: 17, right: 17),
          child: Container(
            height: 1,
            color: ThemeColors.labelLightColor,
          ),
        ),

        Text("持币算力").padding(EdgeInsets.only(top: 177, left: 30)),
   Container(
          alignment: Alignment.topRight,
          padding:EdgeInsets.only(top: 177,right: 30),
          child: Text("0",textAlign: TextAlign.right,)
        ),
        Container(
          padding: EdgeInsets.only(top: 204, left: 17, right: 17),
          child: Container(
            height: 1,
            color: ThemeColors.labelLightColor,
          ),
        ),
        Text("持币算力").padding(EdgeInsets.only(top: 211, left: 30)),
                Container(
          alignment: Alignment.topRight,
          padding:EdgeInsets.only(top: 211,right: 30),
          child: Text("0",textAlign: TextAlign.right,)
        ),
                Container(
          padding: EdgeInsets.only(top: 240, left: 17, right: 17),
          child: Container(
            height: 1,
            color: ThemeColors.labelLightColor,
          ),
        ),

        Text("持币算力").padding(EdgeInsets.only(top: 247, left: 30)),
        Container(
          alignment: Alignment.topRight,
          padding:EdgeInsets.only(top: 247,right: 30),
          child: Text("0",textAlign: TextAlign.right,)
        ),




        Container(
          padding: EdgeInsets.only(top: 275, left: 17, right: 17),
          child: Container(
            height: 1,
            color: ThemeColors.labelLightColor,
          ),
        ),
        Text("持币算力").padding(EdgeInsets.only(top: 282, left: 30)),
        Container(
          alignment: Alignment.topRight,
          padding:EdgeInsets.only(top: 282,right: 30),
          child: Text("0",textAlign: TextAlign.right,)
        ),
        
      ]))
    ]);
  }
}
