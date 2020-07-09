import 'package:flutter/material.dart';
import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:xy_wallet/common/router/router_manager.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/service/bus.dart';
import 'package:xy_wallet/service/httpService/http_server.dart';
import 'package:xy_wallet/service/httpService/result_data.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/ui/pages/home/widget/inViteInfoCell.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';

class InviteInfo extends BaseWidget {
  @override
  BaseWidgetState getState() => Page();
}

class Page extends BaseWidgetState<InviteInfo> {
  String titleLabel(BuildContext context) => S.of(context).inviteTitle;

  @override
  List<Widget> buildAppBarAction(BuildContext context) {
    return <Widget>[
      Container(
        alignment: Alignment.center,
        child: Text('TOP',
            style: Theme.of(context).textTheme.headline4.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
      ).click(onTap: () {

        
      }),
      Container(
        margin: EdgeInsets.only(right: 15),
        alignment: Alignment.center,
        child: Text('LUCK',
            style: Theme.of(context).textTheme.headline4.copyWith(
                  fontSize: 16,
                  fontWeight: FontWeight.bold,
                )),
      ).click(onTap: () {


      }),
    ];
  }

  @override
  Widget buildBodyWidget(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    // double height = MediaQuery.of(context).size.height;
    return Container(
        child: Stack(children: <Widget>[
      Container(
        // color: Colors.blue,
        width: width,
        height: 204,
        child: Stack(
          children: <Widget>[
            Image.asset(
              ImageHelper.wrapAssets('assetBG.png'),
              fit: BoxFit.fill,
              width: width,
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(bottom: 20),
              child: Text(
                '10000',
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: new TextStyle(
                    color: Color(0xFF00FFAA),
                    fontWeight: FontWeight.bold,
                    fontSize: 40),
              ),
            ),
            Container(
              alignment: Alignment.center,
              padding: EdgeInsets.only(top: 40),
              child: Text(
                S.of(context).rewardTotal,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                textAlign: TextAlign.center,
                style: new TextStyle(color: Color(0xFF00FFAA), fontSize: 14),
              ),
            ),
          ],
        ),
      ),
      Text('直接邀请人数:5').padding(EdgeInsets.only(top: 200, left: 20)),
      Container(
        padding: EdgeInsets.only(top: 230),
        child: ListView.builder(
            itemCount: 5,
            itemBuilder: (BuildContext context, int index) {
              return InViteInfoCell(
                address: '0x12322312',
                time: '2020.07.09',
                reward: '0.1',
                type: '奖励',
              );
            }),
      )
    ]) //滑动的方向 Axis.vertical为垂直方向滑动，Axis.horizontal 为水平方向
        );
  }
}


