import 'package:xy_wallet/common/Base/base_widget.dart';
import 'package:flutter/material.dart';
import 'package:xy_wallet/generated/l10n.dart';
import 'package:xy_wallet/ui/pages/community/charge.dart';
import 'package:xy_wallet/ui/pages/community/widget/AssetManagerHeadBt.dart';
import 'package:xy_wallet/ui/pages/community/widget/coinListCell.dart';

enum CoinType {
  Charge,
  WithDraw,
  ChooseCoin,
}

class CoinList extends BaseWidget {
  CoinList({Key key, this.coinType});
  final CoinType coinType;

  @override
  getState() {
    return new Pages();
  }
}

class Pages extends BaseWidgetState<CoinList> {
  @override
  String titleLabel(BuildContext context) => S.of(context).ChooseCoin;

  @override
  Widget buildBodyWidget(BuildContext context) {
    return Container(
        // color: Colors.black12,
        // height: (MediaQuery.of(context).size.height),
        child: ListView.builder(
      itemCount: 3,
      itemBuilder: (BuildContext context, int index) {
        return Container(
            child: TabComCell(
          title: 'ERC20-USDT',
          imageName: 'usdt.png',
          onPressed: () {
             Navigator.of(context).push(MaterialPageRoute(builder: (context) =>Charge()));
          },
        ));
      },
    ));
  }
}
