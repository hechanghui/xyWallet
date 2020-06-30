import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/generated/l10n.dart';
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



  @override
  Widget buildBodyWidget(BuildContext context) {
    var assetManagerHeadBt = AssetManagerHeadBt(
                title: S.of(context).Charge,
                imageName: 'AssetCharge.png',
                onPressed: () {
                   Navigator.of(context).push(MaterialPageRoute(builder: (context) => coinList(coinType: CoinType.Charge)));
                },
              );
    return Container(
      // height: (MediaQuery.of(context).size.height),
      child: ListView(children: <Widget>[
        Row(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: <Widget>[
              assetManagerHeadBt,
              AssetManagerHeadBt(
                title: S.of(context).WithDraw,
                imageName: 'assetWithDraw.png',
                onPressed: () {
                  Navigator.of(context).push(MaterialPageRoute(builder: (context) => coinList(coinType: CoinType.WithDraw)));
                },
              ),
            ])
      ]),
    );
  }
}
