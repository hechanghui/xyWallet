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
import 'package:xy_wallet/ui/widgets/common_button.dart';

class CoinSplit extends BaseWidget {
  @override
  BaseWidgetState getState() => Page();
}

class Page extends BaseWidgetState<CoinSplit> {
  String titleLabel(BuildContext context) => S.of(context).tabComTitle2;

  @override
  List<Widget> buildAppBarAction(BuildContext context) {
    return <Widget>[
      Container(
        padding: EdgeInsets.only(right:15),
        alignment: Alignment.center,
        child: Text('TOP10',
            style: Theme.of(context).textTheme.headline4.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
      ).click(onTap: () {
        Navigator.of(context).pushNamed(RouteName.CoinSplitRank);
        
        
      }),
    ];
  }



  @override
  Widget buildBodyWidget(BuildContext context) {
    double width = MediaQuery.of(context).size.width;

    return ListView(children: <Widget>[
      //head
      Container(
          margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Column(children: <Widget>[
            mainCell('usdt.png', '累积分裂数量', '12312')
                .padding(EdgeInsets.only(top: 15)),
            mainCell('usdt.png', '当前赛季数量', '12312'),
            mainCell('usdt.png', '粒子分裂池剩余X数量', '12312').padding(EdgeInsets.only(bottom: 15)),
          ]).backImage()),

      Container(
          margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Column(children: <Widget>[
            mainCell('usdt.png', '本阶段USDT可分裂数量', '1231211')
                .padding(EdgeInsets.only(top: 15)),
            mainCell('usdt.png', '本阶段USDT剩余', '111').padding(EdgeInsets.only(bottom: 15)),
            minorCell(30,'1X=0.75U','1X=0.75U'),
            minorCell(40,'1X=0.75U','1X=0.75U'),
            minorCell(60,'1X=0.75U','1X=0.75U'),
            minorCell(30,'1X=0.75U','1X=0.75U').padding(EdgeInsets.only(bottom: 15)),
          ]).backImage()),


      Container(
          margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Column(children: <Widget>[
            mainCell('usdt.png', '当前赛季数量', '1231211')
                .padding(EdgeInsets.only(top: 15)),
            mainCell('usdt.png', '粒子分裂池剩余X数量', '111').padding(EdgeInsets.only(bottom: 15)),
          ]).backImage()),



      CommonButton(
        child: Text(S.of(context).CoinSplitNow),
        onPressed: () {

          Navigator.of(context).pushNamed(RouteName.CoinSplitBuy);
        },
      ).padding(EdgeInsets.only(top: 30, left: 15, right: 15)),

      Container(
            alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 30),
            child: Text(
              S.of(context).CoinSplitRecordButton,
              style:TextStyle(color: Color(0xff03F7591),fontSize: 13)
            ).click(onTap:(){
              Navigator.of(context).pushNamed(RouteName.CoinSplitRecord);
            })

            ),

    ]);
  }


//widget控件
  Widget mainCell(String image, String title, String context) {
    return Container(
      height: 38,
      alignment: Alignment.centerLeft,
      child: Stack(children: <Widget>[
        Container(
          // color: Colors.red,
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 20),
          child: Image.asset(
            ImageHelper.wrapAssets(image),
            fit: BoxFit.fill,
            width: 28,
            height: 28,
          ),
        ),
        Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 60),
            child: Text(
              title,
            )),
        Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20),
            child: Text(
              context,
            ))
      ]),
    );
  }

  Widget minorCell(int percentage,String title ,String context){
    return Container(
        height: 40,
        child: Stack(children: <Widget>[
          Container(
            margin: EdgeInsets.fromLTRB(10, 5, 10, 5),
            padding: EdgeInsets.fromLTRB(1, 2, 1, 2),
            alignment: Alignment.center,
            color: Color(0xff082E41),
            child: Flex(
            direction: Axis.horizontal,
              children: <Widget>[
            Expanded(
              flex: percentage,
              child: Container(
                color: Color(0xff1A516D),
              ),
            ),
            Expanded(
              flex: 100 - percentage,
              child: Container(
                height: 30.0,
                // color: Colors.green,
              ),
            ),
          ],
        ),
    ),

        
          Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 20),
            child: Text(
              title,
              style:TextStyle(color: Color(0xff00FF99))
            )),

          Container(
            alignment: Alignment.centerRight,
            padding: EdgeInsets.only(right: 20),
            child: Text(
              context,
              style:TextStyle(color: Color(0xff00FF99))
            )),


        ]),
    );
  }



}
