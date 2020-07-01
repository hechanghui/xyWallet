import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';

class AssetManageCell extends StatelessWidget {
  final String imageName;
  final String coin;
  final String address;
  final String nums;
  final String price;
  final GestureTapCallback onPressed;
  AssetManageCell(
      {Key key,
      this.imageName,
      this.coin,
      this.address,
      this.nums,
      this.price,
      this.onPressed})
      : super(key: key);

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
        alignment: Alignment.center,
        height: 90,
        child: InkWell(
          onTap: onPressed,
          child: Stack(children: <Widget>[
            Container(
              alignment: Alignment.center,
              margin: EdgeInsets.fromLTRB(15, 5, 15, 5),
              child: Image.asset(
                ImageHelper.wrapAssets('tabCommunityCellBG.png'),
                fit: BoxFit.fill,
                width: width - 30,
                height:80,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 30, top: 23),
              child: Image.asset(
                ImageHelper.wrapAssets(imageName),
                fit: BoxFit.fill,
                width: 28,
                height: 28,
              ),
            ),
            Container(
              alignment: Alignment.topLeft,
              padding: EdgeInsets.only(left: 68, top: 25),
              child: Text(
                coin,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(fontSize: 15, fontWeight: FontWeight.bold),
              ),
            ),
            Container(
              alignment: Alignment.bottomLeft,
              padding: EdgeInsets.only(left: 68, bottom: 25,right: 125,),
              child: Text(
                address,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: ThemeColors.labelLightColor, fontSize: 14),
              ),
            ),

Container(
              alignment: Alignment.topRight,
              padding: EdgeInsets.only(left: 300, top: 25, right: 35),
              child: Text(
                nums,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith( fontSize: 14),
              ),
),
            

            Container(
              
              alignment: Alignment.bottomRight,
              
              padding: EdgeInsets.only( bottom: 25, right: 35,left: width-90),
              // color: Colors.red,
              
              child: Text(
              
                price,
                maxLines: 1,
                overflow: TextOverflow.ellipsis,
                style: Theme.of(context)
                    .textTheme
                    .headline4
                    .copyWith(color: ThemeColors.labelLightColor, fontSize: 14),
              ),
            ),

          ]),
        ));
  }
}
