import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/extension/widget_ex.dart';

class WalletListCell extends StatelessWidget {
  final String address;
  final String title;
  final bool used;
  final GestureTapCallback onPressedSet;
  final GestureTapCallback onPressed;
  WalletListCell({
    Key key,
    this.address,
    this.title,
    this.used,
    this.onPressedSet,
    this.onPressed,
  }) : super(key: key);

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      height: 100,
      child: Stack(children: <Widget>[
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Image.asset(
            ImageHelper.wrapAssets('addressCellBg.png'),
            fit: BoxFit.fill,
            width: width - 30,
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          padding: EdgeInsets.only(right: 27, top: 20),
          child: InkWell(
            onTap: onPressedSet,
            child: Image.asset(
              ImageHelper.wrapAssets('walletSet.png'),
              fit: BoxFit.contain,
              width: 21,
              height: 21,
            ),
          ),
        ).click(onTap: onPressed),
       
       Offstage(
         offstage: !used,
        child: Container(
          alignment: Alignment.topRight,
          padding: EdgeInsets.only(right: 60, top: 23),
          
          child:Container(
            decoration: new BoxDecoration(
            //背景
            // color: Colors.white,
            //设置四周圆角 角度
            borderRadius: BorderRadius.all(Radius.circular(4.0)),
            //设置四周边框
            border: new Border.all(width: 1, color: Color(0xFF00FFAA)),
          ),
            // color: Color(0xFF00FFAA),
            child:Text(' 当前账户 ',style: TextStyle(color: Color(0xFF00FFAA),fontSize: 12),),

          ),
        ),
       ),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 40, top: 24),
          width: 200,
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(fontWeight: FontWeight.bold, fontSize: 17),
          ),
        ),

        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 38, top: 55, right: 40),
          child: Text(
            address,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline4.copyWith(
                fontSize: 14,
                color: Color(0xFF3FA0B3),
                fontWeight: FontWeight.bold),
          ),
        ),
      ]),
    );
  }
}
