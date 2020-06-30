import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';

class AssetManagerHeadBt extends StatelessWidget {
  final String imageName;
  final String title;
  final GestureTapCallback onPressed;

  AssetManagerHeadBt({Key key, this.imageName, this.title, this.onPressed})
      : super(key: key);

  Widget build(BuildContext context) {
    return Container(
      alignment: Alignment.center,
      width: 130,
      height: 130,
      child: InkWell(
          onTap: onPressed,
          child: Stack(children: <Widget>[
            Image.asset(
              ImageHelper.wrapAssets('assetMangerHead.png'),
              fit: BoxFit.fill,
              width: 130,
              height: 130,
            ),

             Container(
              alignment: Alignment.topCenter,
              padding: EdgeInsets.only(top: 40),
              child: Image.asset(
              ImageHelper.wrapAssets(imageName),
              fit: BoxFit.fill,
              width: 31,
              height: 31,
            ),
            ),

            Container(
              alignment: Alignment.bottomCenter,
              padding: EdgeInsets.only(bottom: 35),
              child: Text(
                title,
                style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 14,),
              ),
            ),
          ])),
    );
  }
}
