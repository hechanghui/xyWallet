import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';

class TabWalletCell extends StatelessWidget {
  final String imageName;
  final String title;

  TabWalletCell({
    Key key,
    this.imageName,
    this.title,
  }) : super(key: key);

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      
      alignment: Alignment.center,
      height: 60,
      child: Stack(children: <Widget>[
        Container(
          
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Image.asset(
            ImageHelper.wrapAssets('tabWalletCellBg.png'),
            fit: BoxFit.fill,
            width: width-30,
          ),
        ),
       Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 25),
          // width: 46,
          
          child: Image.asset(
            ImageHelper.wrapAssets(imageName),
            fit: BoxFit.fill,
            width: 30,
            height: 30,
          ),
        ), 

               Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 40),
          // width: 46,
          
          child: Image.asset(
            ImageHelper.wrapAssets('Icon_next.png'),
            fit: BoxFit.fill,
            width: 6,
            height: 11,
          ),
        ), 

         Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 71),
          
          
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline4.copyWith(fontWeight: FontWeight.bold,fontSize: 15),
          ),
        ), 

      ]),
    );
  }
}
