import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';

class InViteInfoCell extends StatelessWidget {
  final String address;
  final String reward;
  final String time;
  final String type;
  InViteInfoCell({Key key, this.address, this.reward, this.time, this.type})
      : super(key: key);

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      height: 130,
      child: Stack(children: <Widget>[
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Image.asset(
            ImageHelper.wrapAssets('tabCommunityCellBG.png'),
            fit: BoxFit.fill,
            width: width - 30,
            height: 120,
          ),
        ),


        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 30, top: 17),
          child: Text(
            S.of(context).address,
            style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14,color: Color(0xff3FA0B3),)
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          // width: width/2,
          
          padding: EdgeInsets.only(right: 30, top: 17,left: width/2),
          child: Text(
           address,               
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 15),
          ),
        ),
       
                Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 30, top: 42),
          child: Text(
            S.of(context).inviteTitle,
            style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14,color: Color(0xff3FA0B3),)
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          // width: width/2,
          
          padding: EdgeInsets.only(right: 30, top: 42,left: width/2),
          child: Text(
           reward,               
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 15),
          ),
        ),

                Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 30, top: 67),
          child: Text(
            S.of(context).time,
            style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14,color: Color(0xff3FA0B3),)
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          // width: width/2,
          
          padding: EdgeInsets.only(right: 30, top: 67,left: width/2),
          child: Text(
           time,               
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 15),
          ),
        ),

                Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 30, top: 94),
          child: Text(
            S.of(context).type,
            style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14,color: Color(0xff3FA0B3),)
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          // width: width/2,
          
          padding: EdgeInsets.only(right: 30, top: 94,left: width/2),
          child: Text(
           type,               
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 15),
          ),
        ),

  
      ]),
    );
  }
}
