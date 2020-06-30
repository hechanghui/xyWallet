import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/common/helper/resource_helper.dart';
import 'package:xy_wallet/common/themes.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/pages/me/wight_me/adressCell.dart';
import 'package:xy_wallet/ui/widgets/tabMeCell.dart';

import 'addAddress.dart';

class AdressManger extends BaseWidget {
  @override
  getState() {
    return new Pages();
  }
}

class Pages extends BaseWidgetState<AdressManger> {

@override
  String titleLabel(BuildContext context) => S.of(context).AddressManagerTitle;
@override
  List<Widget> buildAppBarAction(BuildContext context) {
    return <Widget>[
          IconButton(icon: Icon(Icons.add), onPressed: () {
            Navigator.of(context).push(MaterialPageRoute(builder: (context) => AddAdress()));
          }),
        ];

  }
  @override
  final List datas = [
    {'name': 'hello', 'address': '0xdasdasd', 'note': 'dasdasdqdsa'},
    {'name': 'hello1', 'address': '0xdasd321asd', 'note': 'dasdsa'},
    {'name': 'hello2', 'address': '0xdasddasdasd', 'note': 'dsa'},
  ];

  Widget buildBodyWidget(BuildContext context) {
    

    return Container(
      child: ListView.builder(
          itemCount: 3,
          //  itemExtent: 50.0, //强制高度为50.0
          itemBuilder: (BuildContext context, int index) {
            //  var dic = datas[index],
            return Container(
                child: AddressCell(
              title: datas[index]['name'],
              address: datas[index]['address'],
              note: datas[index]['note'],
              onPressedChange: () {
                print('change');
              },
              onPressedQRCode: () {print('qr');},
              onPressedCopy: () {print('copy');},
              onPressedDel: () {print('del');},
            ));
          }),
    );
  }
}
