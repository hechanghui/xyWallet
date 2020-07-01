import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';

class ComBtType2 extends StatelessWidget {
  final String title;
  final double hight;
  final double width;
  final EdgeInsetsGeometry padding;
  final GestureTapCallback onPressed;
  ComBtType2({Key key, this.title, this.hight, this.width, this.onPressed,this.padding})
      : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      // padding: padding,
        height:hight==0?hight:45,
        width:width==0?hight:230,
        child: InkWell(
          onTap: onPressed,
            child: Stack(children: <Widget>[
      Container(
        alignment: Alignment.center,
        padding: EdgeInsets.all(0),
        child: Image.asset(
          ImageHelper.wrapAssets('copyBg.png'),
          fit: BoxFit.fill,
        ),
      ),
      Container(
        alignment: Alignment.center,
        // padding: EdgeInsets.only(top: 40),
        child: Text(
          title,
          style: Theme.of(context)
              .textTheme
              .headline4
              .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
        ),
      ),
    ])));
  }
}
