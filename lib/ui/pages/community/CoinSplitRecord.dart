import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/common/router/router_manager.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/service/bus.dart';
import 'package:xy_wallet/ui/pages/community/charge.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';



class CoinSplitRecord extends BaseWidget {


  @override
  getState() {
    return new Pages();
  }
}

class Pages extends BaseWidgetState<CoinSplitRecord> {
  @override
  String titleLabel(BuildContext context) => S.of(context).tabComTitle2;

  @override
  Widget buildBodyWidget(BuildContext context) {
    return Container(
        child: ListView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return cell('1X=0.75U','1000','123','2020.04.03_01:52:01');
      },
    ));
  }


  Widget cell(String title,String nums,String type,String date,){
    return Container(
      // height: 145,
      margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
      child:Column(children: <Widget>[
        cellWidget('兑换比例',title).padding(EdgeInsets.only(top:10)),
        cellWidget('兑换数量',nums),
        cellWidget('状态',type),
        Container(alignment: Alignment.centerRight,
          padding:EdgeInsets.fromLTRB(5, 5, 15, 15),
          child: Text(date,textAlign: TextAlign.right,style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14,color:ThemeColors.labelLightColor),)
          
        ),
        
        

      ]).backImage()


    );
  }

  Widget cellWidget(String title,String context){
    return Container(
      height: 35,
      child: Stack(children:<Widget>[
                Container(
            alignment: Alignment.centerLeft,
            padding: EdgeInsets.only(left: 20),
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

}

