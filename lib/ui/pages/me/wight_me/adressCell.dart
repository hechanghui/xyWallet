import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';

class AddressCell extends StatelessWidget {
  final String address;
  final String title;
  final String note;
  final GestureTapCallback onPressedChange;
  final GestureTapCallback onPressedCopy;
  final GestureTapCallback onPressedQRCode;
  final GestureTapCallback onPressedDel;
  AddressCell({
    Key key,
    this.address,
    this.title,
    this.note,
    this.onPressedChange,
    this.onPressedCopy,
    this.onPressedQRCode,
    this.onPressedDel,
  }) : super(key: key);

  Widget build(BuildContext context) {
    double width = MediaQuery.of(context).size.width;
    return Container(
      alignment: Alignment.center,
      height: 120,
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
            onTap: onPressedDel,
            child: Image.asset(
              ImageHelper.wrapAssets('icon_addressDel.png'),
              fit: BoxFit.contain,
              width: 21,
              height: 21,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          padding: EdgeInsets.only(right: 56, top: 20),
          child: InkWell(
            onTap: onPressedQRCode,
            child: Image.asset(
              ImageHelper.wrapAssets('icon_addressQR.png'),
              fit: BoxFit.contain,
              width: 21,
              height: 21,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          padding: EdgeInsets.only(right: 85, top: 20),
          child: InkWell(
            onTap: onPressedCopy,
            child: Image.asset(
              ImageHelper.wrapAssets('icon_addressCopy.png'),
              fit: BoxFit.contain,
              width: 21,
              height: 21,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topRight,
          padding: EdgeInsets.only(right: 114, top: 20),
          child: InkWell(
            onTap: onPressedChange,
            child: Image.asset(
              ImageHelper.wrapAssets('icon_addressChange.png'),
              fit: BoxFit.contain,
              width: 21,
              height: 21,
            ),
          ),
        ),
        Container(
          alignment: Alignment.topLeft,
          padding: EdgeInsets.only(left: 38, top: 24),
          width: 150,
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
          padding: EdgeInsets.only(left: 38, top: 48, right: 40),
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
        Container(
          alignment: Alignment.bottomLeft,
          padding: EdgeInsets.only(left: 38, bottom: 21, right: 40),
          child: Text(
            note,
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
