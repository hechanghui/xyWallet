import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/pages/community/widget/AssetManagerCell.dart';
import 'package:xy_wallet/ui/pages/community/widget/AssetManagerHeadBt.dart';
import 'package:xy_wallet/ui/widgets/tabComCell.dart';

import 'coinList.dart';

class AssetManger extends BaseWidget {
  @override
  getState() {
    return new Pages();
  }
}

class Pages extends BaseWidgetState<AssetManger> {
  @override
  String titleLabel(BuildContext context) => S.of(context).assetManagerTitle;

  final List datas = [
    {
      'name': 'USDT',
      'address': '0xdasdasddasq',
      'num': '111',
      'price': '231',
    },
    {
      'name': 'USDT1',
      'address': '0xdasd321asd',
      'num': '222',
      'price': '231',
    },
    {
      'name': 'USDT2',
      'address': '0xdasdsdasdasdasdasdjhsabdiasgdiuqwgdiubuxsbhaxsa',
      'num': '333',
      'price': '21dsadsad.0'
    },
  ];

  @override
  Widget buildBodyWidget(BuildContext context) {
    var assetManagerHeadBt = AssetManagerHeadBt(
      title: S.of(context).Charge,
      imageName: 'AssetCharge.png',
      onPressed: () {
        Navigator.of(context).push(MaterialPageRoute(
            builder: (context) => CoinList(coinType: CoinType.Charge)));
      },
    );
    return Container(
      // height: (MediaQuery.of(context).size.height),
      child: Stack(children: <Widget>[
        Container(
          alignment: Alignment.topCenter,
          child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: <Widget>[
                assetManagerHeadBt,
                AssetManagerHeadBt(
                  title: S.of(context).WithDraw,
                  imageName: 'assetWithDraw.png',
                  onPressed: () {
                    Navigator.of(context).push(MaterialPageRoute(
                        builder: (context) =>
                            CoinList(coinType: CoinType.WithDraw)));
                  },
                ),
              ]),
        ),
        Container(
            // alignment: Alignment.topCenter,
            padding: EdgeInsets.only(top: 140, bottom: 30),
            child: ListView.builder(
                itemCount: 3,
                itemBuilder: (BuildContext context, int index) {
                  return Container(
                      child: AssetManageCell(
                    coin: datas[index]['name'],
                    address: datas[index]['address'],
                    nums: datas[index]['num'],
                    price: datas[index]['price'],
                    imageName: 'usdt.png',
                    onPressed: () {
                      print('11111');
                    },
                  ));
                })),
      ]),
    );
  }
}
