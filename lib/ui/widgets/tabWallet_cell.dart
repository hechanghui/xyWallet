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
    return Stack(children: <Widget>[
      Image.asset(
        ImageHelper.wrapAssets(imageName),
        fit: BoxFit.fill,
        width: 50,
        height: 50,
      ),
      Container(
        alignment: Alignment.center,
        width: 50,
        padding: EdgeInsets.only(top: 40),
        child: Text(
          title,
          style: new TextStyle(color: Color(0xFF3FA0B3), fontSize: 11),
        ),
      ),
    ]);
  }
}
