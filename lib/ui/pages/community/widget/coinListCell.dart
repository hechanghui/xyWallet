import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';

class CoinListCell extends StatelessWidget {
  final String imageName;
  final String title;
  final String subTitle;
  final GestureTapCallback onPressed;
  
  CoinListCell({Key key, this.imageName, this.title, this.subTitle,this.onPressed})
      : super(key: key);

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      height: 70,
      child:InkWell(
        onTap: onPressed,
        child: Stack(children: <Widget>[
        Container(
          alignment: Alignment.center,
          margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
          child: Image.asset(
            ImageHelper.wrapAssets('tabCommunityCellBG.png'),
            fit: BoxFit.fill,
            width: width - 30,
          ),
        ),
        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 30),
          // width: 46,

          child: Image.asset(
            ImageHelper.wrapAssets(imageName),
            fit: BoxFit.fill,
            width: 35,
            height: 35,
          ),
        ),
                
        Container(
          alignment: Alignment.centerRight,
          padding: EdgeInsets.only(right: 40),
          
          child: Image.asset(
            ImageHelper.wrapAssets('Icon_next.png'),
            fit: BoxFit.fill,
            width: 6,
            height: 11,
          ),
        ), 

        Container(
          alignment: Alignment.centerLeft,
          padding: EdgeInsets.only(left: 80),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 15,fontWeight: FontWeight.bold),
          ),
        ),
        
      ]),
      ),

      
    );
  }
}
