import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';

class TabComCell extends StatelessWidget {
  final String imageName;
  final String title;
  final String subTitle;
  TabComCell({Key key, this.imageName, this.title, this.subTitle})
      : super(key: key);

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      height: 70,
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
            ImageHelper.wrapAssets('tabCommunityIcon.png'),
            fit: BoxFit.fill,
            width: 38,
            height: 38,
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 80, top: 15),
          child: Text(
            title,
            style: Theme.of(context).textTheme.headline4.copyWith(fontSize: 15),
          ),
        ),
        Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(left: 80, bottom: 16,right: 40),
          
          child: Text(
            subTitle,
                                  maxLines: 1,
                      overflow: TextOverflow.ellipsis,
            style: Theme.of(context)
                .textTheme
                .headline4
                .copyWith(color: ThemeColors.labelLightColor,fontSize: 12),
          ),
        ),
      ]),
    );
  }
}
