import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';

class AddressInfoCell extends StatelessWidget {

  final String title;
  final String iconName;
  final GestureTapCallback onPressed;

  AddressInfoCell({
    Key key,
    this.iconName,
    this.title,
    this.onPressed,
  }) : super(key: key);

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      height: 60,
      child: Stack(children: <Widget>[
        
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 30),
          child: InkWell(
            onTap: onPressed,
            child: Image.asset(
              ImageHelper.wrapAssets(iconName),
              fit: BoxFit.contain,
              width: 21,
              height: 21,
            ),
          ),
        ),
        
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 38, right: 75),
          
          child: Text(
            title,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(fontWeight: FontWeight.bold, fontSize: 15),
          ),
        ),
        
        Container(
          alignment: Alignment.bottomCenter,
          padding: EdgeInsets.only(left: 15, bottom: 6, right: 15),
          // height: 1,
          
          child: Container(
            color: ThemeColors.labelLightColor,
            height: 1,
          ),
        ),


       
      ]),
    );
  }
}
